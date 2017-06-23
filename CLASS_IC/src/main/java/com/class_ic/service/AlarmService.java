/*
* @FileName		:	LectureCodeAddService.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.16
* @Author		:	위진학
*/
package com.class_ic.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.LectureAddDAO;
import com.class_ic.vo.LectureDTO;

/*
* @Class: AlarmService
* @Date: 2017.06. 16.
* @Author: 위진학
* @Desc: Controller에서 받은 parameter를 실질적으로 Mapper에 넘겨주는 service
*/
@Service
public class AlarmService {

	
	@Autowired
	private SqlSession sqlsession;

	/*
	@description : 기수추가 insert하는 service
	*/
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
				System.out.println("insert 성공");
				System.out.println("성공했으니 theselect.htm으로 보내야되지만");
				System.out.println("비동기처리를 위해 값을 select 해와서 새로운 htm 에 뿌린다.");
				viewpage = "redirect:/common/select.htm";
			} else {
				System.out.println("insert 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "joinus.join";
			System.out.println("가입실패");
			throw e;
		}
		return viewpage;
	}
	
	
	/*
	@description : email 맞는 기수 Select 하는 service
	*/
	public List<LectureDTO> lecturelistselect(String email) throws Exception {
			
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);
		List<LectureDTO> lecturelist= lectureDao.getlecture(email);
		
		return lecturelist;
		
	}

		
		
}
