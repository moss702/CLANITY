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

@Slf4j
public class ClassService {

	// 등록
	public void register(ClassInfo classInfo, ClassOpen classOpen) {
		SqlSession session = MybatisUtil.getSqlSession();
		// try-with-resources: 사용 후 자동으로 세션 닫힘
		try {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			// 1 classId
			mapper.insert(classInfo);

			// 2 open Insert
			classOpen.setClassId(classInfo.getClassId());

			mapper.insertClassOpen(classOpen);
			session.commit();

		} catch (Exception e) {
			log.error("클래스 등록 실패", e);
			throw new RuntimeException("클래스 등록 중 오류 발생", e); // 서블릿에서 감지 가능
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