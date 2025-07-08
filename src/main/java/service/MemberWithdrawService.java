package service;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import domain.MemberWithdraw;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberMapper;
import mapper.MemberWithdrawMapper;
import util.MybatisUtil;
import util.PasswordEncoder;

@Slf4j
public class MemberWithdrawService{
	
	
	public int withdrawRuest(MemberWithdraw withdraw) {
		try(SqlSession session = MybatisUtil.getSqlSession()){	
			log.info("서비스에서 안되는걸까? :{}",withdraw);
			MemberWithdrawMapper mapper = session.getMapper(MemberWithdrawMapper.class);
			return mapper.insert(withdraw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}	
}
