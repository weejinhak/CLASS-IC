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



public interface BoardDAO {  
	
  public void create(BoardVO vo) throws ClassNotFoundException, SQLException;
  
  public BoardVO read(Integer lectureNo) throws ClassNotFoundException, SQLException;

  public List<BoardVO> listAll() throws ClassNotFoundException, SQLException;

  public void categoryCreate(String cateCode) throws ClassNotFoundException, SQLException;
  
  public void subCategoryCreate(String cateCode, String subcateCode) throws ClassNotFoundException, SQLException;
  
  public List<String> showCateList() throws ClassNotFoundException, SQLException;
  public List<String> showSubCateList(String cateCode) throws ClassNotFoundException, SQLException;
  /////////////////////////////////////////////////////////////////////

}
