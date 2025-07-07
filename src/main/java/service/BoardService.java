package service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachLink;
import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachLinkMapper;
import mapper.AttachMapper;
import mapper.BoardMapper;
import util.MybatisUtil;

@Slf4j
public class BoardService {

    public List<Board> list(Criteria cri) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            return mapper.list(cri);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    public Board findBy(Long boardId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.increaseCnt(boardId);
            return mapper.selectOne(boardId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void write(Board board) {
        SqlSession session = MybatisUtil.getSqlSession(false); // autoCommit = false
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.insert(board);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    
    // 유틸을 따로 빼자니 삭제 항목이 다 달라서,
    // 각 도메인마다 remove(bno) 메서드 필요! ㅠ.ㅠ)a
    // 해당 부분 교체해서 사용 바랍니다.
    public void remove(Long boardId) {
        SqlSession session = MybatisUtil.getSqlSession(false);

        try {
            BoardMapper boardMapper = session.getMapper(BoardMapper.class);
            AttachLinkMapper linkMapper = session.getMapper(AttachLinkMapper.class);
            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            UploadService uploadService = new UploadService();

            // 1. 해당 게시글의 attachLink 목록 조회
            List<AttachLink> linkList = linkMapper.findByTarget("board", boardId);
            List<Long> attachIds = linkList.stream()
                                           .map(AttachLink::getAttachId)
                                           .collect(Collectors.toList());

            // 2. attachLink 삭제
            linkMapper.deleteByTarget("board", boardId);

            // 3. attach 테이블 + 서버 파일 삭제 (고아 파일 delete합니다.)
            for (Long attachId : attachIds) {
                Long refCount = linkMapper.countLinkAttachId(attachId);
                if (refCount == 0) {
                    Attach attach = attachMapper.findById(attachId);
                    attachMapper.delete(attachId);
                    uploadService.deleteFile(attach.getPath(), attach.getFileName(), attach.getOriginalName(), attach.getImage());
                }
            }
            // 4. 게시글 삭제
            boardMapper.delete(boardId);
            session.commit();
            
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    
    
	public void modify(Board board) {
	   	SqlSession session = MybatisUtil.getSqlSession(false);
		try {
	        BoardMapper mapper = session.getMapper(BoardMapper.class);
	        mapper.update(board);
	        session.commit();
	    } catch (Exception e) {
	    	session.rollback(); 
	        e.printStackTrace();
	    } finally {
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
    
    
    // qna mylist * 내문의내역
    public List<Board> findQnaListByMember(Long memberId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper boardMapper = session.getMapper(BoardMapper.class);
            AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);
            AttachMapper attachMapper = session.getMapper(AttachMapper.class);

            List<Board> qnaList = boardMapper.selectQnaListByMember(memberId);

//            for (Board board : qnaList) {
//                // attach_link 테이블에서 연결된 attach_id 목록 가져오기
//                List<Long> attachIds = attachLinkMapper.selectAttachlist("BOARD", board.getBoardId());
//
//                if (!attachIds.isEmpty()) {
//                    List<Attach> attaches = attachMapper.selectByIds(attachIds);
//                    board.setAttachList(attaches);
//                }
//            }

            return qnaList;
        }
    }

}
