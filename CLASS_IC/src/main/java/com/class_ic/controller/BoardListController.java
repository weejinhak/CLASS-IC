package com.class_ic.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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

	@RequestMapping(value = "boardcontentsave.htm", method = RequestMethod.POST)
	public void boardContentSave(HttpServletRequest request){
	System.out.println("boardContentSave 메소드 들어옴.");
    String title=(String)request.getParameter("title");
    String content=(String)request.getParameter("content");
    String cate=(String)request.getParameter("cate");
    String subcate=(String)request.getParameter("subcate");
    System.out.println(title+","+content+","+cate+","+subcate);
    
	
	}


}


