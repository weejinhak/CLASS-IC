/*
* @FileName	:	MemberService_Web.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.17
* @Author		:	이현정
*/
package com.class_ic.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.AlarmDAO;
import com.class_ic.dao.MemberDAO;
import com.class_ic.vo.MemberDTO;

@Service
public class MemberService_Web {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	/*
	   @description : longin  마지막 추가수정. 위진학.
	*/
	public ModelAndView loginService(HttpSession session,String email, @RequestParam("pwd") String rawPassword, ModelAndView mv){
		
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		AlarmDAO alarm_DAO = sqlsession.getMapper(AlarmDAO.class);

		MemberDTO member = member_dao.login(email);
		String encodedPassword = member.getPwd();
		String memberAuthority = member_dao.confirmAuthority(email);
		int totalCount = alarm_DAO.totalCount(member.getEmail());

		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);

		mv.addObject("member", member);
		session.setAttribute("email", member.getEmail());
		session.setAttribute("name", member.getName());
		session.setAttribute("totalCount", totalCount);
		if(result){
			if(memberAuthority.equals("ROLE_TEACHER")){
				mv.setViewName("common/thsSelect_teacher");
				System.out.println("강사 로그인 성공");
			}else{
				mv.setViewName("common/thsSelect_student");
				System.out.println("학생 로그인 성공");
			}
			System.out.println("비밀번호 일치");
		}else{
			mv.setViewName("join/login");
			System.out.println("비밀번호 확인 실패");
		}
		return mv;
	}
	
	//update
	public ModelAndView update(MemberDTO member, ModelAndView mv){
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO getMember = member_dao.selectOne(member);
		
		
		return mv;
	}
	
	//delete
	public int delete(String email){
		
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		int result = member_dao.delete(email);
		
		return result ;
	}
	
	//memberList
	public ModelAndView getMember(ModelAndView mv){
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> memberList = (ArrayList<MemberDTO>) member_dao.selectAll();
		int member_count = member_dao.selectAllCount();
		System.out.println("인간 수" + member_count);
		mv.addObject("member_list", memberList);
		mv.addObject("member_count", member_count);
		mv.setViewName("teacher.student_group");
		return mv ;
	}
	
	//학생 전체 select
	public ModelAndView getStudentAll(ModelAndView mv){
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		
		List<MemberDTO> student_list = member_dao.selectAllStudent();
		int student_count = member_dao.selectAllStudentCount();
		System.out.println("학생 수: " +student_count );
		mv.addObject("student_list", student_list);
		mv.addObject("student_count", student_count);
		mv.setViewName("teacher.student_groupping");
		return mv;
	}
	
	//test
	public ModelAndView getMemberGp(ModelAndView mv){
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> memberList = (ArrayList<MemberDTO>) member_dao.selectAll();
		int member_count = member_dao.selectAllCount();
		System.out.println("인간 수" + member_count);
		mv.addObject("member_list2", memberList);
		mv.addObject("member_count2", member_count);
		mv.setViewName("teacher.final_group");
		return mv ;
	}




}
