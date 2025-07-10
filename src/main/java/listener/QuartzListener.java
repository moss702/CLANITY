package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

import schedule.WithdrawCleanupJob;

@WebListener
public class QuartzListener implements ServletContextListener{

	private Scheduler scheduler;



	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			scheduler = StdSchedulerFactory.getDefaultScheduler();

			JobDetail job = JobBuilder.newJob(WithdrawCleanupJob.class)
					.withIdentity("withdrawCleanupJob", "member")
					.build();

			Trigger trigger = TriggerBuilder.newTrigger()
					.withIdentity("dailyTrigger", "member")
					.withSchedule(CronScheduleBuilder.cronSchedule("0 0 0 * * ?")) // 매일 0시
					.build();

			scheduler.scheduleJob(job, trigger);
			scheduler.start();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			if (scheduler != null && !scheduler.isShutdown()) {
				scheduler.shutdown(true);
				System.out.println("[Quartz] 스케줄러 정상 종료");
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

}
