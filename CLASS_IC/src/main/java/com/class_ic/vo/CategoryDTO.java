package com.class_ic.vo;

public class CategoryDTO {
	
	
	private String cateCode;
	private String cateTitle;
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateTitle() {
		return cateTitle;
	}
	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}
	@Override
	public String toString() {
		return "CategoryDTO [cateCode=" + cateCode + ", cateTitle=" + cateTitle + "]";
	}



}


