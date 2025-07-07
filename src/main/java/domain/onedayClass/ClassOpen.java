package domain.onedayClass;

import java.sql.Date;

import domain.en.ClassOpenEn;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//@NoArgsConstructor
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
	private String minParticipants;
	private String maxParticipants;
	private int price;
	private boolean isAvailable;
	private boolean status;
	
	public ClassOpen() {}
	
	public ClassOpen(boolean status, String minParticipants, String maxParticipants) {
		super();
		this.status = true;
		this.minParticipants = minParticipants;
		this.maxParticipants = maxParticipants;
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
