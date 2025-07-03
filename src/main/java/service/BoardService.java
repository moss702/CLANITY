package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.BoardMapper;
import util.MybatisUtil;

@Slf4j
public class BoardService {
    public List<Board> list(Criteria cri) { 
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            List<Board> list = mapper.list(cri);
            long categoryId = mapper.getCount(cri);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Board findBy(Long boardId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.increaseCnt(boardId);
            Board board = mapper.selectOne(boardId);
            return board;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    


    public void write(Board board) {
    	SqlSession session = MybatisUtil.getSqlSession(false);
    	BoardMapper mapper = session.getMapper(BoardMapper.class);
        System.out.println("insert 직전!");
        mapper.insert(board);
        System.out.println("insert 완료!");
        session.commit();
    	
    }
    
    public void remove(Long boardId) {
	   	SqlSession session = MybatisUtil.getSqlSession(false);
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);

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