package domain.onedayClass;

import java.sql.Date;

import controller.open.OnedayClassServletSuccess;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
public class OnedayClass {

	// 기본 필드
	private Long classId;
	private Long businessId;
	private Long categoryId;
	private String title;
	private String description;
	private String description2;
	private int duration;
	private Date createdAt;
	private int price;
	private String url;

	// 추가
	private int discount;
	private int discountPrice;

	private String instructorName;

	private String difficulty;

	private String curriculum;

	private String hostIntroduction;

	private String thumbnailImages;

	private String detailImages;

	private String instructorImageUrl;

	private String address;

	private String region;
	private String classType;

	// open 생성자

	private Long openId;
	private Date scheduleDate;
	private String startTime;
	private String endTime;

	// 기본 생성자
	public OnedayClass() {
	}

	// 테스트용 간단 생성자
	public OnedayClass(Long classId, String title, String url) {
		this.classId = classId;
		this.title = title;
		this.url = url;
	}

}
