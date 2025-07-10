package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.onedayClass.ClassEnroll;
import domain.onedayClass.OnedayClass;

public interface EnrollClassMapper {
	
	// 신청 등록 추가
	void insertEnroll(OnedayClass onedayClass);
	
	// 모든 등록 신청자 조회
	List<OnedayClass> listEnroll (Long openId) ;
	
	// 이넘 사용법 다시 보기
	// 신청 정보 변경
//	void update(Long enrollId);- 두개 매세드  나중에 확인 하고 일단 상태만 처리
//	void update(@Param(value = " enrollId")Long enrollId  ,@Param(value = " status")Boolean status);
	
	
	// 신청 정보 단일 조회
	OnedayClass enrollListOne(@Param("enrollId") Long enrollId, @Param("openId") Long openId, @Param("memberId") Long memberId);
	
	// 신청 정보 삭제
	void delete(Long enrollId);
	
	
}
