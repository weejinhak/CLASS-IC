package com.class_ic.vo;

public class LectureBoardDTO {
 
	
	
	public LectureBoardDTO() {}
	
 

	private int lectureNo;
	private String classCode;
	private String cateCode;
	private String subcateCode;
	private String lectureTitle;
	private String lectureContent;
	private String lectureDate;
	//은영 0627 추가 
	
	private int linkNo ; 
	private String linkSrc; 
	private String linkTitle ;
	
	private int fileNo; 
	private int lectureFileNo;
	private String fileSrc ; 
	private String fileTitle ;
	
	 
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
	
	
	

	
	public int getLinkNo() {
		return linkNo;
	}
	public void setLinkNo(int linkNo) {
		this.linkNo = linkNo;
	}
	public String getLinkSrc() {
		return linkSrc;
	}
	public void setLinkSrc(String linkSrc) {
		this.linkSrc = linkSrc;
	}
	public String getLinkTitle() {
		return linkTitle;
	}
	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getLectureFileNo() {
		return lectureFileNo;
	}
	public void setLectureFileNo(int lectureFileNo) {
		this.lectureFileNo = lectureFileNo;
	}
	public String getFileSrc() {
		return fileSrc;
	}
	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}
	public String getFileTitle() {
		return fileTitle;
	}
	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}
	@Override
	public String toString() {
		return "LectureBoardDTO [lectureNo=" + lectureNo + ", classCode=" + classCode + ", cateCode=" + cateCode
				+ ", subcateCode=" + subcateCode + ", lectureTitle=" + lectureTitle + ", lectureContent="
				+ lectureContent + ", lectureDate=" + lectureDate + ", linkNo=" + linkNo + ", linkSrc=" + linkSrc
				+ ", linkTitle=" + linkTitle + ", fileNo=" + fileNo + ", lectureFileNo=" + lectureFileNo + ", fileSrc="
				+ fileSrc + ", fileTitle=" + fileTitle + ", toString()=" + super.toString() + "]";
	}



	
	 
	
	
}

