package domain.socialling;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Socialing {
	private String joinId;
	private String socialId;
	private String memberId;
	private String joinedAt;
//	private String status; // enum 만들기	
	private String start_time; // 표기용 String

	
	
}
