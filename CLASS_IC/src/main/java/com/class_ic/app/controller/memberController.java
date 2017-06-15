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

	@RequestMapping("/login")
	@ResponseBody
	public logindto LogIn(HttpServletRequest request, memberdto memberDto, HttpSession session) {
		memberdao memberDao = sqlSession.getMapper(memberdao.class);
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		System.out.println("id : " + id + " // " + "password : " + password + "//");
		System.out.println(memberDao.login(id, password)+"로그인성공");
		logindto ld = new logindto();
		ld.setCount(memberDao.login(id, password));
		return ld;
	}

	@RequestMapping("/attendance")
	@ResponseBody
	public void memberAttendance(HttpServletRequest request, memberdto memdto) throws Exception {
		memberdao memberdao = sqlSession.getMapper(memberdao.class);
		memdto.setM_qr(request.getParameter("qr"));
		System.out.println("기수"+request.getParameter("qr")+"기");
		System.out.println("Email(id):"+request.getParameter("email"));
		System.out.println(request.getParameter("hour")+"시");
		System.out.println(request.getParameter("minute")+"분");
		System.out.println(request.getParameter("state")+":하셨습니다.");
		memberdao.attendanceMember(memdto);
	}

}
