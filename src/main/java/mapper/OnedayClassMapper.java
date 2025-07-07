package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import domain.onedayClass.OnedayClass;

public interface OnedayClassMapper {

	@Insert("INSERT INTO class (title, url) VALUES (#{title}, #{url})")
	void insertMin(OnedayClass onedayClass);

	List<OnedayClass> selectAllUrls();
	
	
//	@Insert("""
//			INSERT INTO class 
//			(title, description, description2, price, class_type,  duration,  instructor_name, difficulty, detail_images, thumbnail_image,address ,  region, curriculum,   host_introduction, instructor_image_url , url )
//			values
//			   (#{title}, #{description},#{description2}, #{price}, #{classType},
//			   #{duration}, #{instructorName},#{difficulty}, #{detailImages}, #{thumbnailImages},#{address}, #{region},#{curriculum}, #{hostIntroduction}, #{instructorImageUrl}, #{url})
//			""")
//	void insertRegister(OnedayClass onedayClass);
	
	

}
