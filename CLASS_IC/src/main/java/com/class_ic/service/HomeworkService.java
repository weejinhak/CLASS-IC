package com.class_ic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class_ic.dao.HomeworkDAO;
import com.class_ic.vo.HomeworkDTO;

@Service
public class HomeworkService {

	@Autowired
	private SqlSession sqlsession;
	
	//메인 카테고리 출력
	public List<HomeworkDTO> selectCate(String email) {
		System.out.println("Homework Service_Teacher email : "+ email);
		
		HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
		List<HomeworkDTO> cateList = dao.selectCate(email);
		
		return cateList;
	}
	
	//카테고리별 조 등록
		public void addTeamService(HttpServletRequest request) {
			
			System.out.println("addTeam 메소드 들어옴");
			String cateCode = request.getParameter("cateCode");
			String teamName = request.getParameter("teamName");
			String email = request.getParameter("email");
			String classCode = request.getParameter("classCode");
			
		    HomeworkDTO dto = new HomeworkDTO();
		    dto.setCateCode(cateCode);
		    dto.setTeamName(teamName);
		    dto.setEmail(email);
		    dto.setClassCode(classCode);
			
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			int result = dao.addTeamDao(dto);
			
			System.out.println("cate result : "+result);
			
		}
	
}
