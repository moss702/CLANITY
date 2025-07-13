package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachLink;
import domain.dto.Criteria;
import domain.onedayClass.ClassSocialingCategory;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachLinkMapper;
import mapper.AttachMapper;
import mapper.ClassInfoMapper;
import mapper.ClassSocialingCategoryMapper;
import util.MybatisUtil;

@Slf4j
public class ClassService {

	public void register(OnedayClass onedayClass) {
	    SqlSession session = MybatisUtil.getSqlSession();

	    try {
	        ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
	        AttachMapper attachMapper = session.getMapper(AttachMapper.class);
	        AttachLinkMapper attachLinkMapper = session.getMapper(AttachLinkMapper.class);

	        // 1. class_info 등록 → class_id 채번
	        mapper.insertClassInfo(onedayClass);  // 이 시점에 onedayClass.classId가 생성됨
	        onedayClass.setMasterId(onedayClass.getClassId());

	        // 2. 첨부파일이 있을 경우
	        if (onedayClass.getAttachs() != null && !onedayClass.getAttachs().isEmpty()) {
	            for (int i = 0; i < onedayClass.getAttachs().size(); i++) {
	                Attach a = onedayClass.getAttachs().get(i);

	                // 2-1. attach 테이블에 insert
	                attachMapper.insert(a);

	                // 2-2. attach_link 테이블에 insert
	                AttachLink link = AttachLink.builder()
	                        .uuid(a.getUuid())
	                        .linkType("class") // 또는 "onedayClass"
	                        .lno(onedayClass.getClassId())
	                        .build();
	                attachLinkMapper.insert(link);
	            }
	        }

	        // 3. class_open 등록
	        mapper.insertClassOpen(onedayClass);

	        // 4. 커밋
	        session.commit();

	    } catch (Exception e) {
	        session.rollback();
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
	public OnedayClass detailPageInfo(OnedayClass onedayClass) {
		SqlSession session = MybatisUtil.getSqlSession();
		try  {
			ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
			return  mapper.listClassDetailPage(onedayClass);
			
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