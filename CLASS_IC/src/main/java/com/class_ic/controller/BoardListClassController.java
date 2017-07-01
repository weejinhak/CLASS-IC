package com.class_ic.controller;



import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.app.dto.MemberDTO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.service.BoardClassListService;
import com.class_ic.service.BoardListService;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;



/*
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.07.1
* @Author		:	노지영
*/

/*
* @Class: BoardListClassController 
* @Date: 2017.07. 1
* @Author: 노지영
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/



@Controller
public class BoardListClassController {
	

	@Autowired
	private BoardClassListService boardclasslistservice;
	
	//boardList 게시판 이동
	@RequestMapping(value="teacher/board.htm", method=RequestMethod.GET)
	public String board(){

		return "teacher.board";
	}
	
    
}


