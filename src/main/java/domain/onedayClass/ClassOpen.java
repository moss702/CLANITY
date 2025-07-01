package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ClassOpen {
	// 나중에 시간같은 자동으로 부여되는 것들은 삭제하기
	private String open_id;
	private String  master_id;
	private String schedule_date; // 표기용 String
	private String start_time;
	private String end_time; 
	private String max_participants;
	private int status;// 나중에 enum으로 설정(7개)
	public ClassOpen(String open_id, String master_id, String schedule_date, String start_time, String end_time,
			String max_participants, int status) {
		super();
		this.open_id = open_id;
		this.master_id = master_id;
		this.schedule_date = schedule_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.max_participants = max_participants;
		this.status = status;
	}
	
	
}
