package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import controller.endpoint.NotificationSocket;
import org.apache.ibatis.session.SqlSession;

import domain.AttachLink;
import domain.Board;
import domain.Member;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachLinkMapper;
import mapper.AttachMapper;
import mapper.BoardMapper;
import util.MybatisUtil;

@Slf4j
public class BoardService {
    public List<Board> listByGroup(Long groupId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            List<Board> list = mapper.listByGroup(groupId);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Board> list(Criteria cri) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            List<Board> list = mapper.list(cri);

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Board selectOne(Long bno) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.increaseCnt(bno);
            Board board = mapper.selectOne(bno);
            return board;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public void write(Board board) {

        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            Long boardId = board.getBoardId();

            if (boardId == null) {   // 답글이 아님 :: 신규 글
                mapper.insert(board);
                mapper.updateGrpMyself(board);
            } else {  // 답글임
                // 1. 부모글 조회 * 부모의 파라미터 가져와서 조정하기
                Board parent = mapper.selectOne(boardId);

                // 3. 해당 조건의 게시글들의 seq 밀기 = 내 위치에 작성하기 위한 update
                board.setGroupId(parent.getGroupId());
                board.setDepth(parent.getDepth()+1); //깊이 지정 * 부모보다 +1

                // insert * 답글 등록하기
                mapper.insertChild(board);
            }

            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);
            board.getAttachs().stream()
                    .peek(attachMapper::insert)
                    .map(a -> AttachLink.builder()
                            .uuid(a.getUuid())
                            .linkType("board")
                            .lno(board.getBoardId()).build())
                    .forEach(attachLinkMapper::insert);

            System.out.println("now category: " + board.getCategoryId());
            if(board.getCategoryId() == 3){ //공지글에 게시글 올라왔을경우
                NotificationSocket.broadcast( "지금 CLANITY의 새로운 소식이 올라왔어요!<br>" + board.getTitle());
            }
            else if(board.getCategoryId() == 2){ //공지글에 게시글 올라왔을경우
            	NotificationSocket.broadcast( "고객님의 문의에 답변이 달렸어요!<br>" + board.getTitle());
            }

            session.commit();
        } catch (Exception e) { //중간에 문제 있으면 롤백
            session.rollback();
            e.printStackTrace();
        } finally { //성공 또는 실패 상관없이 완료되면 세션 close
            session.close();
        }
    }

    public void modify(Board board) {
        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);

            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);
//            attachLinkMapper.list(AttachLink.builder().linkType("board").lno(board.getBoardId()).build())
//            .stream() // 현재 갖고있는 첨부파일 list 가져오기
//            .peek(attachLinkMapper::)
//            .map(AttachLink::getUuid)
//            .forEach(attachMapper::delete);

            // 기존 첨부파일의 메타데이터 제거
            attachLinkMapper.list(AttachLink.builder().linkType("board").lno(board.getBoardId()).build())
                    // 했는데 안끝내고 스트림!!
                    .stream()
                    .peek(attachLinkMapper::delete) // 스트림 안에서 al 삭제 * long
                    .map(AttachLink::getUuid) 		// uuid stream으로 변환 * 스트링
                    .forEach(attachMapper::delete);


            // 삭제? 지우고 다시 등록하기
            board.getAttachs().stream()
                    .peek(attachMapper::insert)
                    .map(a -> AttachLink.builder()
                            .uuid(a.getUuid())
                            .linkType("board")
                            .lno(board.getBoardId()).build())
                    .forEach(attachLinkMapper::insert);

            // 게시글 내용수정
            mapper.update(board);
            session.commit();
        } catch (Exception e) { //중간에 문제 있으면 롤백
            session.rollback();
            e.printStackTrace();
        } finally { //성공 또는 실패 상관없이 완료되면 세션 close
            session.close();
        }
    }

    // qna mylist * 내문의내역
    public List<Board> findQnaListByMember(Long memberId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper boardMapper = session.getMapper(BoardMapper.class);
            AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);
            AttachMapper attachMapper = session.getMapper(AttachMapper.class);

            List<Board> qnaList = boardMapper.selectQnaListByMember(memberId);

            // boardId 로그 찍기
            for (Board board : qnaList) {
                System.out.println("여기는 boardservice BoardId() = " + board.getBoardId());
            }

//            for (Board board : qnaList) {
//                // attach_link 테이블에서 연결된 attach_id 목록 가져오기
//                //List<Long> attachIds = attachLinkMapper.selectAttachlist("BOARD", board.getBoardId());
//
//                if (!attachIds.isEmpty()) {
//                    List<Attach> attaches = attachMapper.selectByIds(attachIds);
//                    board.setAttachList(attaches);
//                }
//            }


            return qnaList;
        }
    }

    public void remove(Long boardId) {
        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);

            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);
            // 보드아이디로 엮인 어테치링크 찾아서 리스트로 가져온다. * 이게 어태치링크매퍼의 list 호출..
            attachLinkMapper.list(AttachLink.builder().linkType("board").lno(boardId).build())
                    // 했는데 안끝내고 스트림!!
                    .stream()
                    .peek(attachLinkMapper::delete) // 스트림 안에서 al 삭제 * long
                    .map(AttachLink::getUuid) 		// uuid stream으로 변환 * 스트링
                    .forEach(attachMapper::delete);
            mapper.delete(boardId);
            session.commit();
        } catch (Exception e) { //중간에 문제 있으면 롤백
            session.rollback();
            e.printStackTrace();
        } finally { //성공 또는 실패 상관없이 완료되면 세션 close
            session.close();
        }
    }

    public long getCount(Criteria cri) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            return mapper.getCount(cri);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}