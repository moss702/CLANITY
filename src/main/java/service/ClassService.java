package service;

import org.apache.ibatis.session.SqlSession;

import domain.onedayClass.ClassInfo;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;

@Slf4j
public class ClassService {
	// 전역으로 빼기
	SqlSession session = MybatisUtil.getSqlSession();
	
	
	// 일단 조회 단일 조회 등록 수정 삭제

	
	// 등록
	public void register(ClassInfo classId) {
		try {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			mapper.insert(classId);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
	
}
