/*
* @FileName		:	AlarmController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
* @Desc         :   쪽지 전달시 Message관련 테이블에 Insert 및 Select해오기 위한 Controller
*/
package com.class_ic.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.class_ic.dao.AlarmDAO;
import com.class_ic.vo.All_Alarm_DTO;

@Controller
public class AlarmController {

	@Autowired
	private SqlSession sqlsession;
	
	
	/*
	@description : 보내온 메시지를 Table에 Insert시키기위한 함수
	*/
	@RequestMapping(value="student/sendMessage.htm")
    public String sendMessage(@RequestParam(value="sendmessage") String sendmessage,HttpSession session,
    		@RequestParam(value="remail") String remail)
            throws ClassNotFoundException, SQLException{
	
		System.out.println("sendmessage 탐 -> 값은 :  "+sendmessage);
		All_Alarm_DTO dto= new All_Alarm_DTO();


		System.out.println("********받는사람과 보내는사람 찍어보기************");
		System.out.println(remail);
		System.out.println((String)session.getAttribute("email"));
		System.out.println("********************");
		
		
		
		dto.setEmailS((String)session.getAttribute("email"));//보내는사람
		Calendar cal= Calendar.getInstance();
		java.util.Date date= cal.getTime();
		dto.setMsSendTime(new SimpleDateFormat("yyyyMMddHHmmss").format(date));//메시지받는시간
		dto.setMsContent(sendmessage);//메시지내용
		//확인상태,삭제여부 처음에 1
		
		AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);

		int result=alarm_DAO.insertAlarm(dto);
		if(result>0){
			dto=alarm_DAO.selectMessageNum();
			dto.setEmailR(remail);//받는사람		
			alarm_DAO.insertMessageReceive(dto);
			alarm_DAO.insertMessageSend(dto);
		}		
		
		System.out.println(sendmessage+"insert 완료");
		
        return "student.student_main";
	      
	}
	
	/*
	@description :소켓에 연결 되어 있을 시 실시간 안읽은 쪽지의 TotalCount를 상대방에게 전송하기 위한 함수
	*/
	@RequestMapping(value="student/newAlarm.htm")
    public String newAlarm(@RequestParam(value="newAlarm") String newAlarm,HttpSession session)
            throws ClassNotFoundException, SQLException{
	
		
			System.out.println("newAlarm.htm");
			System.out.println("newAlarm : "+newAlarm);
							
			AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);
			
			int totalCount = alarm_DAO.totalCount(newAlarm);
						
			System.out.println("newAlarm totalcount:"+totalCount);
			
			session.setAttribute("totalCount", totalCount);
			
	      return "newAlarm";
	      
	}


}
