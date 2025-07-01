package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassSocialingCategory {
// 나중에 시간같은 자동으로 부여되는 것들은 삭제하기
	
	private String categoryId;
	private String name;
	private int type;// 나중에 enum으로 설정(20개...)
	
	public ClassSocialingCategory(String categoryId, String name, int type) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		this.type = type;
	}
	
}
