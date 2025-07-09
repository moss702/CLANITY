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
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			scheduler = StdSchedulerFactory.getDefaultScheduler();
			
			JobDetail job = JobBuilder.newJob(WithdrawCleanupJob.class)
					.withIdentity("withdrawCleanupJob", "member")
					.build();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContextListener.super.contextInitialized(sce);
	}

}
