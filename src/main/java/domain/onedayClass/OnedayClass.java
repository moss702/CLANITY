package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class OnedayClass {
// 나중에 시간같은 자동으로 부여되는 것들은 삭제하기
	private String classId;
	private String businessId;
	private String  categoryId;
	private String  title;
	private String  description;
	private int  duration;
	private int price;
	private Date createdAt;
	
	
	public OnedayClass(String classId, String businessId, String categoryId, String title, String description,
			int duration, int price, Date createdAt) {
		
		this.classId = classId;
		this.businessId = businessId;
		this.categoryId = categoryId;
		this.title = title;
		this.description = description;
		this.duration = duration;
		this.price = price;
		this.createdAt = createdAt;
	}
	
	
}
