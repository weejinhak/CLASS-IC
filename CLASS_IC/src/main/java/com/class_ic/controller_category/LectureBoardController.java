package com.class_ic.controller_category;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.LectureBoardDAO;
import com.class_ic.vo.LectureBoardDTO;

@Controller
@RequestMapping("teacher")
public class LectureBoardController{
	

	@Autowired
		SqlSession sqlsession;
 
	
	//이름 subcate 뭐시기로 변경 
	@RequestMapping("totalboard.htm") 
	public ModelAndView allBoard(LectureBoardDTO bvo){ 
		
		LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class);
		
		String subcateCode="2-1";
		ArrayList<LectureBoardDTO> blist = bdao.allBoard(subcateCode); 
		
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.totalLectureBoard");
		m.addObject("bvo", blist);  
		
		return m;
		  
	}
 
	
	 
	
	

}
