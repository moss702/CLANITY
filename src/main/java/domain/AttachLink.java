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
@Alias("attachLink")
public class AttachLink { // attach 관계 테이블
    private Long linkId;		// PK : linkId (자동증가)
    private Long attachId;		// FK : attach 테이블
    private String targetType;	// 첨부파일 사용하는 타입 - ex)board, qna, mypage
    private Long targetId;		// 해당 테이블의 pk - ex) boardId, qnaId
}
