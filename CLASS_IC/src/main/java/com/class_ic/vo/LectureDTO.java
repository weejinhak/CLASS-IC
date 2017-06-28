package com.class_ic.vo;

import java.sql.Date;

public class LectureDTO {
	
	String classCode; 
	String classTitle; 
	Date classStart; 
 	Date classEnd; 
	String classOpenTime=null;
	String classCloseTime=null;
	String classInviteCode;
	String email;
	
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public Date getClassStart() {
		return classStart;
	}
	public void setClassStart(Date classStart) {
		this.classStart = classStart;
	}
	public Date getClassEnd() {
		return classEnd;
	}
	public void setClassEnd(Date classEnd) {
		this.classEnd = classEnd;
	}
	public String getClassOpenTime() {
		return classOpenTime;
	}
	public void setClassOpenTime(String classOpenTime) {
		this.classOpenTime = classOpenTime;
	}
	public String getClassCloseTime() {
		return classCloseTime;
	}
	public void setClassCloseTime(String classCloseTime) {
		this.classCloseTime = classCloseTime;
	}
	public String getClassInviteCode() {
		return classInviteCode;
	}
	public void setClassInviteCode(String classInviteCode) {
		this.classInviteCode = classInviteCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	

}
