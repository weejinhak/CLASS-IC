package com.class_ic.dao;

import java.sql.SQLException;
import java.util.List;

import com.class_ic.vo.BoardVO;



public interface BoardDAO {  
	
  public void create(BoardVO vo) throws ClassNotFoundException, SQLException;
  
  public BoardVO read(Integer bno) throws ClassNotFoundException, SQLException;

  public List<BoardVO> listAll() throws ClassNotFoundException, SQLException;

  public void categoryCreate(String cateTitle) throws ClassNotFoundException, SQLException;
  
  public void subCategoryCreate(String subcateTitle) throws ClassNotFoundException, SQLException;
  
  public List<String> showCateList() throws ClassNotFoundException, SQLException;
  
  /////////////////////////////////////////////////////////////////////

}
