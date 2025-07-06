package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


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
	    private int duration;
	    private Date createdAt;
	    private int price;
	    private String url;
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
	
}
