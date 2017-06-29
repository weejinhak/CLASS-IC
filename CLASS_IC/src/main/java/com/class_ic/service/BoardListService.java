package com.class_ic.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

/*
* @Project		:	CLASS-IC
* @Date		    :	2017.06.27
* @Author		:	이현정
*/

/*
* @Class: BoardListController 
* @Date: 2017.06. 27
* @Author: 이현정
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/


@Service
public class BoardListService {
	
	@Autowired
	private SqlSession sqlsession;
	

	public void boardContentSaveService(HttpServletRequest request){
	System.out.println("boardContentSave 메소드 들어옴.");
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
    
    board.insertBoardContent(dto);

	
	}
	

	public String selectCategoryService(Model model,HttpServletRequest request){
	System.out.println("selectCategory 메소드 들어옴.");
	
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
	List<CategoryDTO> totalcate= board.selectCategory();
	
	System.out.println(totalcate);
	
	model.addAttribute("listcategory",totalcate);
	
	
	String viewpage="common/boardCateList";
	
    /*	for(String value: totalcate){
	 System.out.println(value);
	}
	*/
	
	return viewpage;
    
	
	}
	

	public String selectSubCategoryService(Model model,HttpServletRequest request){
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
	String viewpage="common/boardSubCateList";
	

	return viewpage;
    
	
	}

}
