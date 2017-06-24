package com.class_ic.controller_category;
import java.util.List;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.service.BoardService;
import com.class_ic.vo.BoardVO;
import com.class_ic.vo.Criteria;
import com.class_ic.vo.PageMaker;
import com.class_ic.vo.SearchCriteria;

@Controller
@RequestMapping("board")
public class T_BoardController {
	
 
  @Autowired
  private BoardService service;
  
  //board ALL 리스트 보여주기
  @RequestMapping(value = "boardList.htm", method = RequestMethod.GET)
  public String listPage(Model model) throws Exception {
	  
	    System.out.println("★서블렛 접속 : boardList.htm");
	    //모든 게시물들 리스트
	    model.addAttribute("boardList", service.listAll());
	    //카테고리 리스트
	    model.addAttribute("cateList", service.showCateList());
	    
		System.out.println("카테고리 리스트: " +service.showCateList());
		
    return "teacher.board";
  }
  
//카테,서브카테고리 처리한 board 리스트
  @RequestMapping(value = "detailList.htm", method = RequestMethod.GET)
  public String detail_listPage(@ModelAttribute("cri") Criteria cri,Model model,String cateCode) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardList.htm");

	    //모든 게시물들 리스트
	  	
	  
	    //선택한 카테고리 리스트
	    model.addAttribute("cateCode", cateCode);
	    
	    //세부카테고리 리스트
	    model.addAttribute("subCateList", service.showSubCateList(cateCode));
	    
	    ////////////////paging 처리 START////////////

	    ////////////END//////////////////////
	    
	    
		System.out.println("카테고리 리스트: "+service.showCateList());
		System.out.println("세부 카테고리 리스트: "+service.showSubCateList(cateCode));
		
		
    return "teacher.board_details";
  }

  
  //글쓰기 view +카테고리와 서브카테고리 ㄱㄱ
  @RequestMapping(value = "board_write.htm", method = RequestMethod.GET)
  public String boardWrite(Criteria cri, Model model) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardWrite.htm");
	  
	  model.addAttribute("list", service.showCateList());
	  System.out.println("카테고리 리스트: "+service.showCateList());
	  
    return "teacher.board_content";
  }
  
  //글쓰기 OK
  @RequestMapping(value = "boardWriteOk.htm", method = RequestMethod.POST)
  public String registPOST(Model model,BoardVO board) throws Exception {
	  
	  System.out.println("★서블렛 접속 : boardWriteOk.htm");
	  System.out.println(board.toString());
	  
	  //NULL 값 제거하기 위함
	  board.setLectureNo(1);
	  ////////////////////////////값들 가져와주는거////////////////////////////////
	    System.out.println("★서블렛 접속 : boardList.htm");
	    //모든 게시물들 리스트
	    model.addAttribute("boardList", service.listAll());
	    //카테고리 리스트
	    model.addAttribute("cateList", service.showCateList());
	    
		System.out.println("카테고리 리스트: " +service.showCateList());
	  ////////////////////////////값들 가져와주는거///////////////////////////////////
	  System.out.println(board.toString());
	 
	  service.regist(board);
	  
	    //////////////파일 업로드 부분//////////////////////
	    String[] files = board.getFiles();
	    
	    if(files == null) 
	    { return "teacher.board"; } 
	    
	    for (String fileName : files) {
	      /*dao.addAttach(fileName);*/ //추후 맵퍼 만들자
	    }
	    ////////////파일 업로드 부분 끝///////////////////////

	  System.out.println("서비스는 잘 들어갔니?");

    return "teacher.board";
    
  }
  
  //수정 어렵겠다 ㅜㅠ
  @RequestMapping(value = "Modify.htm", method = RequestMethod.POST)
  public String Modify() throws Exception {
	 
	  System.out.println("★서블렛 접속 : Modify.htm");
	  
	//  service.modify(lectureNo);
	  //boardVO 에값을 일단 뿌려줘야겠네
    
    return "teacher.board_content";
  }
  
  //수정 OK
  @RequestMapping(value = "ModifyOK.htm", method = RequestMethod.POST)
  public String ModifyOK() throws Exception {
	 
	  System.out.println("★서블렛 접속 : Modify.htm");
	  
	//  service.modifyOK(lectureNo);
	  
    
    return "teacher.board_content";
  }
  
  
  //삭제 ㅜㅜ
  @RequestMapping(value = "delete.htm", method = RequestMethod.GET)
  public String Delete(Model model,int lectureNo) throws Exception {
	  
	  System.out.println("★서블렛 접속 : delete.htm");

	 service.delete(lectureNo);
	 
	 System.out.println("★서블렛 접속 : boardList.htm");
	    //모든 게시물들 리스트
	 model.addAttribute("boardList", service.listAll());
	    //카테고리 리스트
	 model.addAttribute("cateList", service.showCateList());
	    
	 System.out.println("카테고리 리스트: "+service.showCateList());
	  
    
    return "teacher.board";
  }
  
  
  //목록가기
  @RequestMapping(value = "goList.htm", method = RequestMethod.POST)
  public String goList(Integer lectureNo,String cateCode, String subcateCode) throws Exception {
	 
	  System.out.println("★서블렛 접속 : delete.htm");

	 // service.delete(lectureNo);
	  
    
    return "teacher.board_details";
  }
  
  //카테고리 추가
  @RequestMapping(value = "makeCategory.htm", method = RequestMethod.POST)
  public String AddCategory(String cateCode, Model model) throws Exception {
	  System.out.println("★서블렛 접속 : makeCategory.htm");
	  service.addCategory(cateCode);
	  
	  model.addAttribute("boardList", service.listAll());
	  //카테고리 리스트
	  model.addAttribute("cateList", service.showCateList());
    
    return "teacher.board";
  }
  
  //SUB카테고리 추가
  @RequestMapping(value = "makeSubCategory.htm", method = RequestMethod.POST)
  public String AddSubCategory(@ModelAttribute("cri") SearchCriteria cri, String cateCode, String subcateCode, Model model) throws Exception {
	 
	  System.out.println("★서블렛 접속 : makeSubCategory.htm");
	  System.out.println("catecode & subcatecode"+cateCode+subcateCode);
	  
	  service.addSubCategory(cateCode,subcateCode);
	  
	  //
	    System.out.println("★서블렛 접속 : detailList_board.htm");
	    System.out.println("파라미터 받았니?"+cateCode+subcateCode);
	    System.out.println("cri에 담겨져 있는것"+cri.toString());
	    System.out.println("total count??:"+service.listCountCriteria(cri,cateCode,subcateCode));
	    
	    //선택된 카테고리 게시판 리스트
	    model.addAttribute("CateBoardList",service.listWhereCate(cateCode, subcateCode));
	    System.out.println("카테고리 where 게시판리스트"+service.listWhereCate(cateCode, subcateCode));
	    //선택한 카테고리 리스트
	    model.addAttribute("cateCode", cateCode);
	    //세부카테고리 리스트
	    model.addAttribute("subCateList", service.showSubCateList(cateCode));
	    //현재 카테코드
	    model.addAttribute("subcateCode", subcateCode);
	    
	    ////////////////paging 처리 START////////////
	    //model.addAttribute("list", service.listSearchCriteria(cri)); //맵퍼 : boarddao.listSearch
	    model.addAttribute("list", service.listCriteria(cri,cateCode,subcateCode)); //맵퍼 : boarddao.
	    
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri,cateCode,subcateCode));
		//pageMaker.setTotalCount(service.listSearchCount(cri)); //맵퍼 : boarddao.listSearchCount(cri)
		
		model.addAttribute("pageMaker", pageMaker);
	    ////////////paging 처리 END//////////////////////
		
    return "teacher.board_details";
  }
  
  //디테일한 boardList에서 눌렀을때 ajax 처리해줄거임
  @RequestMapping(value = "detailList_board.htm", method = RequestMethod.GET)
  public String detail_listPage_board(@ModelAttribute("cri") SearchCriteria cri, Model model, String cateCode, String subcateCode) throws Exception {
	    System.out.println("★서블렛 접속 : detailList_board.htm");
	    System.out.println("파라미터 받았니?"+cateCode+subcateCode);
	    System.out.println("cri에 담겨져 있는것"+cri.toString());
	    System.out.println("total count??:"+service.listCountCriteria(cri,cateCode,subcateCode));
	    
	    //선택된 카테고리 게시판 리스트
	    model.addAttribute("CateBoardList",service.listWhereCate(cateCode, subcateCode));
	    System.out.println("카테고리 where 게시판리스트"+service.listWhereCate(cateCode, subcateCode));
	    //선택한 카테고리 리스트
	    model.addAttribute("cateCode", cateCode);
	    //세부카테고리 리스트
	    model.addAttribute("subCateList", service.showSubCateList(cateCode));
	    //현재 카테코드
	    model.addAttribute("subcateCode", subcateCode);
	    
	    ////////////////paging 처리 START////////////
	    //model.addAttribute("list", service.listSearchCriteria(cri)); //맵퍼 : boarddao.listSearch
	    model.addAttribute("list", service.listCriteria(cri,cateCode,subcateCode)); //맵퍼 : boarddao.
	    
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri,cateCode,subcateCode));
		//pageMaker.setTotalCount(service.listSearchCount(cri)); //맵퍼 : boarddao.listSearchCount(cri)
		
		model.addAttribute("pageMaker", pageMaker);
	    ////////////paging 처리 END//////////////////////
		
    return "teacher.board_details";
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
  
  
  @RequestMapping("/getAttach/{fileNo}")
  @ResponseBody
  public List<String> getAttach(@PathVariable("fileNo")Integer fileNo)throws Exception{
	  													
    return service.getAttach(fileNo);
  
  }
  
  
/*  @RequestMapping(value = "SearchList_MUL.htm", method = RequestMethod.GET)
  public String SearchList_MUL(Model model,String search) throws Exception {
  	  	
  	  	System.out.println("SearchList_MUL 접속");
  	  	
  	    model.addAttribute("searchList", service.SearchList_MUL(search));
  	    
  	    return "teacher.board";
  } */ 

}
