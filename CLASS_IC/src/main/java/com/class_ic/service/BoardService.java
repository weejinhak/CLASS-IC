package com.class_ic.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.BoardVO;

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
  public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		return boarddao.listAll();
	}

  
  public void addCategory(String cateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  boarddao.categoryCreate(cateCode);
	
  }

  
  public void addSubCategory(String subcateCode, String cateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  boarddao.subCategoryCreate(cateCode,subcateCode);
	  
	
  }
  
 
  public List<String> showCateList() throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
  	
  	return boarddao.showCateList();
  }
  
  public List<String> showSubCateList(String cateCode) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
  	
  	return boarddao.showSubCateList(cateCode);
  }
  
  ////
  
  
  

 
public BoardVO read(Integer lectureNo) throws Exception {
	BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	
	return boarddao.read(lectureNo);
}















 
public void modify(BoardVO board) throws Exception {
	// TODO Auto-generated method stub
	
}


 
public void remove(Integer lectureNo) throws Exception {
	// TODO Auto-generated method stub
	
}


public List<String> getAttach(Integer lectureNo) throws Exception {
	// TODO Auto-generated method stub
	return null;
}





}
