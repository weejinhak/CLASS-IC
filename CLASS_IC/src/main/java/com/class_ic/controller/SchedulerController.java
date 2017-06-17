package com.class_ic.controller;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;



@Controller
public class SchedulerController {

	
	
/* @Scheduled(cron="0 42 17 * * *")
 * "초 분 시 일 월 요일"
 * 일/월/요일에 대해서는 '*' 설정을 잡아 주었으니 "매일 17시 42분이 되면 해당 스케쥴러를 호출하라 라는 뜻 이다."
 * 
 * @Scheduled(fixedRate=5000) -> 5초마다 실행 해주기
 * */
	
	@Scheduled(cron="0 42 17 * * *")
	public void insert() {
		System.out.println("스케줄링 구동...");
		
	}


}
