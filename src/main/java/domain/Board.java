package domain;

import org.apache.ibatis.type.Alias;

import domain.en.VisibleLevel;
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
@Alias("board")
public class Board {
	private Long boardId; 				// 게시글 번호
	private Long categoryId; 		    // 카테고리 번호
	private Long memberId;			 	// 작성자 ID
	private Long groupId; 				// 답글기능 : 원본 게시글 그룹 번호
	private int depth; 					// 답글기능 : 답글 단계
	private String title; 				// 게시글 제목
	private String content; 			// 게시글 내용
	private VisibleLevel visibleLevel;	// 열람등급제한
	private boolean isBlind; 			// 블라인드 여부
	private int likeCount; 				// 좋아요 수
	private int commentCount; 			// 댓글 수
	private int viewCount; 				// 조회 수
	private String createdAt; 			// 작성일시
	private String updatedAt; 			// 수정일시
}
