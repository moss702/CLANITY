package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachLink;
import mapper.AttachLinkMapper;
import util.MybatisUtil;

public class AttachLinkService {

    public void save(AttachLink link) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            mapper.insert(link);
            session.commit();
        }
    }

    public List<Attach> findByTarget(String targetType, Long targetId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            return mapper.attachList(targetType, targetId);
        }
    }
    
    
}
