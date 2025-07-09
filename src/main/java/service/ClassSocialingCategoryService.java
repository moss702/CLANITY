package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.GsonBuilder;

import domain.onedayClass.ClassSocialingCategory;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassSocialingCategoryMapper;
import util.MybatisUtil;

@Slf4j
public class ClassSocialingCategoryService {
	
	private static int listCategoryCount = 0;
	private static int listCategory2JsonCount = 0;
	
	
	// 리스트 조회
	public List<ClassSocialingCategory> listCategory() {
		
		listCategoryCount++;
		log.info("[Service] listCategory() 호출 {}회", listCategoryCount);
		
		
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			log.info("[Service] listCategory() - 커넥션 획득 완료: {}", session.getConnection());
			ClassSocialingCategoryMapper mapper = session.getMapper(ClassSocialingCategoryMapper.class);
			List<ClassSocialingCategory> result = mapper.list();
			log.info("[Service] listCategory() - 조회된 항목 수: {}", result.size());
			return result;
//			return mapper.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String listCategory2Json() {
		
		listCategory2JsonCount++;
		log.info("[Service] listCategory2Json() 호출 {}회", listCategory2JsonCount);
		
		String json = new GsonBuilder().setPrettyPrinting().create().toJson(listCategory());
		log.info("[Service] listCategory2Json() - JSON 길이: {} bytes", json.length());
		
//		return new GsonBuilder().setPrettyPrinting().create().toJson(listCategory());
		return json;
	}
	
}
