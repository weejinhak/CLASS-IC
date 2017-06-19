package com.class_ic.service_category;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.vo.StudentTableDTO;

@Service
public class StudentManagementService {
	@Autowired
	private SqlSession sqlsession;
	
	public String studentTableSetting(StudentTableDTO stable){
		
		return null;
	}

}
