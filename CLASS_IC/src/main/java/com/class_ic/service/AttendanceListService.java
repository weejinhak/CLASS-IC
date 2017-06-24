package com.class_ic.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.AttendanceListDAO;
import com.class_ic.vo.MemberDTO;


@Service
public class AttendanceListService implements AttendanceListDAO{
	

	@Autowired
	private SqlSession sqlsession;

	/*
	@description : attendance 테이블에 select 해주는 기능.
	*/
	@Override
	public ArrayList<MemberDTO> attendanceSelect(String email, String classcode){
		

		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);
		

		ArrayList<MemberDTO> memberList=attendancelistDao.attendanceSelect(email,classcode);
	
		
		return memberList;
		
		
		
	}

	
	
	
	
		
	

}
