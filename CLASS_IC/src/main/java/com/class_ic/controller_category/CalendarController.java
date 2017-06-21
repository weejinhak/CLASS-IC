package com.class_ic.controller_category;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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

      //일정 시작 날짜 가져오기
      String calStart = request.getParameter("calStart");     
      //일정 마친 날짜 가져오기
      String calEnd = request.getParameter("calEnd");
      
      System.out.println(calStart);
      System.out.println(calEnd);
      
      //제목
      String calTitle = request.getParameter("calTitle");
     //내용
      String calContent = request.getParameter("calContent");
      //코드
/*      String classCode = request.getParameter("classCode");*/
      String classCode = "151";
      //class code가 1로 들어옴.
      String[] colorlist= {"event-blue" , "event-azure" , "event-green" , "event-orange" , "event-red" };
      int random=(int) (Math.random() * 5) ; 


      System.out.println(calTitle);
      System.out.println(calContent);
      System.out.println(classCode);
      
    
      
         calendarDto.setCalStart(calStart);
         calendarDto.setCalEnd(calEnd);
         calendarDto.setCalTitle(calTitle);
         calendarDto.setCalContent(calContent);
         calendarDto.setClassCode(classCode);
         calendarDto.setColor(colorlist[random]);

         System.out.println("캘린더 컨트롤러 일정입력 get ");

         calendarDao.CalendarWriteOk(calendarDto);
         
   

      return "teacher.calendar";
   }

   /*
   @description : DB에 저장된 일정들을 캘린더에 출력
   */
   
   @RequestMapping(value="CalendarList.htm", method=RequestMethod.GET)
   public void CalendarIList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute CalendarDTO dto2) throws ParseException{
      System.out.println("1");
      
      CalendarDAO calendardao = sqlSession.getMapper(CalendarDAO.class);   

      ArrayList<CalendarDTO> calendarlist = calendardao.CalendarList();
      

      System.out.println(calendarlist);
      
      JSONArray array = new JSONArray();
      
      for(int i=0; i<calendarlist.size(); i++){
         
         JSONObject obj = new JSONObject();
         obj.put("id", calendarlist.get(i).getCalNo());
         obj.put("title", calendarlist.get(i).getCalTitle());
         
         String start = calendarlist.get(i).getCalStart();
         obj.put("start", start);
         String end= calendarlist.get(i).getCalEnd();
         SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd"); 

         Calendar cal = Calendar.getInstance();
         
          java.util.Date date=sdformat.parse(end);
          System.out.println(date);
          
          cal.setTime(date);
          cal.add(Calendar.DATE, +1);
          
          System.out.println("before"+end);
          end = sdformat.format(cal.getTime());  
        
          
          System.out.println("afeter"+end);

         
         obj.put("end", end);
     
         System.out.println(calendarlist.get(i).getColor());
         obj.put("className",calendarlist.get(i).getColor());
         
     
         
         array.add(obj);
         System.out.println("2");
      }
      
      try {
      response.getWriter().print(array);
      
   } catch (IOException e) {
      
      e.printStackTrace();
   }
      System.out.println("3");
       
   }
   
   
   @RequestMapping(value="CalendarEditDelete.htm", method=RequestMethod.GET)
   public void calendarEditDelete(HttpServletRequest request, HttpServletResponse response) throws IOException{
      System.out.println("하잇");
      int id=Integer.parseInt(request.getParameter("id"));
      System.out.println("id"+id);
      
      CalendarDAO calendardao = sqlSession.getMapper(CalendarDAO.class);   
      calendardao.CalendarDelete(id);
  
         
         
   }
   
   
   @RequestMapping(value="todayclass.htm", method=RequestMethod.POST)
   public void CalendarTodayClass(){

         }
      
   
   
}