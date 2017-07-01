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

import com.class_ic.dao.LectureAddDAO;
import com.class_ic.dao.MemberDAO;
import com.class_ic.vo.LectureDTO;
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
		String email = member.getEmail();
		String classCode= email;
		MemberDAO member_dao = sqlsession.getMapper(MemberDAO.class);
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);
		LectureDTO lecture = new LectureDTO();
		lecture.setClassCode(email);
		lecture.setEmail(email);
		String viewpage="";
		
		
		try{
			int result = member_dao.join(member);
			if(result>0){
				//권한처리
				member_dao.insertAuthority(member);
				System.out.println("가입 성공");	
				//class에 email 값으로 classCode 입력
				 lectureDao.insertDefault(lecture);
				 System.out.println("class에 email 넣기");
				//classmember에 classCode와 email 입력 
				lectureDao.inputMyClassCode(email, classCode);
				System.out.println("classmember email 입력");
				viewpage="redirect:join/login";
								}else{
									System.out.println("권한부여 실패");
									viewpage="redirect:join/join";
								}			
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("가입실패");
					throw e;				
				}			
		return  viewpage;
	}
	

}
