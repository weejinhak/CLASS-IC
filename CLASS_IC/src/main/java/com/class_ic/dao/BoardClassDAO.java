package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

public interface BoardClassDAO {
	
	//기수에 담겨져있는 알맞는 카테고리 select
	ArrayList<SubCategoryDTO > selectCate(String email);
	
	//카테고리에 맞는 게시글을 select 해옴
	ArrayList<LectureBoardDTO> selectCateboard(SubCategoryDTO dto);
	
	//카테고리와 서브카테고리에 알맞는 게시글을 select 해옴.
	ArrayList<LectureBoardDTO> selectCateSubcateboard(SubCategoryDTO dto);
	
	//각 카테고리에 알맞는 서브카테고리를 중복 없이 select 해옴.
	ArrayList<SubCategoryDTO> selectSubcate(SubCategoryDTO dto);
	
	

}
