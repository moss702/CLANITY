package mapper;


import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import util.RedisUtil;

public class RedisUtilTest {

	@Test
	@DisplayName("redis 연결 테스트")
	public void testSetAndGet() {
		RedisUtil.setWithExpire("test:key", "hello", 10);
		String value = RedisUtil.get("test:key");
		
		assertEquals("hello",value);
	}
}
