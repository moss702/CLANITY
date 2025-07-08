package mapper;

import org.junit.jupiter.api.Test;

import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class BoardMapperTest {

	private BoardMapper boardMapper = MybatisUtil.getSqlSession().getMapper(BoardMapper.class);
	
	@Test
	public void testList() {
		boardMapper.list(new Criteria(1, 10, 2L)).forEach(b -> log.info("{}", b));
	}
	
}


