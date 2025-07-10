package mapper;


import java.lang.module.ModuleDescriptor.Builder;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Member;
import domain.MemberWithdraw;
import domain.en.Gender;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class MemberWithdrawMapperTest {
	
	private MemberWithdrawMapper memberWithdrawMapper = MybatisUtil.getSqlSession().getMapper(MemberWithdrawMapper.class);
	
	@Test
	@DisplayName("탈퇴 신청 테스트")
	public void singupTest() {
		
		MemberWithdraw request = MemberWithdraw.builder()
				.memberId(1L)
				.emailMasked("이것은 이메일2")
				.nicknameMasked("이것은 닉네임2")
				.build();
		
		
		memberWithdrawMapper.insert(request);
		log.info("{}", request);
	}
	
	@Test
	@DisplayName("탈퇴자 예정자 목록 출력 테스트")
	public void listTest() {
		log.info("{}",memberWithdrawMapper.list());
	}
	
	@Test
	@DisplayName("탈퇴자 목록에서 유저 출력 테스트")
	public void selectTest() {
		String email = "$2a$10$Nrf372jG8J8XzILA211.2.9F6xbwlSbcnKUu7vNeG3yeI7aGsw/Ba";
		log.info("{}",memberWithdrawMapper.selectByEmail(email));
	}
}
