package service;

import domain.Board;
import domain.BoardCategory;
import domain.dto.Criteria;
import mapper.BoardCategoryMapper;
import mapper.BoardMapper;
import org.apache.ibatis.session.SqlSession;
import util.MybatisUtil;

import java.util.List;

public class BoardCategoryService {
    public List<BoardCategory> list() {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardCategoryMapper mapper = session.getMapper(BoardCategoryMapper.class);
            List<BoardCategory> list = mapper.list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
