package mapper;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.UUID;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;
import util.RedisUtil;

@Slf4j
public class RedisUtilTest {

	@Test
	@DisplayName("token인증 성공 테스트")
	public void testSetAndGet() {
		String uuid = UUID.randomUUID().toString();
		String key = "email_verify:" + uuid;
		String email = "test@email.com";
		
		
		RedisUtil.setWithExpire(key, email, 20);
		String resultEmail = RedisUtil.get(key);
		
		assertEquals(email, resultEmail);
		log.info("사용자 입력 이메일 :{}, 레디스에 저장된 이메일:{}", email, resultEmail);
	}
	@Test
	@DisplayName("token 타임아웃 테스트")
	public void testTmeout() throws InterruptedException {
		String uuid = UUID.randomUUID().toString();
		String key = "email_verify:" + uuid;
		String email = "test@email.com";
		
		
		RedisUtil.setWithExpire(key, email, 3);
		
		Thread.sleep(10000L);
		
		String resultEmail = RedisUtil.get(key);
		
		assertNull(resultEmail);
		log.info("사용자 입력 이메일 :{}, 레디스에 저장된 이메일:{}", email, resultEmail);
	}
	
	
}
