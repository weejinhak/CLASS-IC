package com.class_ic.controller_category;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.LectureBoardDAO;
import com.class_ic.dao.TodayLectureDAO;
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
 
	//상세보기 
	@RequestMapping("totalBoard_contentview.htm") 
	public ModelAndView boardContent(HttpServletRequest request, HttpServletResponse response,LectureBoardDTO bvo ){  //lectureNo 올걸 
		
		LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class); 
		
		int lectureNo = Integer.parseInt( request.getParameter("lectureNo"));
		  
		ArrayList<LectureBoardDTO> blist = bdao.totalBoard_contentview(lectureNo); 
		
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("teacher.board_content_view");
		m.addObject("bvo", blist);  
		
		return m;
		
		
		 
 
		
		
		  
	}
 
	
	
	//다중 삭제 totalBoard_multi_check
	
 	@RequestMapping(value="totalBoard_multi_delete.htm" ) 
	public String multi_del(HttpServletRequest request, HttpServletResponse response ) {
		 

		 String test=request.getParameter("data");
		 System.out.println(test);
		 LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class); 
		 
	  
		 
		    String[] array = test.split(",");
		    
		    System.out.println(array.length);

		    for(int i=0;i<array.length;i++){
		    	System.out.println(array[i]);
		    	
		    		//삭제로 바꿈 	
		    	bdao.deleteLect(Integer.parseInt(array[i]));
		    	
		    }
			return "redirect:totalboard.htm";
	    	
    } 

		    
		    
	//글 한개 씩 삭제 

			@RequestMapping(value="totalBoard_delete.htm" ) 
			public String delete(HttpServletRequest request, HttpServletResponse response){ 
				
				
				System.out.println("totalBoard_delete.htm 컨트롤러 탐 ");
				int lectureNo = Integer.parseInt( request.getParameter("lectureNo"));
				
				
				LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class); 
				
				bdao.deleteLect(lectureNo) ;
 
				return "redirect:totalboard.htm";
		 
			}
			
	

}
