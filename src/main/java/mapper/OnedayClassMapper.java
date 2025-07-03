package mapper;

import org.apache.ibatis.annotations.Insert;

import domain.onedayClass.OnedayClass;

public interface OnedayClassMapper {
	
	@Insert("INSERT INTO class (title, url) VALUES (#{title}, #{url})")
	void insert(OnedayClass onedayClass);

}
