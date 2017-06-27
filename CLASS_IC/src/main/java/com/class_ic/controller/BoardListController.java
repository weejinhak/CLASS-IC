package com.class_ic.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;


/*
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.24
* @Author		:	노지영
*/

/*
* @Class: BoardListController 
* @Date: 2017.06. 24
* @Author: 노지영
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/



@Controller
public class BoardListController {
	
	

	@Autowired
	private SqlSession sqlsession;
	

	@RequestMapping(value = "boardcontentsave.htm", method = RequestMethod.POST)
	public String boardContentSave(HttpServletRequest request){
	System.out.println("boardContentSave 메소드 들어옴.");
    String title=(String)request.getParameter("title");
    String content=(String)request.getParameter("content");
    String cate=(String)request.getParameter("cate");
    String subcate=(String)request.getParameter("subcate");
    System.out.println(title+","+content+","+cate+","+subcate);
    
    LectureBoardDTO dto= new LectureBoardDTO();
    dto.setClassCode("kkj01331@naver.com");
    dto.setCateCode("Spring");
    dto.setSubcateCode("bb");
    dto.setLectureContent(content);
    dto.setLectureTitle(title);
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
    
    board.insertBoardContent(dto);
	return "teacher.board_content";

	
	}
	
	@RequestMapping(value = "selectcategory.htm", method = RequestMethod.POST)
	public String selectCategory(Model model,HttpServletRequest request){
	System.out.println("selectCategory 메소드 들어옴.");
	
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
	ArrayList<String> totalcate= board.selectCategory();
	
	model.addAttribute("list",totalcate);
	request.setAttribute("list", totalcate);
	
	for(String value: totalcate){
	 System.out.println(value);
	}
	
	
	return "teacher.board_content";
    
	
	}


}


