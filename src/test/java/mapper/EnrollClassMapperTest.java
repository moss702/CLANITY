package mapper;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.onedayClass.ClassEnroll;
import domain.onedayClass.ClassInfo;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class EnrollClassMapperTest {

	private EnrollClassMapper enrollClassMapper = MybatisUtil.getSqlSession().getMapper(EnrollClassMapper.class);

	@Test
	public void insertTest() {
		ClassEnroll classEnroll = ClassEnroll.builder()
				.enrollId(8029L)
				.openId(9999L)
				.memberId(9999L)
				.status(false)
				.enrolledAt(Date.valueOf(LocalDate.now())) 
				.build();
		log.info("{}", classEnroll);
		enrollClassMapper.insert(classEnroll);

		log.info("{}", classEnroll);

		
	}

//	@Test
//	@DisplayName("등록삭제 테스트")
//	public void deleteTest() {
//		Long enrollID = 8024L;
//		enrollClassMapper.delete(enrollID);
//		
//	}
////
//	@Test
//	@DisplayName("신청 클래스 변경 테스트")
//	public void updateTest() {
//		Long enrollID = 9999L;
////
////
////	
////	}
//
//	@Test
//	@DisplayName("목록 조회")
//	public void classListTest() {
//
//		List<ClassEnroll> list = enrollClassMapper.list();
//
//		list.forEach(c -> log.info("Class: {}", c));
//	}
//
//	@Test
//	@DisplayName("단일조회")
//	public void selectOneTest() {
//		Long enrollID = 9999L;
//	
//		ClassInfo classInfo =
//				
//				enrollClassMapper.selectOne(enrollID);
//		log.info("{}", classInfo);
//		

//	}

}
