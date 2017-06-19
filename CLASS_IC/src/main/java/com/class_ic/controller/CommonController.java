/*
* @FileName	:	CommonController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common")
public class CommonController {
	
	@RequestMapping("select.htm")
	public String theSelect(){
		System.out.println("commont select controller 기수선택");
		
		return "common/thsSelect";
	}
	
	@RequestMapping("select_teacher.htm")
	public String theSelectTeacher(){
		System.out.println("commont select controller 선생의 기수선택");
		
		return "common/thsSelect_teacher";
	}
	
	@RequestMapping("select_student.htm")
	public String theSelectStudent(){
		System.out.println("commont select controller 학생의 기수선택");
		
		return "common/thsSelect_student";
	}

}
