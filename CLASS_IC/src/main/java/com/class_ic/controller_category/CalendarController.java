package com.class_ic.controller_category;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.dao.CalendarDAO;
import com.class_ic.vo.CalendarDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


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
   public void CalendarIList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute CalendarDTO dto2){
      System.out.println("1");
      
      CalendarDAO calendardao = sqlSession.getMapper(CalendarDAO.class);   

      ArrayList<CalendarDTO> calendarlist = calendardao.CalendarList();
      
      System.out.println(calendarlist);
      
      JSONArray array = new JSONArray();
      
      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
      for(int i=0; i<calendarlist.size(); i++){
    	  
         JSONObject obj = new JSONObject();
         
         obj.put("title", calendarlist.get(i).getCalTitle());
         
         String start = transFormat.format(calendarlist.get(i).getCalStart());
         obj.put("start", start);
         String end= transFormat.format(calendarlist.get(i).getCalEnd());
         obj.put("end", end);
         
         
         
         array.add(obj);
         System.out.println("2");
      }
      try {
		response.getWriter().print(array);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      System.out.println("3");
       
   }
   
}