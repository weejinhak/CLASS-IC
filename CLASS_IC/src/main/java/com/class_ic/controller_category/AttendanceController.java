/*
* @FileName		:   AttendanceController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	위진학
* @Desc         :   출석부에 학생(자신의 출석)//강사(기수에 맞는 모든학생출석)Select해오기 위한 Contoller.
*/
package com.class_ic.controller_category;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.AttendanceListService;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.AttandanceListDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
* @Class: AttendanceController
* @Date: 2017.06. 25.
* @Author: 위진학
* @Desc: 
*/

	
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
public class AttendanceController {	
	@Autowired
	private AttendanceListService attendanceListService;

	
	/*
	@description :  학생용 출석리스트
	*/
	@RequestMapping(value = "student/attendanceTable.htm", method = RequestMethod.POST)
	public void studentlistPage(Model model, String email, String classcode, HttpServletResponse response)
			throws Exception {
		System.out.println("attendanceTable컨트롤러");
		
		List<AttandanceDTO> memberattendacnelist = attendanceListService.attendanceSelect(email, classcode);

		JSONArray attendanceListArray= new JSONArray();
		
		
		System.out.println("********************************************");
		System.out.println(memberattendacnelist.size());
		DateFormat transDate= new SimpleDateFormat("yyyy-MM-dd");
		String attenddate=transDate.format(memberattendacnelist.get(0).getAttendDate());
		System.out.println(attenddate);
		System.out.println("********************************************");
		for(int i=0;i<memberattendacnelist.size();i++){
			JSONObject obj=new JSONObject();
			obj.put("attendDate",transDate.format(memberattendacnelist.get(i).getAttendDate()));
			obj.put("inClass",memberattendacnelist.get(i).getInClass() );
			obj.put("outClass",memberattendacnelist.get(i).getOutClass());
			obj.put("attendState",memberattendacnelist.get(i).getAttendState());
			obj.put("classCode",memberattendacnelist.get(i).getClassCode() );
			attendanceListArray.add(obj);
		}
		response.getWriter().print(attendanceListArray);
	}
	
	/*
	 * @description : 강사용 출석리스트
	 */
	@RequestMapping(value = "teacher/attendanceTable.htm", method = RequestMethod.POST)
	public void teacherlistPage(String email, String classcode, HttpServletResponse response) throws Exception {
		System.out.println("강사용attendanceTable컨트롤러");

		List<AttandanceListDTO> memberattendacnelist = attendanceListService.attendanceSelectByTeacher(email, classcode);
		JSONArray attendanceListArray = new JSONArray();
		DateFormat transDate = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < memberattendacnelist.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("name", memberattendacnelist.get(i).getName());
			obj.put("attendDate", transDate.format(memberattendacnelist.get(i).getAttendDate()));
			obj.put("inClass", memberattendacnelist.get(i).getInClass());
			obj.put("outClass", memberattendacnelist.get(i).getOutClass());
			obj.put("attendState", memberattendacnelist.get(i).getAttendState());
			obj.put("classCode", memberattendacnelist.get(i).getClassCode());
			attendanceListArray.add(obj);
		}
		response.getWriter().print(attendanceListArray);
	}
}
