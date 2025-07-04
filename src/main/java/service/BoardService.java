package service;

import java.util.Collections;
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

    public void remove(Long boardId) {
        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.delete(boardId);
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
}
