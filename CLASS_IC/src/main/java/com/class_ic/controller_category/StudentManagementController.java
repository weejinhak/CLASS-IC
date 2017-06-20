package com.class_ic.controller_category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.vo.StudentTableDTO;

@Controller
public class StudentManagementController {
	
	@RequestMapping(value="stable.htm", method=RequestMethod.GET)
	public String studentTable(){
		//get 호출이여도 기본으로
		//1. member total count
		//GroupCategory의 bindnum null/값이 있을 대로 나눠서 처리 > nvl() 으로 null 을 0으로 할 것인가
		
		return "teacher.student_group";
	}
	@RequestMapping(value="stable.htm", method=RequestMethod.POST)
	public @ResponseBody String studentTable(StudentTableDTO sTable){
		
		
		return "";
	}

}
