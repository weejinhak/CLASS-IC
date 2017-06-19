package com.class_ic.controller_category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.vo.StudentTable;

@Controller
public class StudentManagementController {
	
	@RequestMapping(value="stable.htm", method=RequestMethod.GET)
	public String studentTable(){
		
		
		return null;
	}
	@RequestMapping(value="stable.htm", method=RequestMethod.POST)
	public String studentTable(StudentTable sTable){
		
		
		return null;
	}

}
