package com.class_ic.vo;

public class StudentTableDTO {
	
	private String email;
	private String name;
	private String position;
	
	public StudentTableDTO() {}
	
	public StudentTableDTO(String email, String name, String position) {
		this.email = email;
		this.name = name;
		this.position = position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
