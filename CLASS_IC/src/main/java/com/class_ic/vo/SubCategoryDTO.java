package com.class_ic.vo;

public class SubCategoryDTO {

	String subcateCode;
	String cateCode;
	String subcateTitle;
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
	@Override
	public String toString() {
		return "SubCategoryDTO [subcateCode=" + subcateCode + ", cateCode=" + cateCode + ", subcateTitle="
				+ subcateTitle + "]";
	}
	


}
