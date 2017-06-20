package com.class_ic.controller_category;
/*
* @FileName		:	BoardController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.19
* @Author		:	최석환
*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.BoardService;
import com.class_ic.vo.BoardVO;

@Controller
@RequestMapping("board")
public class T_BoardController {
	
 
  @Autowired
  private BoardService service;
  
  //board 리스트 보여주기
  @RequestMapping(value = "boardList.htm", method = RequestMethod.GET)
  public String listPage(Model model) throws Exception {
	  
	    System.out.println("★서블렛 접속 : boardList.htm");

	    //모든 게시물들 리스트
	    model.addAttribute("boardList", service.listAll());
	    //카테고리 리스트
	    model.addAttribute("cateList", service.showCateList());
	    
		System.out.println("카테고리 리스트: "+service.showCateList());


    return "teacher.board";
  }
  
  //글쓰기 view +카테고리와 서브카테고리 ㄱㄱ
  @RequestMapping(value = "board_write.htm", method = RequestMethod.GET)
  public String boardWrite(Model model) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardWrite.htm");
	  
	  model.addAttribute("list", service.showCateList());
	  System.out.println("카테고리 리스트: "+service.showCateList());
	  
    return "teacher.board_content";
  }
  
  //글쓰기 OK
  @RequestMapping(value = "boardWriteOk.htm", method = RequestMethod.POST)
  public String registPOST(BoardVO board) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardWriteOk.htm");
	  System.out.println(board.toString());
	  
	  //NULL 값 제거하기 위함
	  board.setLectureNo(1);
	  
	  System.out.println(board.toString());
	 
	  service.regist(board);

	  System.out.println("서비스는 잘 들어갔니?");

    return "teacher.board";
    
  }
  
  //카테고리 추가
  @RequestMapping(value = "makeCategory.htm", method = RequestMethod.POST)
  public String AddCategory(String cateCode) throws Exception {
	  System.out.println("★서블렛 접속 : makeCategory.htm");
	  service.addCategory(cateCode);

    
    return "리스트로 가는 주소!";
  }
  
  //SUB카테고리 추가
  @RequestMapping(value = "makeSubCategory.htm", method = RequestMethod.POST)
  public String AddSubCategory(String cateCode, String subcateCode) throws Exception {
	 
	  System.out.println("★서블렛 접속 : makeSubCategory.htm");
	  System.out.println("catecode & subcatecode"+cateCode+subcateCode);
	  
	  service.addSubCategory(cateCode,subcateCode);
	  
    
    return "디테일 리스트로 가는 주소!";
  }
  
  //그 게시판 하나의 상세내용
  @RequestMapping(value = "read.htm", method = RequestMethod.GET)
  public String read(Model model, Integer lectureNo) throws Exception {
	  System.out.println("★서블렛 접속 : read.htm");
	  service.read(lectureNo);
	  
	  
	  model.addAttribute("boardVO", service.read(lectureNo));
	  System.out.println("read의 값"+service.read(lectureNo).toString());
    return "teacher.board_details_view";
  }
  
//디테일한 board 리스트
  @RequestMapping(value = "detailList.htm", method = RequestMethod.GET)
  public String detail_listPage(Model model,String cateCode) throws Exception {
	    System.out.println("★서블렛 접속 : boardList.htm");

	    //모든 게시물들 리스트
	    model.addAttribute("boardList", service.listAll());
	    
	    //선택한 카테고리 리스트
	    model.addAttribute("cateCode", cateCode);
	    //세부카테고리 리스트
	    model.addAttribute("subCateList", service.showSubCateList(cateCode));
	   
	    
	    
	    
		System.out.println("카테고리 리스트: "+service.showCateList());
		System.out.println("세부 카테고리 리스트: "+service.showSubCateList(cateCode));
		
		
    return "teacher.board_details";
  }
  

}
