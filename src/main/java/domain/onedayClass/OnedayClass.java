package domain.onedayClass;


import java.sql.Date;
import java.time.LocalDate;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
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
	private int classType;

	// open 생성자

	private Long openId;
	private Long masterId;
	private String minParticipants;
	private String maxParticipants;
	private boolean isAvailable;
	private Date scheduleDate;
	private String startTime;
	private String endTime;
	private boolean status;
	

	// 기본 생성자
	public OnedayClass() {
	}

	// 테스트용 간단 생성자
	public OnedayClass(Long classId, String title, String url) {
		this.classId = classId;
		this.title = title;
		this.url = url;
	}
	
	public ClassInfo getClassInfo() {
		return ClassInfo.builder()
				.title("title")
				.businessId("businessId")
                .description("description")
                .description2("description2")
                .duration("duration")
                .discountPrice("discountPrice")
                .instructorName("instructorName")
                .difficulty("difficulty")
                .curriculum("curriculum")
                .hostIntroduction("hostIntroduction")
                .thumbnailImages("thumbnailImages")
                .detailImages("detailImages")
                .instructorImageUrl("instructorImageUrl")
                .address("address")
                .region("region")
                .classType("classType") // 원데이
                .createdAt(Date.valueOf(LocalDate.now()))
				.build();
	}
	
	public ClassOpen getClassOpen() {
		return ClassOpen
				.builder()
				.maxParticipants("minParticipants")
				.maxParticipants("maxParticipants")
				.status(true)
				.isAvailable(true)
				.build();
	}

}


   
    
