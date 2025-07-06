package mapper;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.MybatisUtil;

@Slf4j
public class ClassInfoMapperTest {

	private ClassInfoMapper classInfoMapper = MybatisUtil.getSqlSession().getMapper(ClassInfoMapper.class);

//	@Test
//	public void insertTest() {
//		ClassInfo classInfo = ClassInfo.builder().classId(9950L).businessId(9999L).categoryId(9999L).title("테스트")
//				.description("테스트용").price(5000).duration(100).build();
//		log.info("{}", classInfo);
//		classInfoMapper.insert(classInfo);
//
//		log.info("{}", classInfo);
//
//	}

//	@Test
//	@DisplayName("등록삭제 테스트")
//	public void deleteTest() {
//		Long classID = 9998L;
//		classInfoMapper.delete(classID);
//	}

//	@Test
//	@DisplayName("등록 클래스 변경 테스트")
//	public void updateTest() {
//		Long classId = 9998L;
//
//		ClassInfo classInfo = ClassInfo.builder().classId(9900L).categoryId(9909L).title("등록 클래스 변경")
//				.description("심화 제작 과정").duration(150).price(30000).build();
//
//		log.info("{}", classInfo);
//
//		classInfoMapper.update(classInfo);
//		log.info("{}", classInfo);
//
//	}
//
	@Test
	@DisplayName("목록 조회")
	public void classListTest() {

		List<OnedayClass> list = classInfoMapper.list2();

		list.forEach(c -> log.info("Class: {}", c));
	}
	
	
	 private final ClassService classService = new ClassService();
	
	 	@Test
	    @DisplayName("클래스 + 클래스 오픈 정보 등록 테스트")
	 	public void registerClassWithOpenTest() {

	        // 1. OnedayClass 생성
	        ClassInfo classInfo = ClassInfo.builder()
	                .title("sss")
	                .description("ss!")
	                .description2("도자ss세 소개")
	                .duration(120)
	                .price(40000)
	                .discount(10)
	                .discountPrice(36000)
	                .instructorName("홍길동")
	                .difficulty("입문")
	                .curriculum("1. 기본 모양 잡기\n2. 유약 바르기")
	                .hostIntroduction("10년 경력 강사입니다")
	                .thumbnailImages("thumb.jpg")
	                .detailImages("detail1.jpg,detail2.jpg")
	                .instructorImageUrl("instructor.jpg")
	                .address("서울시 마포구")
	                .region("서울")
	                .classType("0") // 원데이
	                .url("https://example.com/class/123")
	                .createdAt(Date.valueOf(LocalDate.now()))
	                .build();

	        // 2. ClassOpen 생성
	        ClassOpen classOpen = new ClassOpen();
	        classOpen.setMinParticipants(2);
	        classOpen.setMaxParticipants(6);
	        classOpen.setStatus(true);
	        // 3. 등록
	        assertDoesNotThrow(() -> {
	            classService.register(classInfo, classOpen);
	            log.info("등록된 classId = {}", classInfo.getClassId());
	        });
	     // 4. 검증
	        assertNotNull(classInfo.getClassId());
	        assertTrue(classInfo.getClassId() > 0);
	    }
	}
	
	

//	@Test
//	@DisplayName("단일조회")
//	public void selectOneTest() {
//		Long classId = 9999L;
//		List<ClassInfo> list = classInfoMapper.list();
//		ClassInfo classInfo =
//				
//		classInfoMapper.selectOne(classId);
//		log.info("{}", classInfo);
//		

//	}



