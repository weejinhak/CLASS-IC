package com.class_ic.vo;

public class StudentTable {
	
	private String email;
	private String position;
	
	
	
	public StudentTable() {}
	public StudentTable(String email, String position) {
		this.email = email;
		this.position = position;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	

}
