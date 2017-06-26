package com.class_ic.vo;

public class ClassByLectureDTO {

	private boolean select;
	private int llectureNo;
	private String classCode;
	public boolean isSelect() {
		return select;
	}
	public void setSelect(boolean select) {
		this.select = select;
	}
	public int getLlectureNo() {
		return llectureNo;
	}
	public void setLlectureNo(int llectureNo) {
		this.llectureNo = llectureNo;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	@Override
	public String toString() {
		return "ClassByLectureDTO [select=" + select + ", llectureNo=" + llectureNo + ", classCode=" + classCode + "]";
	}
	
	
	
	
}
