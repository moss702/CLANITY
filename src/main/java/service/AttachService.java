package service;

import org.apache.ibatis.session.SqlSession;
import domain.Attach;
import mapper.AttachMapper;
import util.MybatisUtil;

public class AttachService {
// DB attach 테이블의 데이터를 조회, 삭제합니다.
	
    public void save(Attach attach) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachMapper mapper = session.getMapper(AttachMapper.class);
            mapper.insert(attach);
            session.commit();
        }
    }
    
    public Attach findById(Long attachId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachMapper mapper = session.getMapper(AttachMapper.class);
            return mapper.findById(attachId);
        }
    }

    public void delete(Long attachId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachMapper mapper = session.getMapper(AttachMapper.class);
            mapper.delete(attachId);
            session.commit();
        }
    }
    
}