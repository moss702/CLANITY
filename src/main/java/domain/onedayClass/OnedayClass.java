package domain.onedayClass;


import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;


import domain.Attach;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

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
	private String duration;
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
	
//	enroll 
	private Long enrollId;
	private Long  memberId;
	private Date enrolledAt;

	// open 생성자

	private Long openId;
	private Long masterId;
	private int minParticipants;
	private int maxParticipants;
	private int currentParticipants;
	private boolean isAvailable;
	private LocalDate scheduleDate;
	private LocalTime startTime;
	private LocalTime endTime;
	private boolean status;

	
	private List<Attach> attachs;

	// 기본 생성자
	public OnedayClass() {
	}

	// 테스트용 간단 생성자
	public OnedayClass(Long classId, String title, String url) {
		this.classId = classId;
		this.title = title;
		this.url = url;
	}
	public OnedayClass(Long categoryId) {
		this.categoryId = categoryId;
		
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
				.status(true)
				.isAvailable(true)
				.build();
	}
	public ClassEnroll getClassEnroll() {
		return ClassEnroll 
				.builder()
				.openId(openId)
				.memberId(memberId)
				.enrolledAt(Date.valueOf(LocalDate.now()))
				.status(true)
				.build();
	}
	public void  setClassEnroll(ClassEnroll enroll) {
		if (enrollId == null) return;
		

		this.enrollId = enroll.getEnrollId();
		this.openId = enroll.getOpenId();
		this.memberId = enroll.getMemberId();
		this.enrolledAt = enroll.getEnrolledAt();
		this.status = enroll.isStatus();
	}
	
	
}


   
    
