package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.HomeworkDTO;

public interface HomeworkDAO {
	
	//과제게시판 카테고리 출력
	public List<HomeworkDTO> selectCate(String email);
	
	//카테고리별 조 등록
	public int addTeamDao(HomeworkDTO dto);

}
