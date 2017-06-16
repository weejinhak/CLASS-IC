package com.class_ic.dao;

import java.util.List;

import com.class_ic.util.Criteria;
import com.class_ic.util.SearchCriteria;
import com.class_ic.vo.BoardVO;



public interface BoardDAO {

  
	
  public void create(BoardVO vo) throws Exception;
  
  public BoardVO read(Integer bno) throws Exception;

  public List<BoardVO> listAll() throws Exception;

  public void categoryCreate(String cateTitle) throws Exception;
  
  public void subCategoryCreate(String subcateTitle) throws Exception;
  
  
  
  /////////////////////////////////////////////////////////////////////
  
  public List<BoardVO> listPage(int page) throws Exception;

  public List<BoardVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;
  
  
  public void updateReplyCnt(Integer bno, int amount)throws Exception;
  
  
  public void updateViewCnt(Integer bno)throws Exception;
  
  public void addAttach(String fullName)throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;  
   
  public void deleteAttach(Integer bno)throws Exception;
  
  public void replaceAttach(String fullName, Integer bno)throws Exception;
  
}
