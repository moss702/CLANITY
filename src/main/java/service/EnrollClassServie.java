package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.dto.Criteria;
import domain.onedayClass.ClassEnroll;
import domain.onedayClass.OnedayClass;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;
import mapper.EnrollClassMapper;

@Slf4j
public class EnrollClassServie {

	public void enrollClass(OnedayClass onedayClass) {
		SqlSession session = MybatisUtil.getSqlSession();

		try {
			EnrollClassMapper mapper = session.getMapper(EnrollClassMapper.class);
			mapper.insertEnroll(onedayClass);

			// 1 classId 가져고오 나서
			// 2 open Insert
			onedayClass.setMasterId(onedayClass.getClassId());
			onedayClass.setMasterId(onedayClass.getOpenId());
			onedayClass.setMasterId(onedayClass.getMemberId());

			mapper.insertEnroll(onedayClass);
			session.commit();

		} catch (Exception e) {
			log.error("클래스 신청 실패", e);

		} finally {
			session.close();
		}
	}
	public void enrollList(Long enrollId) {
		SqlSession session = MybatisUtil.getSqlSession();

		try {
			EnrollClassMapper mapper = session.getMapper(EnrollClassMapper.class);
			OnedayClass onedayClass = new OnedayClass();
			onedayClass.setMasterId(onedayClass.getClassId());
			onedayClass.setMasterId(onedayClass.getOpenId());
			onedayClass.setMasterId(onedayClass.getMemberId());

			mapper.listEnroll(enrollId);
			session.commit();

		} catch (Exception e) {
			log.error("클래스 신청 조회 실패", e);

		} finally {
			session.close();
		}
	}

	
	
}	