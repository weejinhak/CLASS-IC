package com.class_ic.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.BoardClassDAO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

/*
* @Project		:	CLASS-IC
* @Date		    :	2017.07.1
* @Author		:	노지영
*/

/*
* @Class: BoardListController 
* @Date: 2017.07. 1
* @Author: 노지영
* @Desc: 클래스별 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 서비스.
*/

@Service
public class BoardClassListService {

	@Autowired
	private SqlSession sqlsession;

	
	// 서브 카테고리 insert
	public ModelAndView selectCate(HttpServletRequest request, HttpServletResponse response) { // lectureNo

		ModelAndView m = new ModelAndView();
		// 올걸
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);

		String[] color={"rose","blue","green","orange","red"};
		int count=0;
		HttpSession session=request.getSession();
		String email = (String) session.getAttribute("email");
		ArrayList<SubCategoryDTO> catelist= bdao.selectCate(email);
	    ArrayList<LectureBoardDTO> boardlist=null;
		SubCategoryDTO dto=new SubCategoryDTO();
		
		dto.setEmail(email);
		
		for(SubCategoryDTO list:catelist){
			list.setColor(color[count%4]);
			count++;
			
			
			dto.setCateCode(list.getCateCode());
			boardlist=bdao.selectCateboard(dto);
			list.setBoardlist(boardlist);
			
		
		}

		m.addObject("catelist",catelist);
		m.setViewName("teacher.board");

		
		return m;
	}
}
