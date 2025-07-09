package service;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import domain.MemberWithdraw;
import domain.en.Gender;
import domain.en.MemberStatus;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberMapper;
import mapper.MemberWithdrawMapper;
import util.MybatisUtil;
import util.PasswordEncoder;

@Slf4j
public class MemberWithdrawService{
	
	
	public int withdrawRuest(MemberWithdraw withdraw) { //탈퇴 요청 목록에삽입
		try(SqlSession session = MybatisUtil.getSqlSession()){
			MemberWithdrawMapper mapper = session.getMapper(MemberWithdrawMapper.class);
			withdraw.setEmailMasked(PasswordEncoder.encode(withdraw.getEmailMasked()));
			return mapper.insert(withdraw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<MemberWithdraw> withdrawList(){ //탈퇴 목록 요청 검색
		try(SqlSession session = MybatisUtil.getSqlSession()){
			MemberWithdrawMapper mapper = session.getMapper(MemberWithdrawMapper.class);
			return mapper.list();
		}catch (Exception e) {
			e.getStackTrace();
		}
		return null;
	}
	
	public void deactivateMember(Long memberId) {//원래 회원 목록 변경
		SqlSession session = MybatisUtil.getSqlSession(false);
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			Member member = mapper.findById(memberId);
			if(member ==null);
			
			member.setEmail(PasswordEncoder.encode(member.getEmail()));
			member.setNickname("탈퇴한 사용자입니다");
			member.setPhone(null);
			member.setStatus(MemberStatus.DEACTIVATED);
			member.setGender(Gender.UNSPECIFIED);
			
			mapper.update(member);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.getStackTrace();
		}finally {
			session.close();
		}
	}
	
	
//	memberWithdrawMapper.list()
}
