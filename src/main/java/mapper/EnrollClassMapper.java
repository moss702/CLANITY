package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.onedayClass.ClassEnroll;

public interface EnrollClassMapper {
	
	// 신청 등록 추가
	void insert(ClassEnroll classEnroll);
	
	// 모든 등록 신청자 조회
	List<ClassEnroll> list (Long openId) ;
	
	// 이넘 사용법 다시 보기
	// 신청 정보 변경
//	void update(Long enrollId);- 두개 매세드  나중에 확인 하고 일단 상태만 처리
	void update(@Param(value = " enrollId")Long enrollId  ,@Param(value = " status")Boolean status);
	
	
	// 신청 정보 단일 조회
	void selcetOne(Long enrollId);
	
	// 신청 정보 삭제
	void delete(Long enrollId);
	
	
}
