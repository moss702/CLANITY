package domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("alarm")
public class Alarm {
	private Long alarmId;       // 알림 고유 ID (PK)
	private Long receiverId;    // 알림 수신자 (회원 ID)
	private Long senderId;      // 알림 발신자 (null일 경우 시스템)
	private String type;        // 알림 종류 유형 (SYSTEM 공지, 시스템 공지, 이벤트, 클래스, 소셜링, 댓글, 신고)
	private String targetType;  // 알림이 연관된 도메인 종류 (CLASS 등)
	private Long targetId;      // 알림 대상의 고유 ID (게시글, 클래스 등)
	private String title;       // 알림의 제목
	private String message;     // 알림 메시지 본문
	private boolean isRead;     // 알림 읽음 여부 (true=읽음, false=안 읽음)
	private String sentAt;      // 알림 발송 시각
	private String readAt;      // 알림 읽은 시각 (읽지 않았으면 null)
}

