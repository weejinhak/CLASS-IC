package com.class_ic.vo;

import java.sql.Date;

public class AttandanceDTO {

	
	private int attendNo; 
	private String email; //이메일
	private Date attendDate; 
	private String inClass; //출석시간
	private String outClass; //퇴실시간
	private String attendState; //출석상태
	private String classCode; //기수 코드
	public int getAttendNo() {
		return attendNo;
	}
	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(Date attendDate) {
		this.attendDate = attendDate;
	}
	public String getInClass() {
		return inClass;
	}
	public void setInClass(String inClass) {
		this.inClass = inClass;
	}
	public String getOutClass() {
		return outClass;
	}
	public void setOutClass(String outClass) {
		this.outClass = outClass;
	}
	public String getAttendState() {
		return attendState;
	}
	public void setAttendState(String attendState) {
		this.attendState = attendState;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	@Override
	public String toString() {
		return "AttandanceDTO [attendNo=" + attendNo + ", email=" + email + ", attendDate=" + attendDate + ", inClass="
				+ inClass + ", outClass=" + outClass + ", attendState=" + attendState + ", classCode=" + classCode
				+ "]";
	}
	
	
	
	

}
