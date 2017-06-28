/*
* @FileName		:   AttendanceController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	위진학
* @Desc         :   출석부에 학생(자신의 출석)//강사(기수에 맞는 모든학생출석)Select해오기 위한 Contoller.
*/
package com.class_ic.controller_category;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.AttandanceListDTO;
import com.class_ic.vo.MemberDTO;
import com.mysql.fabric.Response;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.class_ic.dao.MemberDAO;
import com.class_ic.service.AttendanceListService;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceListService attendanceListService;

	/*
	 * @description : 학생용 출석리스트
	 */
	@RequestMapping(value = "student/attendanceTable.htm", method = RequestMethod.POST)
	public void studentlistPage(Model model, String email, String classcode, HttpServletResponse response)
			throws Exception {
		System.out.println("attendanceTable컨트롤러");

		List<AttandanceDTO> memberattendacnelist = attendanceListService.attendanceSelect(email, classcode);

		JSONArray attendanceListArray = new JSONArray();

		System.out.println("********************************************");
		System.out.println(memberattendacnelist.size());
		DateFormat transDate = new SimpleDateFormat("yyyy-MM-dd");
		String attenddate = transDate.format(memberattendacnelist.get(0).getAttendDate());
		System.out.println(attenddate);
		System.out.println("********************************************");
		for (int i = 0; i < memberattendacnelist.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("attendDate", transDate.format(memberattendacnelist.get(i).getAttendDate()));
			obj.put("inClass", memberattendacnelist.get(i).getInClass());
			obj.put("outClass", memberattendacnelist.get(i).getOutClass());
			obj.put("attendState", memberattendacnelist.get(i).getAttendState());
			obj.put("classCode", memberattendacnelist.get(i).getClassCode());
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

		List<AttandanceListDTO> memberattendacnelist = attendanceListService.attendanceSelectByTeacher(email,
				classcode);
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

	/*
	 * @description : 차트용 출석률(학생)
	 */
	@RequestMapping(value = "student/attendchart.htm", method = RequestMethod.POST)
	public void chart(String email, String classcode, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println("학생용 차트 컨트롤러");

		String[] labels = {"","","",""};
		int[] series = { 0, 0, 0, 0 };

		classcode = "151";
		int attendancetotalcount = attendanceListService.attendanceTotalCount(email, classcode);
		int attendnomalcount = attendanceListService.attendanceNomalCount(email, classcode);
		int attendlatecount = attendanceListService.attendLateCount(email, classcode);
		int attendabsencecount = attendanceListService.attendAbsenceCount(email, classcode);
		int attendearlyleavecount = attendanceListService.attendEarlyLeaveCount(email, classcode);

		System.out.println("****차트용 출석률을 위한 숫자들!!!!");
		System.out.println(attendancetotalcount);
		System.out.println(attendnomalcount);
		System.out.println(attendlatecount);
		System.out.println(attendabsencecount);
		System.out.println(attendearlyleavecount);
		System.out.println("************************************");

		if (attendancetotalcount == 0) {
			System.out.println("데이터 없음.");
		} else {
			
			System.out.println((attendnomalcount*100/attendancetotalcount));
			labels[0] = String.valueOf((attendnomalcount/ attendancetotalcount) * 100) + "%";
			labels[1] = String.valueOf((attendlatecount / attendancetotalcount) * 100) + "%";
			labels[2] = String.valueOf((attendabsencecount / attendancetotalcount) * 100) + "%";
			labels[3] = String.valueOf((attendearlyleavecount / attendancetotalcount) * 100) + "%";
			System.out.println(labels[0]+","+labels[1]);
			series[0] = (attendnomalcount / attendancetotalcount) * 100;
			series[1] = (attendlatecount / attendancetotalcount) * 100;
			series[2] = (attendabsencecount / attendancetotalcount) * 100;
			series[3] = (attendearlyleavecount / attendancetotalcount) * 100;

			for (String v : labels) {
				System.out.println(v);
			}
			for (int b : series) {
				System.out.println(b);
			}

		}

		JSONObject obj = new JSONObject();
		JSONArray attendanceChartArray = new JSONArray();

		obj.put("labels", labels);
		obj.put("series", series);
		attendanceChartArray.add(obj);
		response.getWriter().print(attendanceChartArray);

	}

	/*
	 * @description : 차트용 출석률(강사)
	 */
	@RequestMapping(value = "teacher/attendchart.htm", method = RequestMethod.POST)
	public void teacherchart(String email, String classcode, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println(email + "," + classcode);
		System.out.println("강사용 차트 출석률 컨트롤러");

		// ArrayList<AttandanceDTO> list =
		// attendanceListService.selectEachStudent(email, classcode);

		// 출석현황을 담고있는 배열
		// index [0]출석률, [1]지각률,[2]결석률,[3]조퇴율
		System.out.println(email + "," + classcode);

		ArrayList<AttandanceDTO> list = attendanceListService.selectEachStudent(email, classcode);

		System.out.println("출석테이블 size:" + list.size());
		String[] labels = { "", "", "", "" };
		int[] series = { 0, 0, 0, 0 };

		int attendancetotalcount = 1;
		if (list.size() != 0) {
			attendancetotalcount = list.size();
		}

		int attendnomalcount = 0;
		int attendlatecount = 0;
		int attendabsencecount = 0;
		int attendearlyleavecount = 0;

		for (AttandanceDTO eachlist : list) {

			if (eachlist.getAttendState().equals("출석")) {
				attendnomalcount++;
				System.out.println(eachlist.getAttendState().equals("출석"));
			} else if (eachlist.getAttendState().equals("지각")) {
				attendlatecount++;
				System.out.println(eachlist.getAttendState().equals("지각"));
			} else if (eachlist.getAttendState().equals("조퇴")) {
				attendearlyleavecount++;
				System.out.println(eachlist.getAttendState().equals("조퇴"));
			} else if (eachlist.getAttendState().equals("결석")) {
				attendabsencecount++;
				System.out.println(eachlist.getAttendState().equals("결석"));
			} else {
			}

		}		
		
		labels[0]= String.valueOf((attendnomalcount / attendancetotalcount) * 100)+"%";
		labels[1]=String.valueOf((attendlatecount / attendancetotalcount) * 100)+"%";
		labels[2]=String.valueOf((attendabsencecount / attendancetotalcount) * 100)+"%";
		labels[3]=String.valueOf((attendearlyleavecount / attendancetotalcount) * 100)+"%";
		System.out.println(labels[0]+","+labels[1]);
		series[0]=(attendnomalcount / attendancetotalcount) * 100;
		series[1]=(attendlatecount / attendancetotalcount) * 100;
		series[2]=(attendabsencecount / attendancetotalcount) * 100;
		series[3]=(attendearlyleavecount / attendancetotalcount) * 100;
		
		JSONObject obj =new JSONObject();
		JSONArray attendancChartArray= new JSONArray();
		
		obj.put("labels", labels);
		obj.put("series", series);
		attendancChartArray.add(obj);
		try {
			response.getWriter().print(attendancChartArray);
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

}
