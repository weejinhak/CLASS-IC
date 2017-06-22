package com.class_ic.vo;

import java.sql.Date;

public class All_Alarm_DTO {
	private String emailS;
	private String emailR;

	private String msContent;
	private Date msSendTime;
	private int messageNo;
	private String readState;
	private String deleteStateR;
	private String deleteStateS;

	
	public String getEmailS() {
		return emailS;
	}
	public void setEmailS(String emailS) {
		this.emailS = emailS;
	}
	public String getEmailR() {
		return emailR;
	}
	public void setEmailR(String emailR) {
		this.emailR = emailR;
	}
	public String getMsContent() {
		return msContent;
	}
	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	public Date getMsSendTime() {
		return msSendTime;
	}
	public void setMsSendTime(Date msSendTime) {
		this.msSendTime = msSendTime;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getReadState() {
		return readState;
	}
	public void setReadState(String readState) {
		this.readState = readState;
	}
	public String getDeleteStateR() {
		return deleteStateR;
	}
	public void setDeleteStateR(String deleteStateR) {
		this.deleteStateR = deleteStateR;
	}
	public String getDeleteStateS() {
		return deleteStateS;
	}
	public void setDeleteStateS(String deleteStateS) {
		this.deleteStateS = deleteStateS;
	}
	

}
