/*
* @FileName		:	StudentListController.java
*
* @Project		:	CLASS-IC
* @Date		:	2017.06.15
* @Author		:	최은혜
*/

package com.class_ic.controller_category;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.StudentListService;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.StudentGroupDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
* @Class: StudentListController
* @Date: 2017.07. 29
* @Author: 최은혜
* @Desc: 학적부 페이지 로딩시 학생 리스트 출력, 조 편성 , 조 출력
*/


@Controller
@RequestMapping("teacher")
public class StudentListController {
	
	@Autowired
	private StudentListService studentListService;
	
	//학생리스트 출력
	@RequestMapping(value="selectStudent.htm", method=RequestMethod.POST)
	public String studentList(String classCode,HttpServletResponse response, Model model) throws IOException {
		
		List<AttandanceDTO> studentList = studentListService.selectStudent(classCode);
		
		model.addAttribute("studentList", studentList);
		
		return "teacher/attendance_check";
		
	}
	
	//조 등록
	@RequestMapping(value="selectAllInsert.htm", method=RequestMethod.POST)
	public String insertTeam(HttpServletRequest request) throws IOException {
		
		String cateCode = request.getParameter("cateCode");
		
		String partyName = request.getParameter("partyName");
		
		String classCode = request.getParameter("classCode");
		
		String[] nameArr = request.getParameter("emailsArray").split(",");		
		
		for(int  i=0; i< nameArr.length/3; i++){
		studentListService.insertTeamStudent(cateCode,partyName,classCode,nameArr[i]);
		}
		
		return "redirect:makeGroup.htm";
		
	}
	
	//등록된 조 출력
	@RequestMapping(value="selectStudentTeam.htm", method=RequestMethod.POST)
	public void studentTeamList(String classCode,String cateCode,String partyName,HttpServletResponse response) throws IOException {
		
		List<StudentGroupDTO> studentList = studentListService.selectStudentList(classCode, cateCode, partyName);
		
		JSONArray array = new JSONArray();
		
		for(int i=0;i<studentList.size();i++){
			JSONObject obj = new JSONObject();
			obj.put("name", studentList.get(i).getName());
			array.add(obj);
			
		}
		
		response.getWriter().println(array);
		
	}
	
	//조편성 - 기수별 학생 출력
	@RequestMapping(value="selectAllStudent.htm", method=RequestMethod.POST)
	public String SelectStudent(String classCode,HttpServletResponse response, Model model) throws IOException {
		
		List<AttandanceDTO> students = studentListService.selectAllStudent(classCode);
		
		model.addAttribute("students", students);
		
		return "teacher/student_selectList";
		
	}
	
	

}
