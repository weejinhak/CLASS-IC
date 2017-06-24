package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.LectureDTO;
import com.class_ic.vo.MemberDTO;

public interface AttendanceListDAO {
	

    //오늘 날짜에 맞는 출석 테이블을 select 해서 모두가져온다.
	public ArrayList<AttandanceDTO> attendanceSelect(String email,String classcode);
	
}
