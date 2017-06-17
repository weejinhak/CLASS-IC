package com.class_ic.service;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.MemberDAO;
import com.class_ic.vo.MemberDTO;

@Service
public class MemberService_Web {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//@RequestParam("password") String rawPassword, Principal principal (넘기는 parameter security 적용 후 변경
	public ModelAndView loginService(HttpSession session,String email, @RequestParam("pwd") String rawPassword, ModelAndView mv){
		
		System.out.println("서비스에 넘겼다");
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO member = member_dao.login(email);
		String encodedPassword = member.getPwd();
		String memberAuthority = member_dao.confirmAuthority(email);
		
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);

		mv.addObject("member", member);
		session.setAttribute("email", member.getEmail());
		
		if(result){
			if(memberAuthority.equals("ROLE_TEACHER")){
				//role confirm dao 타서 role_name을 갖고 와서 그거에 따라서 mv setviewname 보내본다
				mv.setViewName("teacher.main");
			}else{
				mv.setViewName("student.main");
			}
			System.out.println("비밀번호 일치");
		}else{
			mv.setViewName("join/login");
			System.out.println("비밀번호 확인 실패");
		}
		return mv;
	}

}
