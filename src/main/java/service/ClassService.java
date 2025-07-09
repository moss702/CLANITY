package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.dto.Criteria;
import domain.onedayClass.OnedayClass;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;

@Slf4j
public class ClassService {

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
	public List<OnedayClass> cardInfo(Criteria cri) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return mapper.listClass(cri);
		}

	}

	// 카드 카테고리 별 정리 (카테고리 아이디별정리)
	public List<OnedayClass> cardByCategory(Long categoryId) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return mapper.listClassInfoOne(categoryId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
//	이거 필요?
	public long getCount(Criteria cri) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return mapper.getCount(cri);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
}	