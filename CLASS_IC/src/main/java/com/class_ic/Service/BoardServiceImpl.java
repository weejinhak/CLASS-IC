package com.class_ic.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.class_ic.dao.BoardDAO;
import com.class_ic.util.Criteria;
import com.class_ic.util.SearchCriteria;
import com.class_ic.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

  @Inject
  private BoardDAO dao;

  
  @Transactional
  @Override
  public void regist(BoardVO board) throws Exception {
	System.out.println("♥regist 서비스 접속");
    
	dao.create(board);
	System.out.println("♥regist 서비스 접속2");
    String[] files = board.getFiles();
    
    if(files == null) { 
    					return; 
    				  } 
    
    for (String fileName : files) {
      dao.addAttach(fileName);
    }   
  }

  @Override
  public void addCategory(String cateTilte) throws Exception {
	dao.categoryCreate(cateTilte);
	
  }

  @Override
  public void addSubCategory(String subcateTitle) throws Exception {
	dao.subCategoryCreate(subcateTitle);
	
  }
  
  ////
  
  
  

@Override
public BoardVO read(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	return null;
}


@Override
public void modify(BoardVO board) throws Exception {
	// TODO Auto-generated method stub
	
}


@Override
public void remove(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	
}


@Override
public List<BoardVO> listAll() throws Exception {
	// TODO Auto-generated method stub
	return null;
}


@Override
public List<BoardVO> listCriteria(Criteria cri) throws Exception {
	// TODO Auto-generated method stub
	return null;
}


@Override
public int listCountCriteria(Criteria cri) throws Exception {
	// TODO Auto-generated method stub
	return 0;
}


@Override
public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
	// TODO Auto-generated method stub
	return null;
}


@Override
public int listSearchCount(SearchCriteria cri) throws Exception {
	// TODO Auto-generated method stub
	return 0;
}


@Override
public List<String> getAttach(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	return null;
}



}
