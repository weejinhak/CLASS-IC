/*
* @FileName	:	JoinService.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.MemberDAO;
import com.class_ic.vo.MemberDTO;

@Service
public class JoinService {
	
	@Autowired
	private SqlSession sqlsession;


	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/*public ModelAndView loginService(@RequestParam("password") String rawPassword,
			Principal principal, ModelAndView mv){*/

	public ModelAndView loginService(MemberDTO member, ModelAndView mv) {
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO confirmedMember = member_dao.login(member);
		return null;
	}

}
