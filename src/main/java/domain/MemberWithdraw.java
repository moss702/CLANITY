package domain;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("memberwithdraw")
public class MemberWithdraw {
	private Long withdrawId;
    private Long memberId;
    private String emailMasked;
    private String nicknameMasked;
    private String reason;
    private LocalDateTime withdrawAt;
}
