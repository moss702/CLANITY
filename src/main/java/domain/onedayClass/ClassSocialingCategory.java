package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassSocialingCategory {
	
	private Long categoryId;
	private boolean type;
	private String parentCategory;
	private String childCategory;
	

	
	
}
