package com.class_ic.vo;

public class SubCategoryDTO {

	private String subcateCode;
	private String cateCode;
	private String subcateTitle;
	private String email;
	
	@Override
	public String toString() {
		return "SubCategoryDTO [subcateCode=" + subcateCode + ", cateCode=" + cateCode + ", subcateTitle="
				+ subcateTitle + ", email=" + email + "]";
	}
	public String getSubcateCode() {
		return subcateCode;
	}
	public void setSubcateCode(String subcateCode) {
		this.subcateCode = subcateCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getSubcateTitle() {
		return subcateTitle;
	}
	public void setSubcateTitle(String subcateTitle) {
		this.subcateTitle = subcateTitle;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}



}
