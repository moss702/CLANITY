package service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import controller.attach.UploadFile;
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
    
    // 유틸을 따로 빼자니 삭제 항목이 다 달라서, 각 도메인마다 remove(attachId) 메서드 사용합니다 ㅠ.ㅠ)a
    // targetType(ex.CategoryType)와 targetId(ex.boardId) 부분 교체해서 사용 바랍니다.
    public void remove(Long boardId) {
    	AttachLinkService linkService = new AttachLinkService();  // 각 서비스에서 세션 열고 닫음
    	AttachService attachService = new AttachService();
    	UploadService uploadService = new UploadService();        // 서버에 저장된 물리파일 삭제

    	// 1. AttachLink 조회 : 해당 boardId의 link 존재여부 확인해서 attachIds List 생성.
    	List<AttachLink> links = linkService.findByTarget("board", boardId);
    	List<Long> attachIds = links.stream()
    	                            .map(AttachLink::getAttachId)
    	                            .toList();

    	// 2. AttachLink 삭제 
    	linkService.deleteByTarget("board", boardId);

    	// 3. 고아파일 삭제 : 
    	for (Long attachId : attachIds) {
    	    int count = linkService.countLinkByAttachId(attachId);
    	    if (count == 0) {
    	        Attach attach = attachService.findById(attachId);              // attachId 조회
    	        attachService.delete(attachId);                                // attachId 삭제
    	        uploadService.deleteFile(									   // 물리파일 삭제
    	            attach.getPath(),
    	            attach.getFileName(),
    	            attach.getFileName(),
    	            attach.getImage()
    	        );
    	    }
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

            // ✅ boardId 로그 찍기
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

}
