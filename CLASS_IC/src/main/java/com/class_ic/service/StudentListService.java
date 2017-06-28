package com.class_ic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.StudentListDAO;
import com.class_ic.vo.MemberDTO;

@Service
public class StudentListService implements StudentListDAO{
	
	@Autowired
	private SqlSession sqlsession;

	/*
	 * @description : 학적부 학생리스트 출력(강사페이지)
	 * */

	@Override
	public List<MemberDTO> selectStudent(String classCode) {
		System.out.println("classCode : "+ classCode);
		
		StudentListDAO dao = sqlsession.getMapper(StudentListDAO.class);
		List<MemberDTO> studentList = dao.selectStudent(classCode);
		
		return studentList;
	}
	
	

		
	
	

}







