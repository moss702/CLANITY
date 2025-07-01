package domain.onedayClass;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class ClassEnroll {
// 나중에 시간같은 자동으로 부여되는 것들은 삭제하기
	private String enrollId;
	private String openId;
	private String  memberId;
	private Date enrolledAt;
	private int  status; // 나중에 enum으로 설정
	
	
	public ClassEnroll(String enrollId, String openId, String memberId, Date enrolledAt, int status) {
		super();
		this.enrollId = enrollId;
		this.openId = openId;
		this.memberId = memberId;
		this.enrolledAt = enrolledAt;
		this.status = status;
	}
	
	
	
}
