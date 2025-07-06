package mapper;

import java.util.List;


import domain.onedayClass.OnedayClass;

public interface ClassCardMapper {
	
	

	List<OnedayClass> selectAll () ;
	List<OnedayClass> selectByCategory (Long categoryId) ;
	
	
}
