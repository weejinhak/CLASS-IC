package com.class_ic.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.class_ic.dao.AlarmDAO;
import com.class_ic.vo.All_Alarm_DTO;

/*알람*/
@Controller
public class AlarmController {

	@Autowired
	private SqlSession sqlsession;
	

	
	//sendMessage.htm
	@RequestMapping(value="/sendMessage.htm")
    public String sendMessage(@RequestParam(value="sendmessage") String sendmessage,HttpSession session)
            throws ClassNotFoundException, SQLException{
	
		System.out.println("sendmessage 탐 -> 값은 :  "+sendmessage);
		All_Alarm_DTO dto= new All_Alarm_DTO();
		
		dto.setUser_id("a@gmail.com");
		dto.setMessage(sendmessage);
				
		/*alarm_DAO.insertMessage(dto);
		alarm_DAO.insertMessageReceive(dto);
		alarm_DAO.insertMessageSend(dto);*/
		
		
		System.out.println(sendmessage+"insert 완료");
		
        return "student.student_main";
	      
	}
	
	//alarm test
	@RequestMapping(value="newAlarm.htm")
    public String newAlarm(@RequestParam(value="newAlarm") String newAlarm,HttpSession session)
            throws ClassNotFoundException, SQLException{
	
		
			System.out.println("newAlarm.htm");
			System.out.println("newAlarm : "+newAlarm);
			
			String Ename = (String)session.getAttribute("email");
			
			AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);
			
			int totalCount = alarm_DAO.totalCount(newAlarm);
						
			System.out.println("newAlarm totalcount:"+totalCount);
			
			session.setAttribute("totalCount", totalCount);
			
	      return "newAlarm";
	      
	}


}
