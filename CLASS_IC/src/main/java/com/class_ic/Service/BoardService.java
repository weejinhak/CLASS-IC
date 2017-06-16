package com.class_ic.Service;

import java.util.List;

import com.class_ic.util.Criteria;
import com.class_ic.util.SearchCriteria;
import com.class_ic.vo.BoardVO;



public interface BoardService {

  public void regist(BoardVO board) throws Exception;
  
  public void addCategory(String cateTilte) throws Exception;
  
  public void addSubCategory(String subcateTitle) throws Exception;
  
  public List<String> showCategoryList() throws Exception;
  
  ////////////////////
  public BoardVO read(Integer bno) throws Exception;

  public void modify(BoardVO board) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<BoardVO> listAll() throws Exception;

  public List<BoardVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;
  
  public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
  
  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}
