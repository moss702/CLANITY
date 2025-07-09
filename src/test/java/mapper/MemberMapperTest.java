package mapper;


import java.lang.module.ModuleDescriptor.Builder;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Member;
import domain.en.Gender;
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
		String email = "tiger2ys98@gmail.com";
		
		Member member = memberMapper.findByEmail(email);
		log.info("{}", member);
	}
	
	@Test
	@DisplayName("유저 인증 정보 출력 테스트")
	public void updateMemberEmailVerified() {
		String email = "testtest@naver.com";
		
		memberMapper.updateEmailverified(email);
		Member member = memberMapper.findByEmail(email);
	}
	
	@Test
	@DisplayName("단일 유저 정보 수정 테스트")
	public void updateMember() {
		String email = "user1006@example.com";
		Member member = memberMapper.findByEmail(email);
		log.info("선택한 유저 정보 : {}", member);
		
		member.setNickname("샘플데이터");
//		member.setPhone("445711114");
//		member.setGender(Gender.FEMALE);
		memberMapper.update(member);
		log.info("수정된 정보 {}",member);
	}
	
	@Test
	@DisplayName("유저 정보 softdelete update 테스트")
	public void updateWithdraw() {
		Member member = memberMapper.findById(1005L);
		log.info("선택한 유저 정보 : {}", member);
		
	}
}
