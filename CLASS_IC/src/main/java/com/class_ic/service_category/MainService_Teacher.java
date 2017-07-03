package com.class_ic.service_category;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.TeacherMainDAO;
import com.class_ic.vo.ClassDTO;

@Service
public class MainService_Teacher {

	@Autowired
	private SqlSession sqlsession;
	
	public ModelAndView selectMain(HttpSession session){
		TeacherMainDAO dao = sqlsession.getMapper(TeacherMainDAO.class);

		ClassDTO mainlist = dao.teacherMain((String)session.getAttribute("email"));
		
		System.out.println("3"+(String)session.getAttribute("email"));
		
		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.teacher_main");
		m.addObject("list", mainlist);
		
		System.out.println("클래스타이틀 확인 : " + mainlist.getClassTitle());
		return m;
	}
}
