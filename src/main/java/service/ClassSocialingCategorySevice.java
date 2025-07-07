package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.GsonBuilder;

import domain.onedayClass.ClassSocialingCategory;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassSocialingCategoryMapper;
import util.MybatisUtil;

@Slf4j
public class ClassSocialingCategorySevice {
	// 리스트 조회
	public List<ClassSocialingCategory> listCategory() {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ClassSocialingCategoryMapper mapper = session.getMapper(ClassSocialingCategoryMapper.class);
			return mapper.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String listCategory2Json() {
		return new GsonBuilder().setPrettyPrinting().create().toJson(listCategory());
	}
	
}
