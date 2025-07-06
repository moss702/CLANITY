package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import domain.onedayClass.OnedayClass;

public interface OnedayClassMapper {

	@Insert("INSERT INTO class (title, url) VALUES (#{title}, #{url})")
	void insert(OnedayClass onedayClass);

	List<OnedayClass> selectAllUrls();
	
	
	@Update("""
			UPDATE class SET
			  description = #{description},
			  description2 = #{description2},
			  class_type = #{classType},
			  duration = #{duration},
			  instructor_name = #{instructorName},
			  difficulty = #{difficulty},
			  detail_images = #{detailImages},
			  thumbnail_image = #{thumbnailImages},
			  address = #{address},
			  region = #{region},
			  curriculum = #{curriculum},
			  host_introduction = #{hostIntroduction},
			  instructor_image_url = #{instructorImageUrl}
			WHERE url = #{url}
			""")
	void update(OnedayClass onedayClass);
	
	

}
