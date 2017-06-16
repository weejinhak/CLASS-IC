/*
* @FileName		:	MemberController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
*/
package com.class_ic.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.app.dao.AttendDAO;
import com.class_ic.app.dto.LoginDTO;
import com.class_ic.app.dto.MemberDTO;


/*
* @Class: MemberController
* @Date: 2017.06. 16.
* @Author: 위진학
* @Desc: 안드로이드 로그인과 QR출석을 DB에 넣기 위해 dao와 접촉
*/
@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;

	/*
	@description : app에서 ID와 비번 일치여부를 검사시켜 json형태로 Return.
	*/
	@RequestMapping("/applogin")
	@ResponseBody
	public LoginDTO LogIn(HttpServletRequest request, HttpSession session) {
		
		AttendDAO memberDao = sqlSession.getMapper(AttendDAO.class);
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		System.out.println("id : " + id + " // " + "password : " + password + "//");
		System.out.println(memberDao.login(id, password)+"로그인성공");
		LoginDTO ld = new LoginDTO();
		ld.setCount(memberDao.login(id, password));
		System.out.println(ld);
		return ld;
	}

	/*
	@description : app에서 QR_Code 의 값들을 받아와 DB에 저장.
	*/
	@RequestMapping("/attendance")
	@ResponseBody
	public void memberAttendance(HttpServletRequest request) throws Exception {
		
		AttendDAO memberDao = sqlSession.getMapper(AttendDAO.class);
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("time"));
		System.out.println(request.getParameter("state"));
		
		String state=request.getParameter("state");
		String email=request.getParameter("email");
		String time=request.getParameter("time");
		
		
		//입실일 경우
		if(state.equals("inClass")){			
			System.out.println("입실까지 in!");
			memberDao.attendanceMember(email,time,state);
		}
		//퇴실일 경우
		else{
			System.out.println("퇴실까지 in!");
			memberDao.attendanceMember(email,time,state);
		}	
		
	}

}
