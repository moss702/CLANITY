package mapper;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.onedayClass.ClassInfo;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class ClassInfoMapperTest {

	private ClassInfoMapper classInfoMapper = MybatisUtil.getSqlSession().getMapper(ClassInfoMapper.class);

	@Test
	public void insertTest() {
		ClassInfo classInfo = ClassInfo.builder().classId(9950L).businessId(9999L).categoryId(9999L).title("테스트")
				.description("테스트용").price(5000).duration(100).build();
		log.info("{}", classInfo);
		classInfoMapper.insert(classInfo);

		log.info("{}", classInfo);

	}

//	@Test
//	@DisplayName("등록삭제 테스트")
//	public void deleteTest() {
//		Long classID = 9998L;
//		classInfoMapper.delete(classID);
//	}

	@Test
	@DisplayName("등록 클래스 변경 테스트")
	public void updateTest() {
		Long classId = 9998L;

		ClassInfo classInfo = ClassInfo.builder().classId(9900L).categoryId(9909L).title("등록 클래스 변경")
				.description("심화 제작 과정").duration(150).price(30000).build();

		log.info("{}", classInfo);

		classInfoMapper.update(classInfo);
		log.info("{}", classInfo);

	}

	@Test
	@DisplayName("목록 조회")
	public void classListTest() {

		List<ClassInfo> list = classInfoMapper.list();

		list.forEach(c -> log.info("Class: {}", c));
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

}
