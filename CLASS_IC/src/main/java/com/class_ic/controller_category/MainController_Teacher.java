package com.class_ic.controller_category;


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

import com.class_ic.service.BoardListService;
import com.class_ic.service_category.MainService_Teacher;
import com.class_ic.vo.LectureBoardDTO;

@Controller
@RequestMapping("teacher")
public class MainController_Teacher {


	@Autowired	
	private MainService_Teacher mainteacherservice;	   
	@Autowired
	   private BoardListService boardlistservice;
	   
	   
    @Autowired
    private SqlSession sqlsession;

	//teacher main POST
		@RequestMapping(value="main.htm", method=RequestMethod.POST)
		public ModelAndView student(HttpSession session, String classCode, Model model){
			
			
			session.setAttribute("classCode", classCode);
			
			ModelAndView viewpage = mainteacherservice.selectMain(session);
					
			
			return viewpage;
       }

		
		//teacher main GET 
			@RequestMapping(value="main.htm", method=RequestMethod.GET)
			public String student(){

				
				return "teacher.teacher_main";
			}


	//teacher calendar
	@RequestMapping("calendar.htm")
	public String history(){
		System.out.println("teacher common 컨트롤 탐");
		return "teacher.calendar";
	}
/*	//boardList 게시판 이동
	@RequestMapping(value="board.htm", method=RequestMethod.GET)
	public String board(){

		return "teacher.board";
	}*/
	
	//homework_board게시판 이동
	@RequestMapping(value="homework.htm", method=RequestMethod.GET)
	public String homework(){

		return "teacher.homework_board";
	}
	//출석 데이터 테이블
	@RequestMapping("attend.htm")
	public String attend(){

		return "teacher.data_table";
	}
	
	//학생부 게시판 이동
		@RequestMapping(value="studentList.htm", method=RequestMethod.GET)
		public String selectStudent(){

			return "teacher.attendance";
		}




	// teacher message GET
	/* @RequestMapping(value="msg.htm", method=RequestMethod.GET) */
	@RequestMapping("msg.htm")
	public String teacherMessage() {
		System.out.println("메시지 쓰러가자 ");
		return "teacher.message";
	}

	/*
	 * //teacher message POST
	 * 
	 * @RequestMapping(value="msg.htm", method=RequestMethod.POST) public String
	 * teacherMessage(){
	 * 
	 * return "teacher.message"; }
	 */


//  BoardListService
  //링크 게시판 이동
  @RequestMapping(value="linkFile.htm", method=RequestMethod.GET)
      public ModelAndView linkfile (HttpServletRequest request, HttpServletResponse response, ModelAndView mv){  
        ModelAndView viewpage = boardlistservice.linkfileviewByTeacher(request, response, mv); 
     return viewpage;
     
     
  }

  
  //링크 추가 
    @RequestMapping(value="linkInsert.htm", method=RequestMethod.POST)
    public String linkInsert(HttpServletRequest request ) {
       System.out.println("linkInsert 컨트롤러 까지들어옴"); 
        boardlistservice.linkInsert(request) ;
      
        
        return "redirect:linkFile.htm";
       
    }
    
    //링크 다중 삭제 
      @RequestMapping(value="linkBoard_multi_delete.htm" ) 
      public String link_multi_del(HttpServletRequest request, HttpServletResponse response ) {
         String viewpage = boardlistservice.link_multi_del(request, response);
           
           return viewpage;
      }
     //링크 수정  
      @RequestMapping(value="linkboardEdit.htm",method = RequestMethod.GET)
      public ModelAndView  linkboardEdit(LectureBoardDTO dto,HttpServletRequest request,int linkNo){
           ModelAndView viewpage = boardlistservice.linkboardEdit(dto, request, linkNo);
            
            return viewpage;
             
      }
        
      //링크게시판 수정  된 데이터 DB저장
      @RequestMapping(value="linkboardEdit.htm", method = RequestMethod.POST )
      public String linkboardEditOk(LectureBoardDTO dto){
         String viewpage = boardlistservice.linkboardEditOk(dto);
            
            return viewpage;
      }
        
}
