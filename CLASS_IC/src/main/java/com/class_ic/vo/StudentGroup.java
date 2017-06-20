package com.class_ic.vo;

public class StudentGroup {
	private String email;
	private String groupLeaderState;
	private String groupCode;
	private String groupName;
	private String classCode;
	
	public StudentGroup() {}
	public StudentGroup(String email, String groupLeaderState, String groupCode, String groupName, String classCode) {
		this.email = email;
		this.groupLeaderState = groupLeaderState;
		this.groupCode = groupCode;
		this.groupName = groupName;
		this.classCode = classCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGroupLeaderState() {
		return groupLeaderState;
	}
	public void setGroupLeaderState(String groupLeaderState) {
		this.groupLeaderState = groupLeaderState;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	
	
	

}
