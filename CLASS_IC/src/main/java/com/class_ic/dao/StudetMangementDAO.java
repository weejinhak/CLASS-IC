package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.StudentTableDTO;

public interface StudetMangementDAO {
	
	public String studentTableSetting(StudentTableDTO stable);
	
	public List<StudentTableDTO> getStudentTable();
	
	public List<MemberDTO> getStudentList();
	
	
	

}
