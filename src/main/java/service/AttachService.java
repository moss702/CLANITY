package service;

import org.apache.ibatis.session.SqlSession;
import domain.Attach;
import mapper.AttachMapper;
import util.MybatisUtil;

public class AttachService {

    public Attach selectOne(String uuid) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachMapper mapper = session.getMapper(AttachMapper.class);
            return mapper.selectOne(uuid);
        }
    }

    public Long save(Attach attach) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachMapper mapper = session.getMapper(AttachMapper.class);
            mapper.insert(attach);
            return attach.getAttachId();
        }
    }
}