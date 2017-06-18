package com.class_ic.dao;

import java.sql.SQLException;

import com.class_ic.vo.LectureDTO;


public interface LectureAddDAO {

	//이메일에 맞는 강의기수 정보 얻기
	public LectureDTO getlecture(String email) throws ClassNotFoundException, SQLException;
	//강의 추가
	public int insert(LectureDTO lecture) throws ClassNotFoundException, SQLException;

	
}
