package mapper;

import java.util.List;

import domain.onedayClass.ClassInfo;

public interface ClassInfoMapper {
	// 클래스 정보 매퍼
	//->  나중에 페이지 처리 알아보기
	//추가 변경 삭제
	void insert(ClassInfo classInfo);
	
	void update(ClassInfo classInfo);
	
	void delete(Long classId);
	
	//클래스 조회, 단일 조회
	List<ClassInfo> list();
	ClassInfo selectOne(Long classId);
	
//	// 생성시 자동 번호 + 나중에
//	void increseCnt(Long classId);
	
//	클래스 강사 조회 나중에 넣기(멤버쪽인지 내쪽인지를 모르겠)
	

}
