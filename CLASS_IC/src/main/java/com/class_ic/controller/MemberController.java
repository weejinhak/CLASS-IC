package com.class_ic.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberservice;

	//로그인 폼
	@RequestMapping(value="login.htm", method=RequestMethod.GET)
	public String login(){
		
		
		return "join/login";
	}
	
	//로그인 (선생/학생) //@RequestParam("password") String rawPassword, Principal principal, parameter 추가 예정
	@RequestMapping(value="login.htm", method=RequestMethod.POST)
public ModelAndView login(HttpSession session,  @RequestParam("password") String rawPassword, Principal principal,ModelAndView mv){

		ModelAndView MnV = memberservice.loginService(session, rawPassword, principal, mv);
		
		return MnV;
	}
	

}
