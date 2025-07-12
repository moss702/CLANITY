package domain.onedayClass;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;

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
	private LocalDate scheduleDate;
	private LocalTime startTime;
	private LocalTime endTime;
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
	
	public ClassOpen getClassOpen() {
		return ClassOpen
				.builder()
				.status(true)
				.isAvailable(true)
				.build();
	}
	

}
