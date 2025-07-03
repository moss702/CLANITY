package mapper;


import java.lang.module.ModuleDescriptor.Builder;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class MemberMapperTest {
	
	private MemberMapper memberMapper = MybatisUtil.getSqlSession().getMapper(MemberMapper.class);
	
	@Test
	@DisplayName("유저 정보 기입 테스트")
	public void singupTest() {
		Member member = Member.builder().email("2ys_2@naver.com").password("maplemaster99@@").build();
		log.info("{}", member);
		
		memberMapper.insert(member);
		log.info("{}",member);
	}
	
	@Test
	@DisplayName("단일 유저 출력 테스트")
	public void selectMemberTest() {
		String email = "email";
		
		Member member = memberMapper.findByEmail(email);
		log.info("{}", member);
	}
}
