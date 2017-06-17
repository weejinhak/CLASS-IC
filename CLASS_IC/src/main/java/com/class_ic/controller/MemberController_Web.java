package com.class_ic.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.MemberService_Web;

@Controller
public class MemberController_Web {
	
	@Autowired
	private MemberService_Web memberservice;

	//로그인 폼
	@RequestMapping("login.htm")
	public String login(){
		System.out.println("로그인 view form만 탔어");
		
		return "join/login";
	}
	
	//로그인 처리
	@RequestMapping("loginOk.htm")
	public ModelAndView login(HttpSession session,  @RequestParam("pwd") String rawPassword, Principal principal,ModelAndView mv){
		
		System.out.println("로그인 POST는 탔음");
		
		ModelAndView MnV = memberservice.loginService(session, rawPassword, principal, mv);
		
		return MnV;
	}
	

}
