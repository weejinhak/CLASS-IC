package com.class_ic.controller;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;



@Controller
public class SchedulerController {

	
/* @Scheduled(cron="0 42 17 * * *")
 * "초 분 시 일 월 요일"
 * 
 * */
	
	@Scheduled(cron="0 42 17 * * *")
	public void insert() {
		System.out.println("스케줄링 구동...");
		
	}


}
