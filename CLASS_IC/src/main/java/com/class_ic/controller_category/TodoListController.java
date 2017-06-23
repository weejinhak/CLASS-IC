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
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.CalendarDAO;
import com.class_ic.dao.TodoListDAO;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.TodoListDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="student")
public class TodoListController {
   
   @Autowired
   private SqlSession sqlSession;

   /*
   @description : TodoList에서의 값들을 받아와 DB에 저장
   */
   @RequestMapping(value="TodoListInsertOk.htm", method=RequestMethod.GET)
   public String TodoListInsertOk(HttpServletRequest request) {
	   System.out.println("todolist컨트롤 탄다.");
	   
	   TodoListDAO todolistdao = sqlSession.getMapper(TodoListDAO.class);
	   TodoListDTO dto = new TodoListDTO();
	   
	   String listContent = request.getParameter("listContent");
	   System.out.println("컨트롤에서 list내용 확인 : " + listContent);
	   
	   dto.setListContent(listContent);
	   
	   todolistdao.TodoListOk(dto);
	   
	   return"student.student_main";
   }

   /*
   @description : DB에 저장된 일정들을 TodoList에 출력
   */
   @RequestMapping(value="test14.htm", method=RequestMethod.GET)
   public ModelAndView ModelAndView (HttpServletRequest request, HttpServletResponse response) {
	   System.out.println("todolist select 컨트롤러 탄다.");
	   
	   TodoListDAO todolistdao = sqlSession.getMapper(TodoListDAO.class);
	   
	   ArrayList<TodoListDTO> todolist = todolistdao.TodoList();
	   System.out.println("todolist :" + todolist );
	   
	   ModelAndView model = new ModelAndView();
	   
	   model.addObject("list",todolist);
	   model.setViewName("student.student_main");
	   
	   return model;
   }
   
   
   /*
   @description : TodoList삭제 
   */
   @RequestMapping(value="TodoListDelete.htm", method=RequestMethod.GET)
   public void TodoListDelete(HttpServletRequest request, HttpServletResponse response) throws IOException{
	   System.out.println("todolist 삭제 컨트롤 탄다.");
	   
	   TodoListDAO todolistdao = sqlSession.getMapper(TodoListDAO.class);
       TodoListDTO dto = new TodoListDTO();
       
       	int listNo =Integer.parseInt(request.getParameter("listNo"));
       	System.out.println("삭제번호 : " + listNo);
       	
       	todolistdao.TodoListDelete(listNo);
       	
       
   }
      
   
   
   
}