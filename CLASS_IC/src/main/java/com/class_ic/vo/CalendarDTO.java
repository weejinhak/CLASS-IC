package com.class_ic.vo;

import java.sql.Date;

public class CalendarDTO {
	private int calNo;
	private int classCode;
	private Date calStart;
	private Date calEnd;
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

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public Date getCalStart() {
		return calStart;
	}

	public void setCalStart(Date calStart) {
		this.calStart = calStart;
	}

	public Date getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(Date calEnd) {
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
