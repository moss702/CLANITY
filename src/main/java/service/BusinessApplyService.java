package service;

import domain.BusinessApply;
import domain.dto.Criteria;
import mapper.BusinessApplyMapper;
import org.apache.ibatis.session.SqlSession;
import util.MybatisUtil;

import java.util.List;

public class BusinessApplyService {
    
    //신청등록
    public int insert(BusinessApply apply){
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BusinessApplyMapper mapper = session.getMapper(BusinessApplyMapper.class);
            session.commit();
            return mapper.insert(apply);
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
