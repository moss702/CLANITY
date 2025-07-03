package domain.onedayClass;

import java.sql.Date;

import domain.en.ClassOpenEn;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ClassOpen {
	
	private Long openId;
	private Long  masterId;
	private String scheduleDate; 
	private String startTime;
	private String endTime; 
	private String maxParticipants;
	private ClassOpenEn status; 
	
	
	public ClassOpen(Long openId, Long masterId, String scheduleDate, String startTime, String endTime,
			String maxParticipants, ClassOpenEn status) {
		super();
		this.openId = openId;
		this.masterId = masterId;
		this.scheduleDate = scheduleDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.maxParticipants = maxParticipants;
		this.status = status;
	}
	
	
	
}
