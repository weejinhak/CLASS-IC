package com.class_ic.controller_category;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.TodayLectureDAO;
import com.class_ic.vo.TodayLectureVO;

@Controller
@RequestMapping("student")
public class BookmarkController {
	

	@Autowired
		SqlSession sqlsession;	
	
	//이름 subcate 뭐시기로 변경 
	@RequestMapping("boardforbookmark.htm") 
	public ModelAndView allBoard(TodayLectureVO bvo){ 
		
		TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class);
		
		String subcateCode="2-1";
		ArrayList<TodayLectureVO> blist = bdao.allBoard(subcateCode); 
		
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("student.board_details_view");
		m.addObject("bvo", blist);  
		
		return m;
		  
	}
 

}
