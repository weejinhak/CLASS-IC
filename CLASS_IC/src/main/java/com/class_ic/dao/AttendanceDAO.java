package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.MemberDTO;

public interface AttendanceDAO {
	
	//attendance 테이블에  insert
	public void insert(AttandanceDTO dto);
	
	//member 테이블에 있는 모든 데이터를  받아옴.
	public ArrayList<MemberDTO> memberSelectAll();
	
	//이메일에 알맞는 classcode를 select 해옴
	public String selectClassNumber(String email);
	

	public ArrayList<AttandanceDTO> todayAttendaceData();
	
}
