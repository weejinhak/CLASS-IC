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

	//회원가입
	public String join(MemberDTO member) throws Exception{
		
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		String viewpage="";
		
		try{
			int result = member_dao.join(member);
			if(result>0){
				member_dao.insertAuthority(member);
				System.out.println("가입 성공");	
				viewpage="join/login";
								}else{
									System.out.println("권한부여 실패");
									viewpage="join/join";
								}			
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("가입실패");
					throw e;				
				}			
		return  viewpage;
	}
	

}
