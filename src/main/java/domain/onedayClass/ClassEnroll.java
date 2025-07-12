package domain.onedayClass;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassEnroll {

	private Long enrollId;
	private Long openId;
	private Long classId;
	private Long  memberId;
	private Date enrolledAt;
	private boolean status; 


}
