package com.class_ic.app.dto;

public class memberdto {
	private int m_id;
	private String m_pw, m_email, m_nick, m_name, m_qr;

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_qr() {
		return m_qr;
	}

	public void setM_qr(String m_qr) {
		this.m_qr = m_qr;
	}

	@Override
	public String toString() {
		return "memberdto [m_id=" + m_id + ", m_pw=" + m_pw + ", m_email=" + m_email + ", m_nick=" + m_nick
				+ ", m_name=" + m_name + ", m_qr=" + m_qr + "]";
	}

}
