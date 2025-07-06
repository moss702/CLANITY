package service;

import org.apache.ibatis.session.SqlSession;

import domain.AttachLink;
import mapper.AttachLinkMapper;
import util.MybatisUtil;

public class AttachLinkService {

    public void save(AttachLink link) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            AttachLinkMapper mapper = session.getMapper(AttachLinkMapper.class);
            mapper.insert(link);
        }
    }

}
