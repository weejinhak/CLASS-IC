package com.class_ic.controller_category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.class_ic.service.AttendanceListService;
import com.class_ic.service.LectureCodeAddService;
import com.class_ic.vo.MemberDTO;

 
@Controller
public class AttendanceController {
	  
	

	@Autowired
	private AttendanceListService attendanceListService;

	
	
/*	//강사용 출석리스트
 	  @RequestMapping(value = "attendanceTable.htm", method = RequestMethod.GET)
	  public String teacherlistPage() throws Exception {
	  
	      
	    return "teacher.page";
	  }*/
	  
	//학생용 출석리스트
	  @RequestMapping("attendanceTable.htm")
	  public List<MemberDTO> studentlistPage(HttpServletRequest request) throws Exception {
	       
	  String email =request.getParameter("email");
	  String classcode = request.getParameter("classcode");
	   
	  List<MemberDTO> memberattendacnelist= attendanceListService.attendanceSelect(email, classcode);
	      
	    return memberattendacnelist;
	  }
}
