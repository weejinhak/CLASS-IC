/*
* @FileName	:	MemberDAO.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/

package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.MemberDTO;

public interface MemberDAO {
	
	public int join(MemberDTO member);
	
	public int modify(MemberDTO member);
	
	public int delete(MemberDTO member);
	
	public MemberDTO selectOne(MemberDTO member);
	
	public List<MemberDTO> selectAll(MemberDTO member);
	
	public MemberDTO login(String email);	
	
	public int insertAuthority(MemberDTO member);
	
	public String confirmAuthority(String email);

	

}
