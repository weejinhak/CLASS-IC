package com.class_ic.controller_category;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.StudentListService;
import com.class_ic.vo.MemberDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("teacher")
public class StudentListController {
	
	@Autowired
	private StudentListService studentListService;
	
	@RequestMapping(value="selectStudent.htm", method=RequestMethod.POST)
	public void studentList(String classCode,HttpServletResponse response) throws IOException {
		
		System.out.println("StudentListController classCode: " + classCode);
		
		List<MemberDTO> studentList = studentListService.selectStudent(classCode);
		
		JSONArray array = new JSONArray();
		
		for(int i=0;i<studentList.size();i++){
			JSONObject obj = new JSONObject();
			obj.put("photoSrc", studentList.get(i).getPhotoSrc());
			obj.put("email", studentList.get(i).getEmail());
			obj.put("name", studentList.get(i).getName());
			obj.put("phone", studentList.get(i).getPhone());
			array.add(obj);
			
			System.out.println("studentList: "+studentList.toString());
		}
		
		response.getWriter().println(array);
		
		
	}

}
