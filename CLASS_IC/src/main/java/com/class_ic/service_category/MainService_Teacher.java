package com.class_ic.service_category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.TeacherMainDAO;
import com.class_ic.vo.ClassDTO;

@Service
public class MainService_Teacher {

	@Autowired
	private SqlSession sqlsession;
	
	public List<ClassDTO> selectMain(String email){
		TeacherMainDAO dao = sqlsession.getMapper(TeacherMainDAO.class);
		List<ClassDTO> MainList = dao.teacherMain(email);
		
		
		return MainList;
	}
}
