package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.ClassByLectureDTO;

public interface BoardDAO {  
	
	//메인 카테고리를 select 해서 기수에 알맞게 
	//ClassByLecture 테이블에 선택된 카테고리를 뿌려준다.
	public ArrayList<CategoryDTO> selectCategoryList
	(ArrayList<ClassByLectureDTO> selectClassByLectureList );
	
	//기수에 선택된 게시글들의 정보를 가져오는 dao
	public ArrayList<ClassByLectureDTO> selectClassByLectureList
(String classCode);
	

}
