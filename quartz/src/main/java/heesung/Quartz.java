package heesung;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Quartz {
    public static void main(String[] args) {
        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
        
        try {
            Scheduler scheduler = schedulerFactory.getScheduler();
            
            JobDetail job = newJob(TestJob.class)
                .withIdentity("jobName", Scheduler.DEFAULT_GROUP)
                .build();
            
            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity("trigger1", "group1")
                    .startNow()
                    .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                            .withIntervalInSeconds(5)
                            .repeatForever())
                    .build();
                        
            scheduler.scheduleJob(job, trigger);
            scheduler.start();
        } catch(Exception e) {
            e.printStackTrace();
        }        
    }
}