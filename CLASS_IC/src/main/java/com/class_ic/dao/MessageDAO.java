package com.class_ic.dao;

import java.util.ArrayList;

import com.class_ic.vo.MemberDTO;

public interface MessageDAO {
	
	//나랑 같은 기수의 학생,선생의 아이디와 이름을 가져오는 메소드.
	public ArrayList<MemberDTO> selectSameMemberList(String classCode);
	   
		
		
}
