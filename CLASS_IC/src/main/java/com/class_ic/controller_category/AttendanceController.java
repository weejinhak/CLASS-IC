package com.class_ic.controller_category;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.vo.MemberDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.class_ic.dao.MemberDAO;

@Controller
@RequestMapping("teacher")
public class AttendanceController {
	
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value="selectStudent.htm", method=RequestMethod.POST)
	public void selectStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String classCode = request.getParameter("classCode");
		System.out.println("classCode : "+ classCode);
		
		MemberDTO dto = new MemberDTO();
		dto.setClassCode(classCode);
		
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		List<MemberDTO> studentList = dao.selectStudent(dto);
		
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
