package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachLink;
import mapper.AttachLinkMapper;
import util.MybatisUtil;

public class AttachLinkService {
// DB attach_link 테이블의 데이터를 조회, 삭제, 링크수(boardId 1개에 달린 attach의 개수) 확인

    public void save(AttachLink link) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            mapper.insert(link);
            session.commit();
        }
    }    
    
    public List<AttachLink> findByTarget(String targetType, Long targetId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            return mapper.findByTarget(targetType, targetId);
        }
    }

    public void deleteByTarget(String targetType, Long targetId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            mapper.deleteByTarget(targetType, targetId);
            session.commit();
        }
    }

    public int countLinkByAttachId(Long attachId) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            return mapper.countLinkAttachId(attachId);
        }
    }
}
