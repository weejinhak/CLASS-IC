package com.class_ic.vo;

public class StudentGroupDTO {
	private String email;
	private String name;
	private String photoSrc;
	private String position;
	private String groupLeaderState;
	private String groupCode;
	private String groupName;
	private String classCode;
	private String groupTable;
	
	
	
	public StudentGroupDTO() {}
	public StudentGroupDTO(String email, String name, String photoSrc, String position, String groupLeaderState,
			String groupCode, String groupName, String classCode, String groupTable) {
		this.email = email;
		this.name = name;
		this.photoSrc = photoSrc;
		this.position = position;
		this.groupLeaderState = groupLeaderState;
		this.groupCode = groupCode;
		this.groupName = groupName;
		this.classCode = classCode;
		this.groupTable = groupTable;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhotoSrc() {
		return photoSrc;
	}
	public void setPhotoSrc(String photoSrc) {
		this.photoSrc = photoSrc;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
	public String getGroupTable() {
		return groupTable;
	}
	public void setGroupTable(String groupTable) {
		this.groupTable = groupTable;
	}
	
	
	

}
