package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.dto.Criteria;
import domain.onedayClass.ClassSocialingCategory;
import domain.onedayClass.OnedayClass;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;
import mapper.ClassSocialingCategoryMapper;

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
//	url 추가
public void updateUrlLink(OnedayClass onedayClass) {
	SqlSession session = MybatisUtil.getSqlSession();

	try {
		ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
		mapper.updateUrl(onedayClass);
		session.commit();

	} catch (Exception e) {
		log.error(" url  등록 실패", e);

	} finally {
		session.close();
	}
}

	// 상세페이지 필요한 정보
	public OnedayClass detailPageInfo(Long classId, Long openId) {
		SqlSession session = MybatisUtil.getSqlSession();
		try  {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return  mapper.listClassDetailPage(classId, openId);
			
		} catch (Exception e) {
			log.error(" 상세페이지 조회 실패", e);
			return null;
		} finally {
			session.close();
		}

	}

	// 클래스 카테고리 별 정리 (카테고리 아이디별정리)
//	// 카드 필요한 정보
//	public List<OnedayClass> cardInfo(Criteria cri) {
//		try (SqlSession session = MybatisUtil.getSqlSession()) {
//			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
//			return mapper.cardInfo(cri);
//		}
//
//	}
	
	
	// 클래스 카테고리 별 정리 (카테고리 아이디별정리)
	public List<OnedayClass> classList(Criteria cri) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return mapper.listClass(cri);
		  } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return null;
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
//	이거 필요함 페이지 네이션에 필요 (카테고리 목록 조회나 클래스 목록 조회에 필요함)
	public long getCount(Criteria cri) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return mapper.getCount(cri);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	// 카테고리 리스트 목록 조회 서비스
	
	public List<ClassSocialingCategory> getCategories() {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassSocialingCategoryMapper mapper = session.getMapper(ClassSocialingCategoryMapper.class);
			return mapper.list();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
		}
	   		
	
}	