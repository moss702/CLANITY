package schedule;

import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import domain.MemberWithdraw;
import lombok.extern.slf4j.Slf4j;
import service.MemberWithdrawService;

@Slf4j
public class WithdrawCleanupJob implements Job{

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		MemberWithdrawService service = new MemberWithdrawService();
		
		//조회
		List<MemberWithdraw> expiredList = service.withdrawList();
		
		
		//삭제
		for (MemberWithdraw request : expiredList) {
			try {
				service.deactivateMember(request.getMemberId());
				log.info("탈퇴 처리 완료 : {}", request.getMemberId());
			} catch (Exception e){
				log.error("탈퇴 처리 실패 : {}",request.getMemberId());
				e.getStackTrace();
			}
		}
	}
	
	
}
