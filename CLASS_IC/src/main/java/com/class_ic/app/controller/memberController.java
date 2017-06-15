package com.class_ic.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.app.dao.memberdao;
import com.class_ic.app.dto.logindto;
import com.class_ic.app.dto.memberdto;

@Controller
public class memberController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/applogin")
	@ResponseBody
	public logindto LogIn(HttpServletRequest request, memberdto memberDto, HttpSession session) {
		memberdao memberDao = sqlSession.getMapper(memberdao.class);
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		System.out.println("id : " + id + " // " + "password : " + password + "//");
		System.out.println(memberDao.login(id, password)+"로그인성공");
		logindto ld = new logindto();
		ld.setCount(memberDao.login(id, password));
		System.out.println(ld);
		return ld;
	}

	@RequestMapping("/attendance")
	@ResponseBody
	public void memberAttendance(HttpServletRequest request, memberdto memdto) throws Exception {
		memberdao memberdao = sqlSession.getMapper(memberdao.class);
		System.out.println(request.getParameter("time"));
		System.out.println(request.getParameter("state"));
		
		String state=request.getParameter("state");
		
		if(state.equals("입실")){			
			System.out.println("여기까지 들어오지롱~");
			memdto.setEmail(request.getParameter("email"));
			memdto.setTime(request.getParameter("time"));
			memdto.setAttendState(request.getParameter("state"));
			memberdao.attendanceMember(memdto);
		}else{
			memdto.setEmail(request.getParameter("email"));
			memdto.setTime(request.getParameter("time"));
			memdto.setAttendState(request.getParameter("state"));
			memberdao.attendanceMember(memdto);
		}	
		
	}

}
