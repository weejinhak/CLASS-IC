package com.class_ic.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.BoardListService;
import com.class_ic.util.MediaUtils;
import com.class_ic.util.UploadFileUtils;
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
	private BoardListService boardlistservice;
	

	@RequestMapping(value = "boardcontent.htm", method = RequestMethod.POST)
	public String boardContentView(HttpServletRequest request){
		
		
	
		return "common/board_content";

	
	}
	
	
	@RequestMapping(value = "boardcontentsave.htm", method = RequestMethod.POST)
	public String boardContentSave(HttpServletRequest request){
		
		boardlistservice.boardContentSaveService(request);
		
	/*System.out.println("boardContentSave 메소드 들어옴.");
    String title=(String)request.getParameter("title");
    String content=(String)request.getParameter("content");
    String cate=(String)request.getParameter("cate");
    String subcate=(String)request.getParameter("subcate");
    System.out.println(title+","+content+","+cate+","+subcate);
    
    LectureBoardDTO dto= new LectureBoardDTO();
    dto.setClassCode("kkj01331@naver.com");
    dto.setCateCode(cate);
    dto.setSubcateCode(subcate);
    dto.setLectureContent(content);
    dto.setLectureTitle(title);
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
    
    board.insertBoardContent(dto);*/
	return "common/board_content";

	
	}
	

	@RequestMapping(value = "selectcategory.htm", method = RequestMethod.POST)
	public String selectCategory(Model model,HttpServletRequest request){

	
	
	String viewpage = boardlistservice.selectCategoryService(model, request);
   /* BoardDAO board=sqlsession.getMapper(BoardDAO.class);
	List<CategoryDTO> totalcate= board.selectCategory();
	
	System.out.println(totalcate);
	
	model.addAttribute("listcategory",totalcate);*/
	
    /*	for(String value: totalcate){
	 System.out.println(value);
	}
	*/
	
	return viewpage;
    
	
	}
	
	@RequestMapping(value = "selectsubcategory.htm", method = RequestMethod.POST)
	public String selectSubCategory(Model model,HttpServletRequest request){
		
		String viewpage=boardlistservice.selectSubCategoryService(model, request);
		
	/*
	 System.out.println("selectsubcategory 메소드 들어옴.");
	
	String cate=request.getParameter("cate");
	System.out.println(cate);
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
	List<SubCategoryDTO> subcate= board.selectSubCategory();
	
	ArrayList<SubCategoryDTO> subcate2 = new ArrayList<SubCategoryDTO>();
	for(SubCategoryDTO value:subcate){
		if(value.getCateCode().equals(cate)){
			subcate2.add(value);
			System.out.println(value.getSubcateCode());
		}
	}
	
	model.addAttribute("subcategory",subcate2);
	*/
	

	return viewpage;
    
	
	}



	
	@RequestMapping(value = "teacher/insertboard.htm")
	public String insertBoard(Model model,HttpServletRequest request){


	return "teacher.board_content";
    
	
	}
	


}


