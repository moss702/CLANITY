package mapper;

import org.junit.jupiter.api.Test;

import domain.onedayClass.ClassInfo;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class ClassInfoMapperTest {

	private ClassInfoMapper classInfoMapper = MybatisUtil.getSqlSession().getMapper(ClassInfoMapper.class);

	@Test
	public void insertTest() {
		ClassInfo classInfo = ClassInfo.builder().classId(9988L).businessId(9999L).categoryId(9999L).title("테스트")
				.description("테스트용")
				.price(5000).duration(100).build();
		log.info("{}", classInfo);
		classInfoMapper.insert(classInfo);

	log.info("{}", classInfo);

	}

}
