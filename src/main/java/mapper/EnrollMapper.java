package mapper;

import java.sql.Date;
import java.util.List;

import domain.en.EnrollStatus;
import domain.onedayClass.ClassEnroll;

public interface EnrollMapper {
	// 신청 등록 추가
	void insert(ClassEnroll enroll);
	// 모든 등록 신청자 조회
	List<ClassEnroll> list (Long openId) ;
	// 이넘 사용법 다시 보기
//	void insert(EnrollStatus status);
	// 신청 정보 변경
//	void update(Long enrollId);- 두개 매세드 ㄴ 나중에 확인 하고 일단 상태만 처리
	void update(EnrollStatus status);
	// 신청 정보 조회
	void selecet(Long enrollId);
	// 신청 정보 단일 조회
	void secetOne(Long enrollId);
	// 신청 정보 삭제
	void delete(Long enrollId);
	
	
	
	
	//void delete(String );
	//void deleteByBno(Long bno);


}
