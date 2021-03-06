package com.class_ic.vo;

public class MemberDTO {
	
	private String email;
	private String name;
	private String pwd;
	private String phone;
	private String photoSrc;
	private String authority;	//security 권한
	private String classCode; 	//기수
	public static final String STUDENT_AUTHORITY = "ROLE_STUDENT";
	
	public MemberDTO(){};
	
	public MemberDTO(String email, String name, String pwd, String phone, String photoSrc, String authority) {
		super();
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.photoSrc = photoSrc;
		this.authority = authority;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhotoSrc() {
		return photoSrc;
	}
	public void setPhotoSrc(String photoSrc) {
		this.photoSrc = photoSrc;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
	

}
