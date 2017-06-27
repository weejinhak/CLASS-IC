package com.class_ic.dao;

import java.util.ArrayList;
import java.util.List;

import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

public interface BoardDAO {  
	
	//통합 게시판 글입력
	int insertBoardContent(LectureBoardDTO lectureBoardDTO);
	
	//통합 게시판 카테고리 모두가져오기
	List<CategoryDTO> selectCategory();
	
	//통합 게시판 서브 카테고리 모두가져오기
	ArrayList<SubCategoryDTO> selectSubCategory();
	
	
	


}
