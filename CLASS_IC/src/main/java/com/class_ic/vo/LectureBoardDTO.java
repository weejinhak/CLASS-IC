package com.class_ic.vo;

import java.sql.Date;

public class LectureBoardDTO {
 
	private int lectureNo;
	private String classCode;
	private String cateCode;
	private String subcateCode;
	private String lectureTitle;
	private String lectureContent;
	private String lectureDate;
	public int getLectureNo() {
		return lectureNo;
	}
	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getSubcateCode() {
		return subcateCode;
	}
	public void setSubcateCode(String subcateCode) {
		this.subcateCode = subcateCode;
	}
	public String getLectureTitle() {
		return lectureTitle;
	}
	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}
	public String getLectureContent() {
		return lectureContent;
	}
	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}
	public String getLectureDate() {
		return lectureDate;
	}
	public void setLectureDate(String lectureDate) {
		this.lectureDate = lectureDate;
	}
	
	
	@Override
	public String toString() {
		return "LectureBoardDTO [lectureNo=" + lectureNo + ", classCode=" + classCode + ", cateCode=" + cateCode
				+ ", subcateCode=" + subcateCode + ", lectureTitle=" + lectureTitle + ", lectureContent="
				+ lectureContent + ", lectureDate=" + lectureDate + "]";
	}
	

	
	
}
