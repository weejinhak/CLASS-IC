/*
* @FileName	:	JoinController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.MemberDAO;
import com.class_ic.service.JoinService;
import com.class_ic.vo.MemberDTO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinservice;
	
	
	   @Autowired
	   private SqlSession sqlsession;

	//회원가입 폼
	@RequestMapping("join.htm")
	public String join(){
		
		return "join/joinus";
	}
	

	
	//회원가입 학생
	@RequestMapping("join_st.htm")
	public @ResponseBody String joinStudent(MemberDTO member){
		System.out.println("학생가입 데이터 넘겨받음 이메일: " + member.getEmail());
		String viewpage = "";
		try{
			viewpage = joinservice.join(member);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return viewpage; 
	}
	
	//회원가입 선생
		@RequestMapping("join_te.htm")
		public @ResponseBody String joinTeacher(MemberDTO member){

			String viewpage = "";
			try{
				viewpage = joinservice.join(member);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			return viewpage; 
		}
	
		// 비밀번호 변경 페이지 요청 시
		@RequestMapping("memberPwChk.htm")
		public String membercheckview(){
			
			return "join/memberPwChk";
		}
		
		// 비밀번호 변경전  본인이 맞는지 확인 버튼 클릭 시 
		@RequestMapping("memberCheck.htm")				 //  String memberEmail, String  memberPhone
		public ModelAndView membercheck(HttpSession session, MemberDTO mvo ){
			 
			 MemberDAO mdao = sqlsession.getMapper(MemberDAO.class);
	          
			String memberEmail = (String)session.getAttribute("memberEmail");   //입력 받은 값  
			String memberPhone = (String)session.getAttribute("memberPhone");   //입력 받은 값  
			
			
			mvo.setEmail(memberEmail); 
			mvo.setPhone(memberPhone); 
			

			ModelAndView m = new ModelAndView();
		
			int result = mdao.membercheck(mvo);
			
			
			if(result > 0){ 
		
				
			//	난수를 만든다 String random ="난수"	
			//	mvo.setRandom(random) ; 	 
				
				
				//메일은 계속 끌고간다 
			
				//그이메일로 이메일 보내주기 (난수 만들어 전송) 
				
				//이메일로 보낸 난수랑 입력값  같은지 체크 
				
				//새로운 비밀번호 받는다 
			 
				m.setViewName("memberPwChg");
				//  m.addObject("memberEmail", memberEmail);
				//  m.addObject("random", random) ;
				
				//	return m;
				
			} //새로운 메일 입력창 
			
			
			return m;
			
			
		}
		
		
		
		// 비밀번호 변경 시
 	@RequestMapping("memberPwChgOk.htm")
		public ModelAndView memberPwChg(HttpSession session, MemberDTO mvo){
 		  MemberDAO mdao = sqlsession.getMapper(MemberDAO.class);
          
			mvo.setEmail((String)session.getAttribute("memberEmail"));
			
			int result = 0;
			result = mdao.memberPwChg(mvo);
			
			//난수 확인 dao 
			
			
			ModelAndView m = new ModelAndView();
			m.setViewName("join/memberPwChg");
			m.addObject("result", result);
			
			return m;
		}
		 
}
