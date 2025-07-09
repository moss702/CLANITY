package domain;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("attachLink")
public class AttachLink { // attach 관계 테이블
    private String uuid;		// PK :  (자동증가)
    private String linkType;	// 첨부파일 사용하는 타입 - ex)board, qna, mypage
    private Long lno;		// 해당 테이블의 pk - ex) boardId, qnaId
    private Date regdate;
}
