package domain;

import domain.en.ApplyStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("businessapply")
public class BusinessApply {
    private Long applyId;        // 신청 번호
    private Long memberId;       // 신청자 ID
    private String email;        // 신청 당시 이메일 (스냅샷)
    private String nickname;     // 신청 당시 닉네임 (스냅샷)
    private String reqtime;     // 신청 시각
    private ApplyStatus status;    // PENDING, APPROVED, REJECTED
    private Long adminId;        // 처리한 관리자 ID
    private String applytime;   // 처리 시각

    private List<Attach> attachs;
}
