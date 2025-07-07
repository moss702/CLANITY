package domain.onedayClass;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@AllArgsConstructor
@Builder
@Data
public class ClassInfo {
	// 이게 나중에 클래스 등록
	 private Long classId;
	    private Long businessId;
	    private Long categoryId;
	    private String title;
	    private String description;
	    private String description2;
	    private String duration;
	    private Date createdAt;
	    private String price;
	    private String url;
	    private String discount;
	    private String discountPrice;
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
	    
	    
		public ClassInfo(Long businessId) {
			super();
			this.businessId = businessId;
		}
	
}
