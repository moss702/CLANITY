package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassInfo {
	// 이게 나중에 클래스 등록에 쓰이는 
	private Long classId;
	private Long businessId;
	private Long  categoryId;
	private String  title;
	private String  description;
	private int  duration;
	private int price;
	private Date createdAt;
	
	
	public ClassInfo(Long classId, Long businessId, Long categoryId, String title, String description, int duration,
			int price, Date createdAt) {
		super();
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
