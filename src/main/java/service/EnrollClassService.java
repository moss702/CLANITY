package service;

import org.apache.ibatis.session.SqlSession;

import domain.onedayClass.ClassEnroll;
import domain.onedayClass.ClassInfo;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;
import mapper.EnrollClassMapper;

@Slf4j
public class EnrollClassService {
	// 전역으로 빼기
	SqlSession session = MybatisUtil.getSqlSession();
	
	
	// 일단 클래스 신청 조회 단일 조회 등록 수정 삭제

	
	// 등록
	public void register(ClassEnroll enroll) {
		try {
			EnrollClassMapper mapper = session.getMapper(EnrollClassMapper.class);
			mapper.insert(enroll);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
	
}
