package domain.socialling;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Socialing {
	//나중에 삭제할거 삭제 
	private Long socialId;
	private Long creator_id;
	private String title;
	private String content;
	private String meetDate;
	private String startTime; // 표기용 String
	private String endTime; // 표기용 String
	private String location;
	private int  maxPeople;
	private String createdAt;
	
	
	public Socialing(Long socialId, Long creator_id, String title, String content, String meetDate, String startTime,
			String endTime, String location, int maxPeople, String createdAt) {
		super();
		this.socialId = socialId;
		this.creator_id = creator_id;
		this.title = title;
		this.content = content;
		this.meetDate = meetDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.maxPeople = maxPeople;
		this.createdAt = createdAt;
	}
	
	
}
