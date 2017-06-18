package com.class_ic.vo;

import java.sql.Date;

public class LectureDTO {
	
	String classcode; 
	String classtitle; 
	Date classstart; 
 	Date classend; 
	String classopentime;
	String classclosetime;
	String classinvitecode;
	String email;

	public String getClasscode() {
		return classcode;
	}

	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}

	public String getClasstitle() {
		return classtitle;
	}

	public void setClasstitle(String classtitle) {
		this.classtitle = classtitle;
	}

	public Date getClassstart() {
		return classstart;
	}

	public void setClassstart(Date classstart) {
		this.classstart = classstart;
	}

	public Date getClassend() {
		return classend;
	}

	public void setClassend(Date classend) {
		this.classend = classend;
	}

	public String getClassopentime() {
		return classopentime;
	}

	public void setClassopentime(String classopentime) {
		this.classopentime = classopentime;
	}

	public String getClassclosetime() {
		return classclosetime;
	}

	public void setClassclosetime(String classclosetime) {
		this.classclosetime = classclosetime;
	}

	public String getClassinvitecode() {
		return classinvitecode;
	}

	public void setClassinvitecode(String classinvitecode) {
		this.classinvitecode = classinvitecode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

}
