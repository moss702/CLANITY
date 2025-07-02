package domain;

import org.apache.ibatis.type.Alias;

import domain.en.Gender;
import domain.en.MemberRole;
import domain.en.MemberStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("member")
public class Member {
	private Long memberId; //맴버 고유 번호
	private String email;
	private String password;
	private String nickname;
	private String phone;
	private Gender gender;
	private String profileimage;
	private MemberRole role;
	private MemberStatus status;
	private String grade;
	private String createdAt;

}
