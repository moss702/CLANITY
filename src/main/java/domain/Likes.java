package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Likes {
	private Long likeId;     // 좋아요 고유 ID
	private Long boardId;    // 좋아요 누른 게시글 번호
	private Long memberId;   // 좋아요 누른 사람
	private String likedAt;  // 좋아요 누른 시각
}
