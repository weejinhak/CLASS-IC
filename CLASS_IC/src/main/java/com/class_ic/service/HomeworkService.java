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
		public void addTeamService(String email, String classCode, String cateCode, String teamName) {
			
			HomeworkDTO dto = new HomeworkDTO();
		    dto.setEmail(email);
		    dto.setClassCode(classCode);
		    dto.setCateCode(cateCode);
		    dto.setTeamName(teamName);
			
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			int result = dao.addTeamDao(dto);
			
			System.out.println("team insert result : "+result);
			
		}
		
		//카테고리 선택시 조 출력
		public List<HomeworkDTO> selectTeamService(String email, String classCode, String cateCode) {

			HomeworkDTO dto = new HomeworkDTO();
		    dto.setEmail(email);
		    dto.setClassCode(classCode);
		    dto.setCateCode(cateCode);
		    
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			List<HomeworkDTO> TeamList = dao.selectTeamDao(dto);
			
			return TeamList;
		}
	
}
