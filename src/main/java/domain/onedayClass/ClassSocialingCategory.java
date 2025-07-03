package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassSocialingCategory {
	
	private Long categoryId;
	private String name;
	
	public ClassSocialingCategory(Long categoryId, String name) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		
	}
	
	
	
}
