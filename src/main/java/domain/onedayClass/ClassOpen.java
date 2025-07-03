package domain.onedayClass;

import java.sql.Date;

import domain.en.ClassOpenEn;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ClassOpen {
	// 나중에 시간같은 자동으로 부여되는 것들은 삭제하기
	private Long openId;
	private Long  masterId;
	private String scheduleDate; // 표기용 String
	private String startTime;
	private String endTime; 
	private String maxParticipants;
	private ClassOpenEn status; // 상태 기본 값 open
	
	
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
