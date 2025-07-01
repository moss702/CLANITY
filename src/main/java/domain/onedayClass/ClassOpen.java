package domain.onedayClass;

import java.sql.Date;

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
	
	
}
