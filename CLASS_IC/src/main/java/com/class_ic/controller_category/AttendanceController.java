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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

		String[] labels = { "", "", "", "" };
		int[] series = { 0, 0, 0, 0 };

		if (attendancetotalcount == 0) {
			System.out.println("데이터 없음.");
		} else {

			labels[0] = String.valueOf((attendnomalcount / attendancetotalcount) * 100) + "%";
			labels[1] = String.valueOf((attendlatecount / attendancetotalcount) * 100) + "%";
			labels[2] = String.valueOf((attendabsencecount / attendancetotalcount) * 100) + "%";
			labels[3] = String.valueOf((attendearlyleavecount / attendancetotalcount) * 100) + "%";

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
		System.out.println(email+","+classcode);
		System.out.println("강사용 차트 출석률 컨트롤러");
		
		
	    //ArrayList<AttandanceDTO> list = 		
		//attendanceListService.selectEachStudent(email, classcode);

		//출석현황을 담고있는 배열
		//index [0]출석률, [1]지각률,[2]결석률,[3]조퇴율
		int[] avg=eachPercent(email, classcode);
		System.out.println(avg);
	
		
		
	}

	public int[] eachPercent(String email, String classcode) {


		System.out.println("여기까진오냐");
		System.out.println(email+","+classcode);
		
	    ArrayList<AttandanceDTO> list = attendanceListService.selectEachStudent(email, classcode);

		int[] avg ={0,0,0,0};
		System.out.println("출석테이블의 싸이즈"+list.size());
		
		int attendancetotalcount = 1;
	if(list.size()!=0){
		attendancetotalcount=list.size();	
		}

		int attendnomalcount = 0;
		int attendlatecount = 0;
		int attendabsencecount = 0;
		int attendearlyleavecount = 0;

		for (AttandanceDTO eachlist : list) {

			if (eachlist.getAttendState().equals("출석")) {
				attendnomalcount++;
				System.out.println("설마1");
			} else if (eachlist.getAttendState().equals("지각")) {
				attendlatecount++;
				System.out.println("설마2");
			} else if (eachlist.getAttendState().equals("조퇴")) {
				attendearlyleavecount++;
				System.out.println("설마3");
			} else if (eachlist.getAttendState().equals("결석")) {
				attendabsencecount++;
				System.out.println("설마4");
			}else{
				System.out.println("설마5");
			}

		}


		//출석률
		avg[0]=(attendnomalcount / attendancetotalcount) * 100;
		//지각률
		avg[1]=(attendlatecount / attendancetotalcount) * 100;
		//결석률
		avg[2]=(attendabsencecount / attendancetotalcount) * 100;
		//조퇴율
		avg[3]=(attendearlyleavecount/attendancetotalcount)*100;
		
		System.out.println(avg[0]+","+avg[1]+","+avg[2]);

		return avg;
	}
}
