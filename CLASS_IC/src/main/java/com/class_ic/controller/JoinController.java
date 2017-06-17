package com.class_ic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.JoinService;
import com.class_ic.vo.MemberDTO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinservice;
	
	//회원가입 폼
	@RequestMapping(value="join.htm", method=RequestMethod.GET)
	public String join(){
		
		return "join/join";
	}
	
	//회원가입(학생)
	@RequestMapping(value="join.htm", method=RequestMethod.POST)
	public String joinStudent(MemberDTO member){
		
		String viewpage = "";
		try{
			viewpage = joinservice.joinService(member);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return viewpage; 

	}
	
	

}
