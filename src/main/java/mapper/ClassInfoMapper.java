package mapper;

import java.util.List;

import domain.dto.Criteria;
import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.OnedayClass;

public interface ClassInfoMapper {
	// 클래스 정보 매퍼
	//->  나중에 페이지 처리 알아보기
	
	//추가

	void insertClassInfo(OnedayClass onedayClass);
	void insertClassOpen(OnedayClass onedayClass);
	
	//클래스 정보 수정 - 나중에 클래스 아이디 기준으로 수정
	void update(OnedayClass onedayClass);
	
	// 클래스 삭제 나중에 클래스 아이디 기준으로 삭제 가 되어야 함
	void delete(Long classId);
	
	//클래스 단일 선택
	
	OnedayClass selectOneCategoryId(Long categoryId);
	
	// 클래스 전체 조회(클래스 정보 전부 가져올때 필요)
	List<OnedayClass> listClass(Criteria cri);
	
	
	// 클래스 카테고리 별 단일 리스트 조회
	List<OnedayClass> listClassInfoOne(Long categoryId);
	
	
	// 정보 수정 관련해서 
	List<OnedayClass> listOnedayClass(Long categoryId);
	// 보드 매퍼 쪽에서 가져옴나중에 클래스 아이디나 오픈아이디 기준으로 리스트 조회할거)
//	List<OnedayClass> list(Criteria cri);
	long getCount(Criteria cri);
	
	
//	// 생성시 자동 번호 + 나중에
//	void increseCnt(Long classId);
	
	

}
