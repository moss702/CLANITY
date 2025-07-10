package mapper;

import java.util.List;

import domain.Member;
import domain.MemberWithdraw;

public interface MemberWithdrawMapper {

	int insert(MemberWithdraw request);
	
	List<MemberWithdraw> list();

	MemberWithdraw selectByEmail(String email);
	
}
