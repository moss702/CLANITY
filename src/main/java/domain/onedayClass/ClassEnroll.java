package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassEnroll {

	private Long enrollId;
	private Long openId;
	private Long  memberId;
	private Date enrolledAt;
	private boolean status; 
	
	
	public ClassEnroll(Long enrollId, Long openId, Long memberId, Date enrolledAt, boolean status) {
		this.enrollId = enrollId;
		this.openId = openId;
		this.memberId = memberId;
		this.enrolledAt = enrolledAt;
		this.status = status;
	}
		
	
}
