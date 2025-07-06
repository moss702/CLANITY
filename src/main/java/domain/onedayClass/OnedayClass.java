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

	// 기본 생성자
	public OnedayClass() {
	}

	// 테스트용 간단 생성자
	public OnedayClass(Long classId, String title, String url) {
		this.classId = classId;
		this.title = title;
		this.url = url;
	}

	public OnedayClass(String description, String description2, int duration, Date createdAt, String instructorName,
			String difficulty, String curriculum, String hostIntroduction, String thumbnailImages, String detailImages,
			String instructorImageUrl, String address, String region, String classType) {
		super();
		this.description = description;
		this.description2 = description2;
		this.duration = duration;
		this.createdAt = createdAt;
		this.instructorName = instructorName;
		this.difficulty = difficulty;
		this.curriculum = curriculum;
		this.hostIntroduction = hostIntroduction;
		this.thumbnailImages = thumbnailImages;
		this.detailImages = detailImages;
		this.instructorImageUrl = instructorImageUrl;
		this.address = address;
		this.region = region;
		this.classType = classType;
	}
	
	

	

	
}
