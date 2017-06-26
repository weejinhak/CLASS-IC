package com.class_ic.controller_category;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("teacher")
public class Homework_Teacher {

	@RequestMapping(value="movePage.htm")
	public String MovePage(HttpSession session, String classCode) {
		
		System.out.println("teacher homework controller classCode: "+ classCode);
		session.setAttribute("classCode", classCode);
		
		return "teacher.homework_board";
	}
}
