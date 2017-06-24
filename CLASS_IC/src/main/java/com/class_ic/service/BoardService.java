package com.class_ic.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.BoardVO;
import com.class_ic.vo.Criteria;
import com.class_ic.vo.SearchCriteria;

/*
* @FileName		:	BoardService.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.19
* @Author		:	최석환
*/
@Service
public class BoardService {

  @Autowired
  private SqlSession sqlsession;

  
 
  public void regist(BoardVO board) throws Exception {
	System.out.println("♥regist 서비스 접속");
    
	BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	
	boarddao.create(board);
	
	System.out.println("♥regist 서비스 접속2");
	/* 
    String[] files = board.getFiles();
    
   if(files == null) { 
    					return; 
    				  } 
    
    for (String fileName : files) {
    	boarddao.addAttach(fileName);
    }   */
  }
  
  //AJAX 서브카테고리 정하기
  public List<String> getSubCateList(String cateCode) throws Exception {
		// TODO Auto-generated method stub
	  	System.out.println("서비스");
	  	BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		
		List<String> result = boarddao.getSubCateList(cateCode);
		
		return result;
  }
  
  public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		return boarddao.listAll();
	}
  public List<BoardVO> listWhereCate(String cateCode, String subcateCode) throws Exception {
		// TODO Auto-generated method stub
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		return boarddao.listWhereCate(cateCode,subcateCode);
	}

  
  public void addCategory(String cateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  boarddao.categoryCreate(cateCode);
	
  }

  
  public void addSubCategory(String subcateCode, String cateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  boarddao.subCategoryCreate(cateCode,subcateCode);
	  
	
  }
  /////////////////////criteria 들어가는거 다//////////////////////
  
  public List<BoardVO> listCriteria(SearchCriteria cri,String cateCode, String subcateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  
	  int page=cri.getPage();
	  int perPageNum = cri.getPerPageNum();
	  
	  
    return boarddao.listCriteria(page,perPageNum,cateCode,subcateCode);
  }

  
  public int listCountCriteria(SearchCriteria cri,String cateCode, String subcateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  
    return boarddao.countPaging(cateCode,subcateCode);
  }

  public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
    return boarddao.listSearch(cri);
  }

 
  public int listSearchCount(SearchCriteria cri) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
    return boarddao.listSearchCount(cri);
  }
  
  /////////////////////end criteria////////////////
  
  
 /////////////////////////////////////////////////////
  public List<String> showCateList() throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
  	
  	return boarddao.showCateList();
  }
  
  public List<String> showSubCateList(String cateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
  	
  	return boarddao.showSubCateList(cateCode);
  }
  
  ////////////////////////////////////////
  
  
  

 
public BoardVO read(Integer lectureNo) throws Exception {
	BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	
	return boarddao.read(lectureNo);
}



public void modify(BoardVO board) throws Exception {
	
	
}


 
public void delete(Integer lectureNo) throws Exception {
	
	BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	boarddao.delete(lectureNo);
	
}


public List<String> getAttach(Integer lectureNo) throws Exception {
	// TODO Auto-generated method stub
	return null;
}

/*public List<BoardVO> SearchList_MUL(String search) throws Exception {
	
	 BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	 return boarddao.SearchList_MUL(search);
	}*/
}
