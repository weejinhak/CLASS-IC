/*
* @FileName		:	AttendanceListService.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	위진학
*/
package com.class_ic.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.AttendanceListDAO;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.MemberDTO;

/*
* @Class: AlarmService
* @Date: 2017.06. 25
* @Author: 위진학
* @Desc: Controller에서 받은 parameter를 실질적으로 Mapper에 넘겨주는 service
*/
@Service
public class AttendanceListService implements AttendanceListDAO{
	

	@Autowired
	private SqlSession sqlsession;

	/*
	@description : attendance 테이블에서 select 해주는 기능. (학생)
	*/
	@Override
	public ArrayList<AttandanceDTO> attendanceSelect(String email, String classcode){		

		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);		
		ArrayList<AttandanceDTO> memberList=attendancelistDao.attendanceSelect(email,classcode);	
		
		return memberList;			
	}

	
	
	
	
		
	

}
