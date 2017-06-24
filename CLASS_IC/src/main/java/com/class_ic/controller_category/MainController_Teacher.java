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

import com.class_ic.dao.CalendarDAO;
import com.class_ic.dao.TestDAO;
import com.class_ic.vo.CalendarDTO;
import com.class_ic.vo.Test;

@Controller
@RequestMapping("teacher")
public class MainController_Teacher {

	@Autowired
	private SqlSession sqlsession;

	//teacher main
		@RequestMapping("main.htm")
		public String teacer(){
			System.out.println("teacher common 컨트롤 탐");
			return "teacher.teacher_main";
		}
		
		//teacher calendar
		@RequestMapping("calendar.htm")
		public String history(){
			System.out.println("teacher common 컨트롤 탐");
			return "teacher.calender";
		}
		//boardList 게시판 이동
				@RequestMapping(value="board.htm", method=RequestMethod.GET)
				public String board(){

					return "teacher.board";
				}
				//homework_board게시판 이동
						@RequestMapping(value="homework.htm", method=RequestMethod.GET)
						public String homework(){

							return "teacher.homework_board";
						}

		
		
		
		
		
		
		
		
		
		
		
		
		
	////////////////////////////////////////////////////////////////////////////////////////////	
	//student page test용
		@RequestMapping("test1.htm")
		public String studentTest1(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.attendance_edit";
		}
		@RequestMapping("test2.htm")
		public String studentTest2(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.student_table";
		}
		@RequestMapping("test3.htm")
		public String studentTest3(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher/drag";
		}
		@RequestMapping("test4.htm")
		public String studentTest4(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.board_content";
		}
		@RequestMapping("test5.htm")
		public String studentTest5(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.board_details_view";
		}
		@RequestMapping("test6.htm")
		public String studentTest6(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.board_details";
		}
		@RequestMapping("test7.htm")
		public String studentTest7(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.board_homework_content";
		}
		@RequestMapping("test8.htm")
		public String studentTest8(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.board";
		}
		@RequestMapping("test9.htm")
		public String studentTest9(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.calendar";
		}
		@RequestMapping("test10.htm")
		public String studentTest10(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.class_condition";
		}
		@RequestMapping("test11.htm")
		public String studentTest11(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.history";
		}
		@RequestMapping("test12.htm")
		public String studentTest12(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.homework_board";
		}
		@RequestMapping("test13.htm")
		public String studentTest13(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.message";
		}
		@RequestMapping("test14.htm")
		public String studentTest14(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.teacher_main";
		}
		@RequestMapping("test15.htm")
		public String studentTest15(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.fileMannager";
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
