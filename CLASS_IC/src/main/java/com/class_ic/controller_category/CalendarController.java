package com.class_ic.controller_category;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.dao.CalendarDAO;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.CalendarDTO2;


@Controller
@RequestMapping(value="teacher", method=RequestMethod.POST)
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
		
		String calTitle = request.getParameter("calTitle");
		String calContent = request.getParameter("calContent");
		String classCode = request.getParameter("classCode");
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
			calendarDto.setClassCode(classCode);

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
	
	@RequestMapping(value="CalendarList.htm", method=RequestMethod.GET)
	@ResponseBody
	public CalendarDTO2 CalendarIList(HttpServletRequest request){
	  
		System.out.println("여기까지들어옴?");
		
		CalendarDAO dao = sqlSession.getMapper(CalendarDAO.class);
		
	    
	    CalendarDTO dto = new CalendarDTO();
	    
	    dto.setCalNo(1);
	    
	    CalendarDTO dto1= dao.CalendarList();
	    
	    CalendarDTO2 dto2 = new CalendarDTO2();
	    
	    dto2.setTitle(dto1.getCalTitle());// 문제
	    dto2.setStart(dto1.getCalStart());
	    dto2.setEnd(dto1.getCalEnd());
	    
		return dto2;
	}
	
}
