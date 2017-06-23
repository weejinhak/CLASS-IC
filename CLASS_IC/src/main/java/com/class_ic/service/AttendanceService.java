package com.class_ic.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.AttendanceDAO;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.MemberDTO;


@Service
public class AttendanceService {
	

	@Autowired
	private SqlSession sqlsession;

	/*
	@description : attendance 테이블에 insert 해주는 기능.
	*/

	public void insertAttendance(){
		
		AttandanceDTO dto=new AttandanceDTO();

		AttendanceDAO attendanceDao=sqlsession.getMapper(AttendanceDAO.class);
		

		ArrayList<MemberDTO> memberList=attendanceDao.memberSelectAll();
		
		String email="";
		
		for(int i=0;i<memberList.size();i++){
			

			//dto.setAttendDate(new Date(2017-12-12)); //sysdate
			dto.setAttendState("결석"); 
			email=memberList.get(i).getEmail();
			System.out.println(email);
			dto.setClassCode(attendanceDao.selectClassNumber(email)); 
	
			dto.setEmail(email); 
			dto.setInClass(null);
			dto.setOutClass(null);
			attendanceDao.insert(dto);

			System.out.println("insert"+i);
			
		
		}
	}
	
	
	
		
	

}
