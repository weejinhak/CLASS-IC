package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.AttandanceDTO;

public interface StudentListDAO {
	
	//기수별 학생 전체 목록, 입실체크(학적부)
	public List<AttandanceDTO> selectStudent(String classCode);
	



}
