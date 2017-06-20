/*
* @FileName	:	MemberController_Web.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
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
import com.class_ic.vo.MemberDTO;

@Controller
public class MemberController_Web {
	
	@Autowired
	private MemberService_Web memberservice;

	//로그인 폼
	@RequestMapping("login.htm")
	public String login(){

		return "join/login";
	}
	
	//로그인 처리
	@RequestMapping("loginOk.htm")
	public ModelAndView login(HttpSession session,  String email, @RequestParam("pwd") String rawPassword, Principal principal,ModelAndView mv){
		
		ModelAndView MnV = memberservice.loginService(session, email, rawPassword, mv);
		
		return MnV;
	}
	
	//회원 수정 view  페이지
	@RequestMapping(value="editMember.htm", method=RequestMethod.GET)
	public ModelAndView editMyProfile(ModelAndView mv){
		
	return mv;
	}
	
	//회원 수정 view  값 넘기기
		@RequestMapping(value="editMember.htm", method=RequestMethod.POST)
		public ModelAndView editMyProfile(MemberDTO member, ModelAndView mv){
			
		return mv;
		}
	
	//회원 탈퇴
	@RequestMapping("deleteMember.htm")
	public int delete(){
		int result = 0;
		
		return result;
	}

}
