package com.class_ic.dao;

/*
* @FileName		:	BoardDAO.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.19
* @Author		:	최석환
*/
import java.sql.SQLException;
import java.util.List;

import com.class_ic.vo.BoardVO;
import com.class_ic.vo.SearchCriteria;



public interface BoardDAO {  
	
  public void create(BoardVO vo) throws ClassNotFoundException, SQLException;
  
  public List<String> getSubCateList(String cateCode) throws ClassNotFoundException, SQLException;
  
  public BoardVO read(Integer lectureNo) throws ClassNotFoundException, SQLException;
  
  public List<BoardVO> listAll() throws ClassNotFoundException, SQLException;
  
  public List<BoardVO> listWhereCate(String cateCode, String subcateCode) throws ClassNotFoundException, SQLException;
  
  public List<BoardVO> SearchList_MUL(String search);
  
  public void categoryCreate(String cateCode) throws ClassNotFoundException, SQLException;
  
  public void subCategoryCreate(String cateCode, String subcateCode) throws ClassNotFoundException, SQLException;
  
  public List<String> showCateList() throws ClassNotFoundException, SQLException;
  public List<String> showSubCateList(String cateCode) throws ClassNotFoundException, SQLException;
  
  public void delete(Integer lectureNo) throws ClassNotFoundException, SQLException;
  /////////////////////////////////////////////////////////////////////
  public List<BoardVO> listCriteria(int Page,int PerPageNum,String cateCode, String subcateCode) throws ClassNotFoundException, SQLException; //

  public int countPaging(String cateCode, String subcateCode) throws ClassNotFoundException, SQLException; //
  
  //use for dynamic sql
  
  public List<BoardVO> listSearch(SearchCriteria cri)throws ClassNotFoundException, SQLException; //
  
  public int listSearchCount(SearchCriteria cri)throws ClassNotFoundException, SQLException; //
  ///////////////////////////////////////////////////////////////////
  ////////////////////////file upload DAO///////////////////////////
 public void addAttach(String fullName)throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;  
   
  public void deleteAttach(Integer bno)throws Exception;
  
  public void replaceAttach(String fullName, Integer bno)throws Exception;
  //////////////////////////////////////////////////////////////////////////
  

}
