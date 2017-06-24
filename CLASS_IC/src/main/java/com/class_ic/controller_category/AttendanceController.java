package com.class_ic.controller_category;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.AttendanceListService;
import com.class_ic.vo.AttandanceDTO;
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
	  @RequestMapping(value="student/attendanceTable.htm",method=RequestMethod.POST)
	  public void studentlistPage(Model model,String email,String classcode,HttpServletResponse response) throws Exception {
	       
	  System.out.println("컨트롤러 들어온다!!!!!!!!!!!!!!!!!!!!");
 //     System.out.println(request.getParameter("email"));
 //     System.out.println(request.getParameter("classcode"));
	  
	
	  /*String email =request.getParameter("email");
	  String classcode = request.getParameter("classcode");*/
	   
	  List<AttandanceDTO> memberattendacnelist= attendanceListService.attendanceSelect(email, classcode);
	  	  
	  response.getWriter().print(memberattendacnelist);
	  
	  }
}
