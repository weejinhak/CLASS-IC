/*
* @FileName		:   AttendanceController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	위진학
*/
package com.class_ic.controller_category;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.AttendanceListService;
import com.class_ic.vo.AttandanceDTO;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
* @Class: AttendanceController
* @Date: 2017.06. 25.
* @Author: 위진학
* @Desc: 
*/
@Controller
public class AttendanceController {

	@Autowired
	private AttendanceListService attendanceListService;

	// 학생용 출석리스트
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
}
