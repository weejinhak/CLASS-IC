package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.HomeworkDTO;

public interface HomeworkDAO {
	
	//과제게시판 카테고리 출력
	public List<HomeworkDTO> selectCate(String email);
	
	//카테고리별 조 등록
	public int addTeamDao(HomeworkDTO dto);
	
	//카테고리 선택시 조 출력
	public List<String> selectTeamDao(HomeworkDTO dto);
	
	//공지사항 등록 : 강사
 	public int addNoticeDao(HomeworkDTO dto);

 	//과제게시판 전체 출력
 	public List<HomeworkDTO> selectAll(HomeworkDTO dto);
 	
 	//과제게시판 상세보기
 	public List<HomeworkDTO> selectContent(int assignNo);
 	
 	//partyName별 출력 
    public List<HomeworkDTO> selectAllByTeacher(HomeworkDTO dto);
}
