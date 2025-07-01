package domain.socialling;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class SocialingJoin {
	
	private String join_id;
	private String social_id;
	private String member_id;
	private String joined_at;
	private String status;
	

}
