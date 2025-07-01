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
	private Long member_id; //맴버 고유 번호
	private String email;
	private String String;
	private String phone;
	private Gender gender;
	private String profileimage;
	private MemberRole role;
	private MemberStatus status;
	private String grade;
	private String created_at;

}
