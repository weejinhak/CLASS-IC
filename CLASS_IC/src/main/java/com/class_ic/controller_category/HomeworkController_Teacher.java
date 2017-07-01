package com.class_ic.controller_category;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.HomeworkService;
import com.class_ic.service.StudentListService;
import com.class_ic.vo.HomeworkDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("teacher")
public class HomeworkController_Teacher {
	
	@Autowired
	private HomeworkService homeworkService;

	//과제 게시판 메인 카테고리 출력 : 2017.06.27 최은혜
	@RequestMapping(value="selectCate.htm", method=RequestMethod.POST)
	public void MovePage(String email, HttpServletResponse response) throws IOException {
		
		System.out.println("Homework controller_Teacher email: "+ email);
		
		List<HomeworkDTO> cateList = homeworkService.selectCate(email);
		
		JSONArray array = new JSONArray();
		for(int i=0;i<cateList.size();i++){
			JSONObject obj = new JSONObject();
			obj.put("cateCode", cateList.get(i).getCateCode());
			array.add(obj);
		}
		
		response.getWriter().println(array);
		
	}
	
	//과제 게시판 조 등록 : 2017.06.28 최은혜
	@RequestMapping(value="addHomework.htm", method = RequestMethod.POST)
	public String addCate(String email, String classCode, String cateCode, String partyName) {
		
		System.out.println("addTeam 메소드 들어옴");
		
		homeworkService.addTeamService(email,classCode,cateCode,partyName);
		
		return "redirect:homework.htm";
	}
	
	//카테고리 선택시 조 출력 : 2017.06.29  최은혜
		@RequestMapping(value="selectTeam.htm", method=RequestMethod.POST)
		public void MovePage(String email, String classCode, String cateCode,HttpServletResponse response) throws IOException {
			
			System.out.println("selectTeam.html controller 들어옴");
			

			List<HomeworkDTO> teamList = homeworkService.selectTeamService(email, classCode, cateCode);
			
			JSONArray array = new JSONArray();
			for(int i=0;i<teamList.size();i++){
				JSONObject obj = new JSONObject();
				obj.put("partyName", teamList.get(i).getPartyName());
				array.add(obj);
				
			}
			
			response.getWriter().println(array);
			
		}
		
		//과제 공지 페이지 이동 : 2017.06.29  최은혜
		@RequestMapping("homeworkNoticePage.htm")
		public String homeworkNotice(HttpServletRequest request){
		
			return "teacher.homework_content";
		
		}
		
		//공지사항 등록 : 강사  2017.06.28 최은혜
		@RequestMapping(value="addNotice.htm", method = RequestMethod.POST)
		public String addNotice(String email,String classCode,String cateCode,String assignNotice,String assignTitle,String assignContent) {
			
			System.out.println("addNotice controller 들어옴");
			
			System.out.println(email +"/"+classCode+"/"+cateCode+"/"+assignNotice+"/"+assignTitle+"/"+assignContent);
			
			homeworkService.addNoticeService(email,classCode,cateCode,assignNotice,assignTitle,assignContent);
			
			return "redirect:homework.htm";
		}
		
		
		//과제 게시판 전체 출력 : 2017.06.30 최은혜
		@RequestMapping(value="selectAllList.htm", method=RequestMethod.POST)
		public String selectAllList(String classCode, String email ,HttpServletResponse response,Model model) throws IOException {
			
			HomeworkDTO dto = new HomeworkDTO();
			dto.setClassCode(classCode);
			dto.setEmail(email);
			
			System.out.println("Homework controller_Teacher classCode: "+ classCode);
			
			List<HomeworkDTO> AllList = homeworkService.selectAllList(dto);
			
			model.addAttribute("homeworkselectlist", AllList);
			
			return "teacher/homework_partyNameList";
			
		}
		
		   //팀별 게시물 출력 : 2017.06.30 위진학
	      @RequestMapping(value="homeworkSelectList.htm", method=RequestMethod.POST)
	      public String homeworkSelectList(HttpSession session, HttpServletRequest request,Model model) throws IOException {
	         
	         System.out.println(request.getParameter("partyName"));//select태그에서 선택된 서브카테고리
	         System.out.println(session.getAttribute("email"));//세션으로 가지고 다니는 email
	         System.out.println(session.getAttribute("classCode"));//세션으로 가지고 다니는 classCode
	         
	         List<HomeworkDTO> AllList = homeworkService.homeworkSelectList(session,request,model);
	         
	         model.addAttribute("homeworkselectlist", AllList);
	         
	         return "teacher/homework_partyNameList";
	         
	      }
}











