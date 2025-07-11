package service;

import domain.AttachLink;
import domain.BusinessApply;
import domain.dto.Criteria;
import mapper.AttachLinkMapper;
import mapper.AttachMapper;
import mapper.BusinessApplyMapper;
import org.apache.ibatis.session.SqlSession;
import util.MybatisUtil;

import java.util.List;

public class BusinessApplyService {
    
    //신청등록
    public int insert(BusinessApply apply){
        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);

            mapper.insert(apply);
            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);
            apply.getAttachs().stream()
                    .peek(attachMapper::insert)
                    .map(a -> AttachLink.builder()
                            .uuid(a.getUuid())
                            .linkType("businessApply")
                            .lno(apply.getApplyId()).build())
                    .forEach(attachLinkMapper::insert);
            session.commit();
            return 1;
        } catch (Exception e){
            session.rollback();
            e.printStackTrace();
            return 0;
        }
        finally {
            session.close();
        }
    }
    
    //전체 목록 조회
    public List<BusinessApply> list(){
        try(SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            return mapper.list();
        }
    }
    
    //대기상태만 조회
    public List<BusinessApply> ListPending(){
        try(SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            return mapper.listPending();
        }
    }
    //단건조회 (apply_id)
    public BusinessApply findById(Long applyId){
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            return mapper.findById(applyId);
        }
    }

    //이메일 기준으로 전체 조회
    public List<BusinessApply> findByEmail(String email) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            return mapper.findByEmail(email);
        }
    }

    //대기상태중인 신청만 조회
    public List<BusinessApply> listPending(){
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            return mapper.listPending();
        }
    }

    // 관리자 승인/거절 처리
    public int updateStatus(BusinessApply apply) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            int result = mapper.update(apply);
            session.commit(); // 트랜잭션 커밋
            return result;
        }
    }
}
