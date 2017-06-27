package com.class_ic.controller;

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
import com.class_ic.dao.LectureBoardDAO;
import com.class_ic.dao.TodoListDAO;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.TodoListDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="teacher")
public class LectureBoardController {
   
   @Autowired
   private SqlSession sqlsession;

   
   
   @RequestMapping(value="totalboard.htm") 
      public ModelAndView allBoard(LectureBoardDTO bvo){ 
         
         LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class);
         
         String subcateCode="2-1";
         ArrayList<LectureBoardDTO> blist = bdao.allBoard(subcateCode); 
         
         // 리턴 셋팅
         ModelAndView m = new ModelAndView();
         m.setViewName("teacher.totalLectureBoard");
         m.addObject("bvo", blist);  
         
         return m;
           
      }
   
   
   
}