package mapper;

import java.util.List;

import domain.onedayClass.ClassOpen;

public interface ClassOpenMapper {

	// 클래스 추가
	void insert(ClassOpen classOpen);
	// 모든 클래스 정보 조회
	List<ClassOpen> list();

	// 클래스 단일 정보 조회
	ClassOpen selectOne(Long openId);


}
