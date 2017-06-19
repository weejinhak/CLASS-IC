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
	
/*	
	@Autowired
	private AttendanceService attendanceservice;*/


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
		System.out.println("스케줄링 구동...");
		
		AttandanceDTO dto=new AttandanceDTO();

		AttendanceDAO attendanceDao=sqlsession.getMapper(AttendanceDAO.class);
		

		ArrayList<MemberDTO> memberList=attendanceDao.memberSelectAll();
		
		String email="";
		
		for(int i=0;i<memberList.size();i++){
			

			//dto.setAttendDate(new Date(2017-12-12)); //sysdate
			dto.setAttendState("결석"); 
			System.out.println("aa");
			email=memberList.get(i).getEmail();
			System.out.println(email);
			System.out.println(attendanceDao.selectClassNumber(email));
			dto.setClassCode(attendanceDao.selectClassNumber(email)); 
			dto.setEmail(email); 
			dto.setInClass(null);
			dto.setOutClass(null);
		
			attendanceDao.insert(dto);
			System.out.println("insert"+i);
		

		
	}


	}
}