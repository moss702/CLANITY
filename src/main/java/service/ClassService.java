package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.OnedayClass;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassCardMapper;
import mapper.ClassInfoMapper;
import mapper.OnedayClassMapper;

@Slf4j
public class ClassService {

	// 등록

//	public void register22(OnedayClass onedayClass) {
//		SqlSession session = MybatisUtil.getSqlSession();
//		// try-with-resources: 사용 후 자동으로 세션 닫힘
//		try {
//			OnedayClassMapper mapper = session.getMapper(OnedayClassMapper.class);
//			// 1 classId
//			mapper.insertRegister(onedayClass);
//
//			session.commit();
//
//		} catch (Exception e) {
//			log.error("클래스 등록 실패", e);
//			throw new RuntimeException("클래스 등록 중 오류 발생", e); // 서블릿에서 감지 가능
//		} finally {
//			session.close();
//		}
//	}
	
	
	public void register(OnedayClass onedayClass) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		try {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			mapper.insertClassInfo(onedayClass);

			// 1 classId 가져고오 나서
			// 2 open Insert
			onedayClass.setMasterId(onedayClass.getClassId());

			mapper.insertClassOpen(onedayClass);
			session.commit();

		} catch (Exception e) {
			log.error("클래스 등록 실패", e);
			
		} finally {
			session.close();
		}
	}

	// 카드 필요한 정보
	public List<OnedayClass> card() {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassCardMapper mapper = session.getMapper(ClassCardMapper.class);
			return mapper.selectAll();
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	// 카드 카테고리 별 정리
	public List<OnedayClass> cardByCategory(Long categoryId) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassCardMapper mapper = session.getMapper(ClassCardMapper.class);
			return mapper.selectByCategory(categoryId);

		}
	}

}