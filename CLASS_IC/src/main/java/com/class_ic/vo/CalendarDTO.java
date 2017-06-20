package com.class_ic.vo;



public class CalendarDTO {
	private int calNo;
	private String classCode;
	private String calStart;
	private String calEnd;
	private String calTitle;
	private String calContent;
	
	public CalendarDTO() {
		
		
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getCalStart() {
		return calStart;
	}

	public void setCalStart(String calStart) {
		this.calStart = calStart;
	}

	public String getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(String calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	@Override
	public String toString() {
		return "CalendarDto [calNo=" + calNo + ", classCode=" + classCode + ", calStart=" + calStart + ", calEnd="
				+ calEnd + ", calTitle=" + calTitle + ", calContent=" + calContent + "]";
	}

	
	
}
