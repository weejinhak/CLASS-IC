package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.MemberDTO;

public interface StudentListDAO {
	
	//기수별 학생 전체 목록(학적부)
	public List<MemberDTO> selectStudent(String classCode);


}
