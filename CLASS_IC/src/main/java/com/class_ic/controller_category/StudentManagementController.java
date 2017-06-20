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
		
		
		return "teacher.student_group";
	}
	@RequestMapping(value="stable.htm", method=RequestMethod.POST)
	public @ResponseBody String studentTable(StudentTableDTO sTable){
		
		
		return "";
	}

}
