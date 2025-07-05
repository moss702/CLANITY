package mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import domain.onedayClass.OnedayClass;

public interface OnedayClassMapper {

	@Insert("INSERT INTO class (title, url) VALUES (#{title}, #{url})")
	void insert(OnedayClass onedayClass);

	@Update("""
			UPDATE class SET
			  description = #{description},
			  duration = #{duration},
			  instructor_name = #{instructorName},
			  difficulty = #{difficulty},
			  detail_images = #{detailImages},
			  thumbnail_image = #{thumbnailImage},
			  address = #{address},
			  region = #{region},
			  price = #{price},
			  discount_price = #{discountPrice},
			  curriculum = #{curriculum},
			  host_introduction = #{hostIntroduction},
			  instructor_image_url = #{instructorImageUrl}
			WHERE url = #{url}
			""")
	void update(OnedayClass onedayClass);

}
