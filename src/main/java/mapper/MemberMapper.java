package mapper;

import java.util.List;

import domain.Member;

public interface MemberMapper {
	
	List<Member> select(); // 모든 member의 모든 정보 출력
	
	Member findById(Long memberId);
	Member findByEmail(String member_id);
	
	int insert(Member member); //member의 회원가입
	
	int delete(Long memberId);
}
