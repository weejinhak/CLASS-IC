/*
* @FileName	:	JoinController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.JoinService;
import com.class_ic.vo.MemberDTO;
/*
* @Class: JoinController
* @Date: 2017.06.30
* @Author: 이현정
* @Desc: 학생과 선생 회원가입 처리
*/
@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinservice;
	
	//회원가입 폼
	@RequestMapping("join.htm")
	public String join(ModelMap model){
		MemberDTO memberDTO = new MemberDTO();
		model.addAttribute("memberDTO", memberDTO);
		return "join/joinus";
	}
	
	//이메일 중복 체크
	@RequestMapping("check_email")
	@ResponseBody
	public int checkEmail (String email) {
		int result = 0;
		result = joinservice.checkEmail(email);
		System.out.println(result);
		return result;
	}
	
	
	//회원가입 학생
	@RequestMapping("join_st.htm")
	public String joinStudent(@Valid MemberDTO member, BindingResult result, HttpServletRequest request){
		
		if(result.hasErrors()) {
			return "join/joinus";
		}
		String viewpage = "";
		try{
			viewpage = joinservice.join(member, request);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return viewpage; 
	}
	
	//회원가입 학생 (front-end)
	/*
	@RequestMapping("join_st.htm")
	public String joinStudent(MemberDTO member, HttpServletRequest request){
		String viewpage = "";
		try{
			viewpage = joinservice.join(member, request);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return viewpage; 
	}
	*/
	//회원가입 선생
		@RequestMapping("join_te.htm")
		public String joinTeacher(MemberDTO member ,HttpServletRequest request){

			String viewpage = "";
			try{
				viewpage = joinservice.join(member, request);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			return viewpage; 
		}
	

}
