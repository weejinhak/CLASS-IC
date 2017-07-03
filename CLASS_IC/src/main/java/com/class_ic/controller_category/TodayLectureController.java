package com.class_ic.controller_category;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.TodayLectureDAO;
import com.class_ic.vo.TodayLectureVO;

@Controller
@RequestMapping("teacher")
public class TodayLectureController{
   

   @Autowired
      SqlSession sqlsession;
   //teacher main
   
//   @RequestMapping("main.htm")
//   public String teacer(){
//      System.out.println("teacher common 컨트롤 탐");
//      return "teacher.main";
//   }
//   
//   
   
   
   //이름 subcate 뭐시기로 변경 
/*   @RequestMapping("todayclass.htm") 
   public ModelAndView allBoard(TodayLectureVO bvo){ 
      
      TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class);
      
      String subcateCode="2-1";
      ArrayList<TodayLectureVO> blist = bdao.allBoard(subcateCode); 
      
      // 리턴 셋팅
      ModelAndView m = new ModelAndView();
      m.setViewName("teacher.board_details_view");
      m.addObject("bvo", blist);  
      
      return m;
        
   }
 
   */
   
   //전체 오늘의 목록 조회

   @RequestMapping("todayLectureList.htm")
   public ModelAndView todayLectureList(TodayLectureVO bvo){ 
    
      TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class); 
       
      
      
      ArrayList<TodayLectureVO> blist = bdao.todayLectureList();
      // 리턴 셋팅
      ModelAndView m = new ModelAndView();
      m.setViewName("teacher.todayLecture_storage");
      
    
      
      
      m.addObject("bvo", blist); 

      return m;
      
      
   }
   
    
   
   
   @RequestMapping(value="multi_storage.htm" ) 
   public String multi_storage(HttpServletRequest request, HttpServletResponse response ) {
 

    String test=request.getParameter("data");
    System.out.println(test);
      TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class); 
    
  
    
       String[] array = test.split(",");
       
       System.out.println(array.length);

       for(int i=0;i<array.length;i++){
          System.out.println(array[i]);
          
          
          bdao.insertTodayLect(Integer.parseInt(array[i]));
          
       } 
 

      
       
/*   for(String values: rowid){
      System.out.println(values);
   }*/
/*    for(String elem : rowid){
        System.out.println(elem+"  ");
}*/

   return "teacher.board_details_view";

   } 
   
   
   //오늘의 강의 삭제 

   @RequestMapping(value="todayLectureDelete.htm" ) 
   public String delete(HttpServletRequest request, HttpServletResponse response){ 
      
      
      System.out.println("todayLectureDelete.htm 컨트롤러 탐 ");
      int todayNo = Integer.parseInt( request.getParameter("todayNo"));
      
      
      TodayLectureDAO bdao = sqlsession.getMapper(TodayLectureDAO.class); 
      
      bdao.deleteTodayLect(todayNo) ;

      

      return "redirect:todayLectureList.htm";
 
   }
   
   

}