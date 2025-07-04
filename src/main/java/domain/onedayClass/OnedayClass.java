package domain.onedayClass;

import java.sql.Date;

import lombok.Data;

@Data
public class OnedayClass {

	// 기본 필드
	private Long classId;
	private Long businessId;
	private Long categoryId;
	private String title;
	private String description;
	private int duration;
	private Date createdAt;
	private int price;
	private String url;

	// 추가 ㄷ
	private int discountPrice;

	private String instructorName;

	private String difficulty;

	private String curriculum;

	private String hostIntroduction;

	private String thumbnailImage;

	private String detailImages;

	private String instructorImageUrl;

	private String address;

	private String region;
	private String classType;

	// 기본 생성자
	public OnedayClass() {
	}

	// 테스트용 간단 생성자
	public OnedayClass(String title, String url) {
		this.title = title;
		this.url = url;
	}

	public OnedayClass(Long classId, Long businessId, Long categoryId, String title, String description, int duration,
			Date createdAt, int price, String url, int discountPrice, String instructorName, String difficulty,
			String curriculum, String hostIntroduction, String thumbnailImage, String detailImages,
			String instructorImageUrl, String address, String region, String classType) {
		super();
		this.classId = classId;
		this.businessId = businessId;
		this.categoryId = categoryId;
		this.title = title;
		this.description = description;
		this.duration = duration;
		this.createdAt = createdAt;
		this.price = price;
		this.url = url;
		this.discountPrice = discountPrice;
		this.instructorName = instructorName;
		this.difficulty = difficulty;
		this.curriculum = curriculum;
		this.hostIntroduction = hostIntroduction;
		this.thumbnailImage = thumbnailImage;
		this.detailImages = detailImages;
		this.instructorImageUrl = instructorImageUrl;
		this.address = address;
		this.region = region;
		this.classType = classType;
	}

	
}
