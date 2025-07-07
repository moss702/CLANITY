package domain.onedayClass;

import java.sql.Date;

import domain.en.ClassOpenEn;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@AllArgsConstructor
@Data
public class ClassOpen {
	
	private Long classId;
	private Long openId;
	private Long masterId;
	private String scheduleDate;
	private String startTime;
	private String endTime;
	private int minParticipants;
	private int maxParticipants;
	private int price;
	private boolean isAvailable;
	private boolean status;
	
	public ClassOpen() {}
	
	public ClassOpen(boolean status, int minParticipants, int maxParticipants) {
		super();
		this.status = true;
		this.minParticipants = minParticipants;
		this.maxParticipants = maxParticipants;
	}
	
	

}
