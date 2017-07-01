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
@RequestMapping("student")
public class HomeworkController_Student {
	
	@Autowired
	private HomeworkService homeworkService;

	//과제 게시판 메인 카테고리 출력 : 2017.06.27 최은혜
	@RequestMapping(value="selectCate.htm", method=RequestMethod.POST)
	public void MovePage(String email, HttpServletResponse response) throws IOException {
		
		System.out.println("Homework controller_Student email: "+ email);
		
		List<HomeworkDTO> cateList = homeworkService.selectCate(email);
		
		JSONArray array = new JSONArray();
		for(int i=0;i<cateList.size();i++){
			JSONObject obj = new JSONObject();
			obj.put("cateCode", cateList.get(i).getCateCode());
			obj.put("cateTitle", cateList.get(i).getCateTitle());
			array.add(obj);
		}
		
		response.getWriter().println(array);
		
	}
	
	
	//카테고리 선택시 조 출력 : 2017.06.29  최은혜
		@RequestMapping(value="selectTeam.htm", method=RequestMethod.POST)
		public void MovePage(String email, String classCode, String cateCode,HttpServletResponse response) throws IOException {
			
			System.out.println("selectTeam.html controller 들어옴");
			

			List<String> teamList = homeworkService.selectTeamService(email, classCode, cateCode);
			
			JSONArray array = new JSONArray();
			for(int i=0;i<teamList.size();i++){
				
				JSONObject obj = new JSONObject();
				obj.put("partyName", teamList.get(i));
				array.add(obj);
				
			}
			
			response.getWriter().println(array);
			
		}
		
		//과제 등록 페이지 이동 : 2017.06.29  최은혜
		@RequestMapping("homeworkPage.htm")
		public String homeworkNotice(HttpServletRequest request){
		
			return "student.homework_content";
		
		}
		
		//과제 등록 : 강사  2017.06.28 최은혜
		@RequestMapping(value="addHomework.htm", method = RequestMethod.POST)
		public String addNotice(String email,String classCode,String cateCode,String assignNotice,String assignTitle,String assignContent) {
			
			System.out.println("addHomework controller 들어옴");
			
			System.out.println(email +"/"+classCode+"/"+cateCode+"/"+assignNotice+"/"+assignTitle+"/"+assignContent);
			
			homeworkService.addNoticeService(email,classCode,cateCode,assignNotice,assignTitle,assignContent);
			
			return "redirect:homework.htm";
		}
		
		
		//과제 게시판 전체 출력 : 2017.06.30 최은혜
		@RequestMapping(value="selectAllList.htm", method=RequestMethod.POST)
		public void selectAllList(String classCode, String email ,HttpServletResponse response) throws IOException {
			
			HomeworkDTO dto = new HomeworkDTO();
			dto.setClassCode(classCode);
			dto.setEmail(email);
			
			System.out.println("Homework controller_Teacher classCode: "+ classCode);
			
			List<HomeworkDTO> AllList = homeworkService.selectAllList(dto);
			
			JSONArray array = new JSONArray();
			for(int i=0;i<AllList.size();i++){
				JSONObject obj = new JSONObject();
				obj.put("assignNo", AllList.get(i).getAssignNo());
				obj.put("cateCode", AllList.get(i).getCateCode());
				obj.put("assignTitle", AllList.get(i).getAssignTitle());
				obj.put("assignContent", AllList.get(i).getAssignContent());
				obj.put("name", AllList.get(i).getName());
				obj.put("assignDate", AllList.get(i).getAssignDate());
				array.add(obj);
			}
			
			response.getWriter().println(array);
			
		}
}










