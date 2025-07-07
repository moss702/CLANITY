package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.ClassSocialingCategory;
import domain.onedayClass.OnedayClass;

public interface ClassSocialingCategoryMapper {
	
	@Select("select * from class_socialing_category csc where type = 0 order by category_id")
	List<ClassSocialingCategory> list();

}
