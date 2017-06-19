package com.class_ic.controller_category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.BoardService;
import com.class_ic.vo.BoardVO;

@Controller
@RequestMapping("board")
public class BoardController {
	
 
  @Autowired
  private BoardService service;
  
  //boardlist로 가는 controller
  @RequestMapping(value = "boardList.htm", method = RequestMethod.GET)
  public String listPage(Model model) throws Exception {
	  
	    

	    //모든 게시물들 리스트
	    model.addAttribute("boardList",service.listAll());
	    //카테고리 리스트
	    model.addAttribute("cateList", service.showCategoryList());
	    
		System.out.println("카테고리 리스트: "+service.showCategoryList());


    return "teacher.boardList";
  }
  
  
  @RequestMapping(value = "board_write.htm", method = RequestMethod.GET)
  public String boardWrite(Model model) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardWrite.htm");
	  
	  model.addAttribute("list", service.showCategoryList());
	  System.out.println("카테고리 리스트: "+service.showCategoryList());
	  
    return "teacher.board_write";
  }
  

  @RequestMapping(value = "boardWriteOk.htm", method = RequestMethod.POST)
  public String registPOST(BoardVO board) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardWriteOk.htm");
	  System.out.println(board.toString());
	  
	  //NULL 값 제거하기 위함
	  board.setLectureNo(1);
	  
	  System.out.println(board.toString());
	 
	  service.regist(board);

	  System.out.println("서비스는 잘 들어갔니?");

    return "teacher.boardList";
    
  }
  
  //카테고리 추가
  @RequestMapping(value = "makeCategory.htm", method = RequestMethod.POST)
  public String AddCategory(String cateTitle) throws Exception {
	  System.out.println("★서블렛 접속 : makeCategory.htm");
	  service.addCategory(cateTitle);

    
    return "리스트로 가는 주소!";
  }
  //SUB카테고리 추가
  @RequestMapping(value = "sss", method = RequestMethod.POST)
  public String AddSubCategory(String subcateTitle) throws Exception {
	  service.addCategory(subcateTitle);
    
    return "board.boardlist.htm";
  }

}
