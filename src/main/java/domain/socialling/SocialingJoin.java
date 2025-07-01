package domain.socialling;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class SocialingJoin {
	
	private Long joinId;
	private Long socialId;
	private Long memberId;
	private String joinedAt;
	
	public SocialingJoin(Long joinId, Long socialId, Long memberId, String joinedAt) {
		super();
		this.joinId = joinId;
		this.socialId = socialId;
		this.memberId = memberId;
		this.joinedAt = joinedAt;
	}
	

}
