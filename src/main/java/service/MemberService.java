package service;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberMapper;
import util.MybatisUtil;
import util.PasswordEncoder;

@Slf4j
public class MemberService{
	
//	public int register(Member member) {
//		try(SqlSession session = MybatisUtil.getSqlSession()){
//			MemberMapper mapper = session.getMapper(MemberMapper.class);
//			member.setPassword(PasswordEncoder.encode(member.getPassword()));
//			return mapper.insert(member);
//		}
//		catch (Exception e){
//			e.printStackTrace();
//		}
//		return 0;
//	}
	
    public int register(Member member) {
        SqlSession session = MybatisUtil.getSqlSession();
        try {
            MemberMapper mapper = session.getMapper(MemberMapper.class);
            member.setPassword(PasswordEncoder.encode(member.getPassword()));
            return mapper.insert(member);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return 0;
    }
	
//	public Member findByEmail(String email) {
//		try(SqlSession session = MybatisUtil.getSqlSession()){
//			MemberMapper mapper = session.getMapper(MemberMapper.class);
//			return mapper.findByEmail(email);
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
    
    public Member findByEmail(String email) {
        SqlSession session = MybatisUtil.getSqlSession();
        try {
            MemberMapper mapper = session.getMapper(MemberMapper.class);
            return mapper.findByEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
	
	public boolean login(String email, String password) {
		Member member = findByEmail(email);
		if(member == null) {
			return false;
		}
		return PasswordEncoder.matches(password, member.getPassword());
	}
	
//	public boolean updateEmailVerified(String email) {
//		try (SqlSession session = MybatisUtil.getSqlSession()){
//			MemberMapper mapper = session.getMapper(MemberMapper.class);
//			return  mapper.updateEmailverified(email) > 0;
//		} catch (Exception e) {
//			e.getStackTrace();
//		}
//		return false;
//	}
	
    public boolean updateEmailVerified(String email) {
        SqlSession session = MybatisUtil.getSqlSession();
        try {
            MemberMapper mapper = session.getMapper(MemberMapper.class);
            return mapper.updateEmailverified(email) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }

//	public void modify(Member member) {
//		try (SqlSession session = MybatisUtil.getSqlSession()){
//			MemberMapper mapper = session.getMapper(MemberMapper.class);
//			mapper.updateOne(member);
//		}catch (Exception e) {
//			e.getStackTrace();
//		}
//		
//	}
    
    public void modify(Member member) {
        SqlSession session = MybatisUtil.getSqlSession();
        try {
            MemberMapper mapper = session.getMapper(MemberMapper.class);
            mapper.updateOne(member);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

	
}
