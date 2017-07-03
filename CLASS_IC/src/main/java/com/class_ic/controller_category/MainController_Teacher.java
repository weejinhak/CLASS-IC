package com.class_ic.controller_category;


import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service_category.MainService_Teacher;
import com.class_ic.vo.ClassDTO;

@Controller
@RequestMapping("teacher")
public class MainController_Teacher {

	@Autowired	
	private MainService_Teacher mainteacherservice;

	//teacher main POST
		@RequestMapping(value="main.htm", method=RequestMethod.POST)
		public String student(HttpSession session, String email, String classCode, Model model){
			
			session.setAttribute("classCode", classCode);
			
			List<ClassDTO> MainList =  mainteacherservice.selectMain(email);
			model.addAttribute("mainlist", MainList);
			
          return "teacher.teacher_main";
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

}
