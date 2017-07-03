

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

import com.class_ic.service.HomeworkService_student;
import com.class_ic.vo.HomeworkDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("student")
public class HomeworkController_Student {
	
	@Autowired
	private HomeworkService_student student;

	//과제 게시판 메인 카테고리 출력 : 2017.06.27 최은혜
	@RequestMapping(value="selectMainCate.htm", method=RequestMethod.POST)
	public void MovePage(String classCode, HttpServletResponse response) throws IOException {
		
		System.out.println("Homework controller_student email: "+ classCode);
		
		List<HomeworkDTO> cateList = student.studentMainCate(classCode);
		
		JSONArray array = new JSONArray();
		for(int i=0;i<cateList.size();i++){
			JSONObject obj = new JSONObject();
			obj.put("cateCode", cateList.get(i).getCateCode());
			array.add(obj);
		}
		
		response.getWriter().println(array);
		
	}
	
	
	//카테고리 선택시 조 출력 : 2017.06.29  최은혜
		@RequestMapping(value="selectStudentTeam.htm", method=RequestMethod.POST)
		public void MovePage(String classCode, String cateCode,HttpServletResponse response) throws IOException {
			
			System.out.println("selectStudentTeam.htm controller 들어옴");
			

			List<HomeworkDTO> teamList = student.studentTeamService(classCode, cateCode);
			
			JSONArray array = new JSONArray();
			for(int i=0;i<teamList.size();i++){
				JSONObject obj = new JSONObject();
				obj.put("partyName", teamList.get(i).getPartyName());
				array.add(obj);
				
			}
			
			response.getWriter().println(array);
			
		}
		
		//과제 등록 페이지 이동 : 2017.06.29  최은혜
		@RequestMapping("homeworkPage.htm")
		public String homeworkNotice(HttpServletRequest request){
		
			return "student.homework_content";
		
		}
		
		//과제 등록 : 학생  2017.06.28 최은혜
		@RequestMapping(value="addHomework.htm", method = RequestMethod.POST)
		public String addNotice(String email,String classCode,String cateCode,String assignNotice,String assignTitle,String assignContent, String partyName) {
			
			System.out.println("addHomework controller 들어옴");
			
			System.out.println(email +"/"+classCode+"/"+cateCode+"/"+assignNotice+"/"+assignTitle+"/"+assignContent+"/"+partyName);
			
			student.addHomeworkService(email,classCode,cateCode,assignNotice,assignTitle,assignContent,partyName);
			
			return "redirect:homework.htm";
		}
		
		//조 출력
		
		
		//과제 게시판 전체 출력 : 2017.06.30 최은혜
		@RequestMapping(value="selectAllListStudent.htm", method=RequestMethod.POST)
		public String selectAllList(String classCode, String email ,HttpServletResponse response,Model model) throws IOException {
			
			HomeworkDTO dto = new HomeworkDTO();
			dto.setClassCode(classCode);
			dto.setEmail(email);
			
			System.out.println("Homework controller_Student classCode: "+ classCode);
			
			List<HomeworkDTO> AllList = student.selectAllStudent(dto);
			
			model.addAttribute("homeworkselectlist", AllList);
			
			return "student/homework_partyNameList";
			
		}
		
		//팀별 게시물 출력 : 2017.06.30 위진학
	      @RequestMapping(value="homeworkSelectList.htm", method=RequestMethod.POST)
	      public String homeworkSelectList(HttpSession session, HttpServletRequest request,Model model) throws IOException {
	         
	         System.out.println(request.getParameter("partyName"));//select태그에서 선택된 서브카테고리
	         System.out.println(session.getAttribute("classCode"));//세션으로 가지고 다니는 classCode
	         
	         List<HomeworkDTO> AllList = student.homeworkSelectListStudent(session,request,model);
	         
	         model.addAttribute("homeworkselectlist", AllList);
	         
	         return "student/homework_partyNameList";
	         
	      }
	      
	    //상세보기 페이지로 이동 : 2017.07.02 박소현
	      @RequestMapping(value="homeworkContent.htm", method=RequestMethod.GET)
	      public ModelAndView homeworkContent(HttpServletRequest request, HttpServletResponse response,HomeworkDTO dto){
	         System.out.println("*************상세보기 컨트롤********************88");
	         ModelAndView viewpage =student.homeworkContent(request, response, dto);
	               
	         return viewpage;
	      }
	      
	     //과제게시판 수정화면 출력 : 2017.07.01 박소현
	      @RequestMapping(value="homeworkEdit.htm",  method=RequestMethod.GET)
	      public String homeworkEdit(HttpServletRequest request, HttpServletResponse response,HomeworkDTO dto){
	            HomeworkDTO dto = student.homeworkEdit(request, response, dto);
	            
	         
	         return "student.homework_edit";
	      }
	      
	      //과제게시판 수정한 데이터 DB저장 : 2017.07.01 박소현
	      @RequestMapping(value="homeworkEdit.htm",  method=RequestMethod.POST)
	      public String homeworkEditOk(HomeworkDTO dto){
	    	  student.homeworkEditOk(dto);
	      
	         return "redirect:homework.htm";
	      }
	      
	      //과제게시판 삭제 : 2017.07.01 박소현 
	      @RequestMapping(value="homeworkDelete.htm")
	      public String homeworkDelete(HttpServletRequest request, HttpServletResponse response){
	        
	    	  student.homeworkDelete(request, response);
	         
	          return "redirect:homework.htm";
	      }
	
}











