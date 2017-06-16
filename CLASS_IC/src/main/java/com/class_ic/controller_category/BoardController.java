package com.class_ic.controller_category;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.class_ic.Service.BoardService;
import com.class_ic.util.PageMaker;
import com.class_ic.util.SearchCriteria;
import com.class_ic.vo.BoardVO;



@Controller
@RequestMapping("board")
public class BoardController {
	
  private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
  
  @Inject
  private BoardService service;
  
  //boardlist로 가는 controller
  @RequestMapping(value = "boardList.htm", method = RequestMethod.GET)
  public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	  
	    logger.info(cri.toString());

	    // model.addAttribute("list", service.listCriteria(cri));
	    model.addAttribute("list", service.listSearchCriteria(cri));
	    


	    
    

    
    return "teacher.boardList";
  }
  
  @RequestMapping(value = "board_write.htm", method = RequestMethod.GET)
  public String boardWrite() throws Exception {
	  System.out.println("★서블렛 접속 : boardWrite.htm");

    
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
  @RequestMapping(value = "boardlist.htm", method = RequestMethod.POST)
  public String AddCategory(String cateTitle) throws Exception {
	  service.addCategory(cateTitle);

    
    return "board.boardlist.htm";
  }

}