package com.class_ic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

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
		public void addTeamService(String email, String classCode, String cateCode, String partyName) {
			
			HomeworkDTO dto = new HomeworkDTO();
		    dto.setEmail(email);
		    dto.setClassCode(classCode);
		    dto.setCateCode(cateCode);
		    dto.setPartyName(partyName);
			
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			int result = dao.addTeamDao(dto);
			
			System.out.println("team insert result : "+result);
			
		}
		
		//카테고리 선택시 조 출력
		public List<String> selectTeamService(String email, String classCode, String cateCode) {
			
			System.out.println("selectTeamService 들어옴");
			
			HomeworkDTO dto = new HomeworkDTO();
		    dto.setEmail(email);
		    dto.setClassCode(classCode);
		    dto.setCateCode(cateCode);
		  
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			List<String> teamList = dao.selectTeamDao(dto);
			
			return teamList;
		}
	
	
		//공지사항 등록
		public void addNoticeService(String email,String classCode,String cateCode,String assignNotice,String assignTitle,String assignContent) {
			
			HomeworkDTO dto = new HomeworkDTO();
			dto.setEmail(email);
			dto.setClassCode(classCode);
			dto.setCateCode(cateCode);
			dto.setAssignNotice(assignNotice);
			dto.setAssignTitle(assignTitle);
			dto.setAssignContent(assignContent);
			
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			int result = dao.addNoticeDao(dto);
			
			System.out.println("notice insert result : "+result);
					
		}
		
		//과제게시판 전체  출력
		public List<HomeworkDTO> selectAllList(HomeworkDTO dto) {
			
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			List<HomeworkDTO> AllList = dao.selectAll(dto);
			
			return AllList;
		}
		
	      //과제게시판 전체  출력 (추가.진학)
	      public List<HomeworkDTO> homeworkSelectList(HttpSession session, HttpServletRequest request,Model model) {
	         
	         String partyName=request.getParameter("partyName");
	         String email=(String)session.getAttribute("email");
	         String classCode=(String)session.getAttribute("classCode");
	         
	         HomeworkDTO dto= new HomeworkDTO();
	         dto.setPartyName(partyName);
	         dto.setEmail(email);
	         dto.setClassCode(classCode);
	         
	         HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
	         List<HomeworkDTO> selectAllList = dao.selectAllByTeacher(dto);
	         
	         return selectAllList;
	      }
	      
		//과제게시판 상세보기 
		public ModelAndView homeworkContent(int assignNo){
			System.out.println("상세보기 서비스탄다.");
			HomeworkDAO dao = sqlsession.getMapper(HomeworkDAO.class);
			List<HomeworkDTO> ContentList = dao.selectContent(assignNo);
			
			ModelAndView m = new ModelAndView();
			m.setViewName("teacher.homework_content");
			m.addObject("list", ContentList);
			
			return m;
		}
}
