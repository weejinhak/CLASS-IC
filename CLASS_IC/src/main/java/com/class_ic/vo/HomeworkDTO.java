package com.class_ic.vo;

public class HomeworkDTO {

	private String cateCode; //메인카테고리 코드
	private String cateTitle; //카테고리 명
	private String teamName; //조 명
	private String assignTitle; //글 제목
	private String assignContent; //글 내용
	private String assignDate; //글 등록일
	private String assignNotice; //공지사항 여부
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateTitle() {
		return cateTitle;
	}
	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getAssignTitle() {
		return assignTitle;
	}
	public void setAssignTitle(String assignTitle) {
		this.assignTitle = assignTitle;
	}
	public String getAssignContent() {
		return assignContent;
	}
	public void setAssignContent(String assignContent) {
		this.assignContent = assignContent;
	}
	public String getAssignDate() {
		return assignDate;
	}
	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}
	public String getAssignNotice() {
		return assignNotice;
	}
	public void setAssignNotice(String assignNotice) {
		this.assignNotice = assignNotice;
	}
	
	
}