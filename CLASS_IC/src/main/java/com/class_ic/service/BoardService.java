package com.class_ic.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.BoardVO;


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

  
  public void addCategory(String cateTilte) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  boarddao.categoryCreate(cateTilte);
	
  }

  
  public void addSubCategory(String subcateTitle) throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	  boarddao.subCategoryCreate(subcateTitle);
	
  }
  
 
  public List<String> showCategoryList() throws Exception {
	  BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
  	
  	return boarddao.showCateList();
  }
  
  ////
  
  
  

 
public BoardVO read(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	return null;
}


 
public void modify(BoardVO board) throws Exception {
	// TODO Auto-generated method stub
	
}


 
public void remove(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	
}


 
public List<BoardVO> listAll() throws Exception {
	// TODO Auto-generated method stub
	BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
	return boarddao.listAll();
}


 


 
public List<String> getAttach(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	return null;
}





}
