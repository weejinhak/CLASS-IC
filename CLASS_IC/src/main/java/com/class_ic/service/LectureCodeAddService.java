package com.class_ic.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.LectureAddDAO;
import com.class_ic.vo.LectureDTO;
@Service
public class LectureCodeAddService {

	
	@Autowired
	private SqlSession sqlsession;

	// 회원가입
	public String addclasscode(LectureDTO lecture) throws Exception {
		System.out.println("기수추가 서비스 in!");
		lecture.setClasscode(lecture.getClasscode());

		lecture.setClasstitle(lecture.getClasstitle());
		lecture.setClassstart(lecture.getClassstart());
		lecture.setClassend(lecture.getClassend());

		lecture.setClassopentime(lecture.getClassopentime());
		lecture.setClassclosetime(lecture.getClassclosetime());

		lecture.setClassinvitecode(lecture.getClassinvitecode());
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);

		String viewpage = "";

		try {
			int result = lectureDao.insert(lecture);
			if (result > 0) {
				System.out.println("가입 성공");
				System.out.println("가입이 성공했으니 theselect.htm으로 보내야되지만");
				System.out.println("비동기처리를 위해 값을 select 해와서 새로운 htm 에 뿌린다.");
				viewpage = "redirect:/index.htm";
			} else {
				System.out.println("권한부여 실패");
				viewpage = "joinus.join";
			}
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "joinus.join";
			System.out.println("가입실패");
			throw e;
		}
		return viewpage;
	}

}
