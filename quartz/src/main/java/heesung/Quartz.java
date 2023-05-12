package heesung;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;

import org.quartz.DateBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.DateBuilder.IntervalUnit;
import org.quartz.impl.StdSchedulerFactory;

public class Quartz {
    public static void main(String[] args) {
    	
    	
        SchedulerFactory schedulerFactory = new StdSchedulerFactory(); 	// 스케줄러를 생성하는 데 사용된다.
        
        try {
            Scheduler scheduler = schedulerFactory.getScheduler();	// 팩토리의 인스턴스를 통해 스케줄러를 생성한다.
            JobDetail job = newJob(TestJob.class)	// testjob 클래스의 작업을 정하기 위해 jobdetail 인스턴스를 생성한다.
			                .withIdentity("jobName", Scheduler.DEFAULT_GROUP)	// job에 고유 식별자와 그룹을 지정해준다.
			                .build();
	            
//          ㅡ trigger는 job이 언제 실행될지 구성하는 객체이다.ㅡ
            Trigger trigger = (Trigger) TriggerBuilder.newTrigger()
                    .withIdentity("trigger1", "group1")	// trigger에 고유 식별자 지정해주고 특정 job과 그룹을 지정할 수 있다.
                    .startNow()
                    .endAt(DateBuilder.futureDate(30, IntervalUnit.SECOND))	// futureDate(수치, 수치 "초"로 지정한다, 즉 30초 뒤에 동작한다.)
                    .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                    .withIntervalInSeconds(10)	// trigger가 실행될때 간격을 10초로 지정한다.
                    .repeatForever())	// trigger가 무한히 동작한다.
                    .build();
            
            // 스케줄러를 통해 트리거가 동작하면 job이 실행된다
            scheduler.scheduleJob(job, trigger);
            scheduler.start();
            
        } catch(Exception e) {
            e.printStackTrace();
        }        
    }
}