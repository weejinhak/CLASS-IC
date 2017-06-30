package com.class_ic.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.app.dto.MemberDTO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.dao.LectureBoardDAO;
import com.class_ic.vo.LectureBoardDTO;


@Controller
@RequestMapping(value="teacher")
public class LectureBoardController {
   
   @Autowired
   private SqlSession sqlsession;

   

   @RequestMapping(value="allboard.htm") 
      public ModelAndView allBoard(LectureBoardDTO bvo, HttpServletRequest request){ 
         System.out.println("컨트롤러 타냐? ");
         LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class);
         

         ArrayList<LectureBoardDTO> blist = bdao.allList();
         
         System.out.println("셀렉리스트 컨트롤러 : " +blist);

         // 리턴 셋팅
         ModelAndView m = new ModelAndView();
         m.setViewName("teacher.totalLectureBoard");
         m.addObject("bvo", blist);  
         
         System.out.println(m);
         return m;
           
      }
   
   @RequestMapping(value="totalboard.htm") 
      public ModelAndView totalBoard(LectureBoardDTO bvo, HttpServletRequest request){ 
         System.out.println("컨트롤러 타냐? ");
         LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class);
         
         String cateCode = request.getParameter("cateCode");
         String subcateCode = request.getParameter("subcateCode");
         
         ArrayList<LectureBoardDTO> blist = bdao.allBoard(cateCode,subcateCode); 
         
         System.out.println("셀렉리스트 컨트롤러 : " +blist);
         
         // 리턴 셋팅
         ModelAndView m = new ModelAndView();
         m.setViewName("common/totalboardlist");
         m.addObject("bvo", blist);  
         
         System.out.println(m);
         return m;
           
      }
   
 
   
   //수정화면처리
   @RequestMapping(value="totalboardEdit.htm",method = RequestMethod.GET)
   public ModelAndView  totalboardEdit(LectureBoardDTO dto,HttpServletRequest request,int lectureNo){
	   System.out.println("edit화면 출력 컨트롤러");

	   LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class);
	  
	   int lectureNo1 = lectureNo;
	   System.out.println("lectureNo 나오냐" + lectureNo);
	   
	   ArrayList<LectureBoardDTO> list = bdao.totalboardEdit(lectureNo1);
	   System.out.println(list.size());
	   ModelAndView m = new ModelAndView();
	   m.setViewName("teacher.totalLectureBoard_Edit");
	   m.addObject("list", list);
	    System.out.println("모델단"+m);
	  
	   return m;
   }
   
   //수정 DB저장 완료
   @RequestMapping(value="totalboardEdit.htm", method = RequestMethod.POST )
   public String totalboardEditOk(LectureBoardDTO dto){
	   System.out.println("수정오케이컨트롤러11"+dto);
	   
	   LectureBoardDAO dao = sqlsession.getMapper(LectureBoardDAO.class);
	   System.out.println("번호 : " + dto.getLectureNo());
	   System.out.println("타이틀 : "+ dto.getLectureTitle());
	   System.out.println("내용 : " + dto.getLectureContent());
	   
	   dao.totalboardEditOk(dto);
	   
	   System.out.println("수정오케이컨트롤러"+dto);
	                 
	  return "redirect:allboard.htm";
	   
   }
   

   //다중 삭제 totalBoard_multi_check
   
    @RequestMapping(value="totalBoard_multi_delete.htm" ) 
   public String multi_del(HttpServletRequest request, HttpServletResponse response ) {
        System.out.println("다중삭제 컨트롤러");

       String test=request.getParameter("data");
       System.out.println(test);
       LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class); 
       
     
       
          String[] array = test.split(",");
          
          System.out.println(array.length);

          for(int i=0;i<array.length;i++){
             System.out.println(array[i]);
             
                //삭제로 바꿈    
             bdao.deleteLect(Integer.parseInt(array[i]));
             
          }
         return "redirect:allboard.htm";
          
    } 

          
          
   //글 한개 씩 삭제 

         @RequestMapping(value="totalBoard_delete.htm" ) 
         public String delete(HttpServletRequest request, HttpServletResponse response){ 
            
            
            System.out.println("totalBoard_delete.htm 컨트롤러 탐 ");
            int lectureNo = Integer.parseInt( request.getParameter("lectureNo"));
            
            
            LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class); 
            
            bdao.deleteLect(lectureNo) ;
 
            return "redirect:allboard.htm";
       
         }
         
   
         //게시판 글 상세보기 
         @RequestMapping("totalBoard_contentview.htm") 
         public ModelAndView boardContentDetail(HttpServletRequest request, HttpServletResponse response,LectureBoardDTO bvo ){  //lectureNo 올걸 
            
            LectureBoardDAO bdao = sqlsession.getMapper(LectureBoardDAO.class); 
            
            int lectureNo = Integer.parseInt( request.getParameter("lectureNo"));
              System.out.println("lectno" +lectureNo);
            ArrayList<LectureBoardDTO> blist = bdao.totalBoard_contentview(lectureNo); 
            System.out.println("은영 상세"+blist);
            // 리턴 셋팅
            ModelAndView m = new ModelAndView();
            m.setViewName("teacher.board_content_view");
            m.addObject("bvo", blist);  
            
            return m;
         }
         
  
         

}