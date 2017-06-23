/*
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.19
* @Author		:	노지영
*/
package com.class_ic.controller;


import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.class_ic.dao.AttendanceDAO;
import com.class_ic.dao.MemberDAO;
import com.class_ic.service.AttendanceService;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.LectureDTO;
import com.class_ic.vo.MemberDTO;

/*
* @Class: SchedulerController
* @Date: 2017.06. 19
* @Author: 노지영
* @Desc: 스케줄링이 구동되어 아침마다 필요한 테이블을 자동으로 insert 해주는 컨트롤러.
*/

@Controller
public class SchedulerController {

	@Autowired
	private SqlSession sqlsession;
	

	@Autowired
	private AttendanceService attendanceservice;


/*
 *	@description : 스케줄링 어노테이션을 사용하여 cron 으로 테이블 생성시점을 정의해줌.	
 * <스케줄 어노테이션 예시>
 * @Scheduled(cron="0 42 17 * * *")
 * "초 분 시 일 월 요일"
 * 일/월/요일에 대해서는 '*' 설정을 잡아 주었으니 "매일 17시 42분이 되면 해당 스케쥴러를 호출하라 라는 뜻 이다.
 * @Scheduled(fixedRate=5000) -> 5초마다 실행 해주기
 * */
	
	@Scheduled(cron="0 0 1 * * *")
	public void insert() {
		System.out.println("아침입니다 출석됭 테이블을 insert 하겠습니다.");
		attendanceservice.insertAttendance();
		System.out.println("attandence 테이블 isnert 완료 되었습니다.");
		
	}
	

	@Scheduled(cron="0 0 1 * * *")
	public void updateState() {

		AttendanceDAO attendanceDao=sqlsession.getMapper(AttendanceDAO.class);
		System.out.println("저녁입니다 출석됭 테이블의 결석여부를 판단하겠습니다.");

		ArrayList<AttandanceDTO> todaylist=attendanceDao.todayAttendaceData();
		LectureDTO classdto= new LectureDTO();
		

		//내가 찍은 입실 시간 인덱스 1이 시간 2가 분이다.
		String[] inclassArr;
		//내가 찍은 퇴실 시간 인덱스 1이 시간 2가 분이다.
		String[] outclassArr;
		//지정된 입실 시간 인덱스 0이 시간 1이 분이다.
		String[] opentimeArr;
		//지정된 퇴실 시간 인덱스 0이 시간 1이 분이다.
		String[] closetimeArr;
	
	
		for(AttandanceDTO list:todaylist){
			
			classdto=attendanceDao.selectStartEndTime(list.getClassCode());
			inclassArr=list.getInClass().split(":");
			outclassArr=list.getOutClass().split(":");
			opentimeArr=classdto.getClassopentime().split(":");
			closetimeArr=classdto.getClassclosetime().split(":");
			
			for(String value:inclassArr){
				System.out.println(value);
			}
			
			for(String value:outclassArr){
				System.out.println(value);
			}
			
			for(String value:opentimeArr){
				System.out.println(value);
			}
			
			for(String value:closetimeArr){
				System.out.println(value);
			}
		
			
			//둘다 널이 아니면
			if((list.getInClass()!=null)&&(list.getOutClass()!=null)){
				
				
			//	if(inclassArr[1])
				
			}
		}
		
	}


	}
