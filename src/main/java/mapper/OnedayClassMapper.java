package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import domain.onedayClass.OnedayClass;

public interface OnedayClassMapper {
	
	@Insert("INSERT INTO class (title, url) VALUES (#{title}, #{url})")
	void insert(OnedayClass onedayClass);
	
////	@Update
//	UPDATE class
//	SET 
//		class_id = #{categoryId}
//		business_id = #{business_id},
//		category_id = #{category_id},
//		description = #{description},
//		duration = #{duration},
//		created_at = #{created_at},
//		instructor_name = #{instructor_name},
//		review_count = #{categoryId},
//		difficulty = #{review_count},
//		detail_images = #{detail_images},
//		thumbnail_image = #{thumbnail_image},
//		address = #{address},
//		region = #{region},
//		price = #{price},
//	wHERE class_id = = #{categoryId};
////	void update(OnedayClass onedayClass);
}
