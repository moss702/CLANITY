package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassSocialingCategory {
// 나중에 시간같은 자동으로 부여되는 것들은 삭제하기
	
	private Long categoryId;
	private String name;
	
	public ClassSocialingCategory(Long categoryId, String name) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		
	}
	
	
	
}
