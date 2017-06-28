package com.class_ic.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class LectureBoardDTO {
 

	private int lectureNo;
	private String classCode;
	private String cateCode;
	private String subcateCode;
	private String lectureTitle;
	private String lectureContent;
	private String lectureDate;
	//파일 업로드 이하
	private String lectureFileNo;
	private String fileNo;
	private String	fileSrc;
	//파일 업로드 추가
	private String fileSrc2;//파일명

   //다중 파일 업로드
   private List<CommonsMultipartFile> files;

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

public String getLectureFileNo() {
	return lectureFileNo;
}

public void setLectureFileNo(String lectureFileNo) {
	this.lectureFileNo = lectureFileNo;
}

public String getFileNo() {
	return fileNo;
}

public void setFileNo(String fileNo) {
	this.fileNo = fileNo;
}

public String getFileSrc() {
	return fileSrc;
}

public void setFileSrc(String fileSrc) {
	this.fileSrc = fileSrc;
}

public String getFileSrc2() {
	return fileSrc2;
}

public void setFileSrc2(String fileSrc2) {
	this.fileSrc2 = fileSrc2;
}

public List<CommonsMultipartFile> getFiles() {
	return files;
}

public void setFiles(List<CommonsMultipartFile> files) {
	this.files = files;
}

   
   

}