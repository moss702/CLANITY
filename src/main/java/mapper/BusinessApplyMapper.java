package mapper;

import domain.BusinessApply;

import java.util.List;

public interface BusinessApplyMapper {

    // 신청 등록
    int insert(BusinessApply apply);

    // 전체 목록 조회
    List<BusinessApply> list();

    // 회원 ID로 조회
    BusinessApply findById(Long applyId);

    // 이메일로 조회
    List<BusinessApply> findByEmail(String email);
    // 대기중만 조회
    List<BusinessApply> listPending();

    // 관리자 승인/거절 처리
    int update(BusinessApply apply);
}
