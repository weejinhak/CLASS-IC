package com.class_ic.app.dao;

import org.apache.ibatis.annotations.Param;

import com.class_ic.app.dto.memberdto;

public interface memberdao {

	public int login(@Param("id")String id, @Param("pw")String pw);
	public void attendanceMember(memberdto memberdto);
	
	public memberdto getMemberInfo(String id);
}