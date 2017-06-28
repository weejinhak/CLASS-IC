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
* @Class: LectureCodeAddService
* @Date: 2017.06. 16.
* @Author: 위진학
* @Desc: Controller에서 받은 parameter를 실질적으로 Mapper에 넘겨주는 service
*/
@Service
public class LectureCodeAddService {

	
	@Autowired
	private SqlSession sqlsession;

	/*
	@description : 기수추가 insert하는 service
	*/
	public String addclasscode(LectureDTO lecture) throws Exception {
		System.out.println("기수추가 서비스 in!");
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);

		
		//am/pm시 바꾸기
		String opentime=lecture.getClassOpenTime().substring(0, 4);	
		String closetime=lecture.getClassCloseTime().substring(0, 4);
		lecture.setClassOpenTime(opentime+":00");
		System.out.println(opentime+":00");
		lecture.setClassCloseTime(closetime+":00");
		System.out.println(closetime+":00");
	

		String viewpage = "";

		try {
			int result = lectureDao.insert(lecture);
			if (result > 0) {
				System.out.println("insert 성공");
				viewpage = "redirect:common/lecturecodeSelect.htm";
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
	public List<LectureDTO> lecturelistselectStudent(String email) throws Exception {
		
		LectureAddDAO lectureDao = sqlsession.getMapper(LectureAddDAO.class);
		List<LectureDTO> lecturelistStudent= lectureDao.getlectureStudent(email);
		
		return lecturelistStudent;
		
	}

		
		
}
