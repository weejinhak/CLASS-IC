package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.AttandanceListDTO;
import com.class_ic.vo.LectureDTO;
import com.class_ic.vo.MemberDTO;

public interface AttendanceListDAO {
	

    //이메일과 기수에 맞는출석 테이블을 select 해서 모두가져온다.(학생)
	public ArrayList<AttandanceDTO> attendanceSelect(String email,String classcode);
	
    //이메일과 기수에 맞는 출석 테이블을 select 해서 모두가져온다.(강사)
	public ArrayList<AttandanceListDTO> attendanceSelectByTeacher(String email,String classcode);

	//아이디와 기수에 맞는 출석테이블의 총 수(학생)
	public int attendanceTotalCount(String email,String classcode);
	
	//아이디와 기수에 맞는 출석테이블의 출석 수(학생)
	public int attendanceNomalCount(String email,String classcode);
	
	//아이디와 기수에 맞는 출석테이블의 지각 수(학생)
	public int attendLateCount(String email,String classcode);
	
	//아이디와 기수에 맞는 출석테이블의 결석 수(학생)
	public int attendAbsenceCount(String email,String classcode);
	
	//아이디와 기수에 맞는 출석테이블의 조퇴 수(학생)
	public int attendEarlyLeaveCount(String email,String classcode);
}
