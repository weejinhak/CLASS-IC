package com.class_ic.controller_category;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody;
import com.class_ic.dao.CalendarDAO;
import com.class_ic.vo.CalendarDTO;


@Controller
@RequestMapping("teacher1")
public class CalendarController {
	
	@Autowired
	private SqlSession sqlSession;

	/*
	@description : 일정 입력에서의 값들을 받아와 DB에 저장
	*/
	@RequestMapping("CalendarInsertOk.htm")
	public String CalendarInsesrtOk(HttpServletRequest request) {
		System.out.println("CalendarInsertOk.htm 까지들어옴");

		CalendarDAO calendarDao = sqlSession.getMapper(CalendarDAO.class);
		CalendarDTO calendarDto = new CalendarDTO(); 

		String calStart = request.getParameter("calStart");
		String calEnd = request.getParameter("calEnd");
		
		System.out.println(calStart);
		System.out.println(calEnd);
		
		String calTitle = request.getParameter("calTilte");
		String calContent = request.getParameter("calContent");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");

		java.util.Date startdate;
		java.util.Date enddate;
	
		try {
			startdate = sdf.parse(calStart);
			enddate=sdf.parse(calEnd);
			Date start = new Date(startdate.getTime());
			Date end = new Date(enddate.getTime());

			calendarDto.setCalStart(start);
			calendarDto.setCalEnd(end);
			calendarDto.setCalTitle(calTitle);
			calendarDto.setCalContent(calContent);

			System.out.println("캘린더 컨트롤러 일정입력 get ");

			calendarDao.CalendarWriteOk(calendarDto);
		} catch (ParseException e) {
			e.printStackTrace();
		}


		return "teacher.calendar";
	}

	/*
	@description : DB에 저장된 일정들을 캘린더에 출력
	*/
	@RequestMapping("CalendarList.htm")
	@ResponseBody
	public String CalendarIList(HttpServletRequest request){
		CalendarDAO dao = sqlSession.getMapper(CalendarDAO.class);
		CalendarDTO dto = new CalendarDTO();
		
		ArrayList<CalendarDTO> calendarList= null;
		
		for(int i=0; i<CalendarList.size(); i++){
			dto = CalendarList.get(i);
		}
		
		return"";
	}
	
}
