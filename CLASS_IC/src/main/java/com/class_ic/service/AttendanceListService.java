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
import com.class_ic.vo.AttandanceListDTO;

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

	/*
	@description : attendance 테이블에서 select 해주는 기능. (강사)
	*/
	@Override
	public ArrayList<AttandanceListDTO> attendanceSelectByTeacher(String email, String classcode){		

		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);		
		
		ArrayList<AttandanceListDTO> memberList=attendancelistDao.attendanceSelectByTeacher(email,classcode);	
		
		return memberList;			
	}

	/*
	@description : attendance 테이블에서 아이디에 맞는 TotalCount 해주는 기능(학생)
	*/
	@Override
	public int attendanceTotalCount(String email, String classcode) {
		
		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);
		
	    int attendancetotalcount = attendancelistDao.attendanceTotalCount(email, classcode);
		
		return attendancetotalcount;
	}

	
	/*
	@description : attendance 테이블에서 아이디에 맞는 출석 수 해주는 기능(학생)
	*/
	@Override
	public int attendanceNomalCount(String email, String classcode) {
		
		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);		
		
		int attendancenomalcount = attendancelistDao.attendanceNomalCount(email, classcode);
		
		return attendancenomalcount;
	}

	
	/*
	@description : attendance 테이블에서 아이디에 맞는 지각 수 해주는 기능(학생)
	*/
	@Override
	public int attendLateCount(String email, String classcode) {
		
		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);	
		
		int attendlatecount = attendancelistDao.attendLateCount(email, classcode);
		
		return attendlatecount;
	}

	
	/*
	@description : attendance 테이블에서 아이디에 맞는 결석 수  해주는 기능(학생)
	*/
	@Override
	public int attendAbsenceCount(String email, String classcode) {
		
		AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);		
		
		int attendabsencecount = attendancelistDao.attendAbsenceCount(email, classcode);
		
		return attendabsencecount;
	}

	
	/*
	@description : attendance 테이블에서 아이디에 맞는 결석 수  해주는 기능(학생)
	*/
	@Override
	public int attendEarlyLeaveCount(String email, String classcode) {
        AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);		
		
		int attendearlyleavecount = attendancelistDao.attendEarlyLeaveCount(email, classcode);
		
		return attendearlyleavecount;
	}

	
	
	
	/*
	@description : attendance 테이블에서 아이디에 맞는 출석 총 수  해주는 기능(강사)
	*/
	@Override
	public int attendanceTotalCountTeacher(String email, String classcode) {
		return 0;
	}
	
	/*
	@description : attendance 테이블에서 아이디에 맞는 출석 수  해주는 기능(강사)
	*/

	@Override
	public int attendanceNomalCountTeacher(String email, String classcode) {
		return 0;
	}
	
	/*
	@description : attendance 테이블에서 아이디에 맞는 지각 수  해주는 기능(강사)
	*/

	@Override
	public int attendLateCountTeacher(String email, String classcode) {
		return 0;
	}
	
	/*
	@description : attendance 테이블에서 아이디에 맞는 결석 수  해주는 기능(강사)
	*/

	@Override
	public int attendAbsenceCountTeacher(String email, String classcode) {
		return 0;
	}
	
	/*
	@description : attendance 테이블에서 아이디에 맞는 조퇴 수  해주는 기능(강사)
	*/

	@Override
	public int attendEarlyLeaveCountTeacher(String email, String classcode) {
		return 0;
	}

	@Override
	public ArrayList<AttandanceDTO> selectEachStudent(AttandanceDTO dto) {
		   AttendanceListDAO attendancelistDao= sqlsession.getMapper(AttendanceListDAO.class);	
		   ArrayList<AttandanceDTO> selecteachstudent=attendancelistDao.selectEachStudent(dto);
		return selecteachstudent;
	}


}
