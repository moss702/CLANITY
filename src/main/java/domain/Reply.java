package domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("reply")
public class Reply {
	private Long replyId;     // 댓글 고유 ID
	private Long boardId;     // 어떤 게시글에 달린 댓글인지
	private Long memberId;    // 작성자 ID
	private String content;   // 댓글 내용
	private boolean isSecret; // 비밀댓글 여부
	private String createdAt; // 댓글 작성 일시
	private String updatedAt; // 댓글 수정 일시
}
