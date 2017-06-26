package com.class_ic.controller_category;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("student")
public class MainController_Student {


	//student main POST
	@RequestMapping(value="main.htm", method=RequestMethod.POST)
	public String student(HttpSession session, String classCode){
		session.setAttribute("classCode", classCode);
		return "student.student_main";
	}

	//student memo
	@RequestMapping(value="memo.htm", method=RequestMethod.GET)
	public String studentMemo(){

		return "student.student_memo";
	}

	//boardList 게시판 이동
	@RequestMapping(value="board.htm", method=RequestMethod.GET)
	public String board(){

		return "student.board";
	}
	//homework_board게시판 이동
	@RequestMapping(value="homework.htm", method=RequestMethod.GET)
	public String homework(){

		return "student.homework_board";
	}


	//달력 게시판 이동
	@RequestMapping(value="calendar.htm", method=RequestMethod.GET)
	public String calendar(){

		return "student.calendar";
	}
	//출석 데이터 테이블
	@RequestMapping("attend.htm")
	public String attend(){

		return "student.data_table";
	}









	//student page test용
	@RequestMapping("test1.htm")
	public String studentTest1(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.attendance_edit";
	}
	@RequestMapping("test2.htm")
	public String studentTest2(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.attendance";
	}
	@RequestMapping("test3.htm")
	public String studentTest3(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.attendance_check";
	}
	@RequestMapping("test4.htm")
	public String studentTest4(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.board_details_view";
	}
	@RequestMapping("test5.htm")
	public String studentTest5(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.board_details";
	}
	@RequestMapping("test6.htm")
	public String studentTest6(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.board_homework_content";
	}
	@RequestMapping("test7.htm")
	public String studentTest7(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.board";
	}
	@RequestMapping("test8.htm")
	public String studentTest8(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.calendar";
	}
	@RequestMapping("test9.htm")
	public String studentTest9(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.class_condition";
	}
	@RequestMapping("test10.htm")
	public String studentTest10(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.history";
	}
	@RequestMapping("test11.htm")
	public String studentTest11(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.homework_board";
	}
	@RequestMapping("test12.htm")
	public String studentTest12(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.linkfilebar";
	}
	@RequestMapping("test13.htm")
	public String studentTest13(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.memo_content";
	}
	@RequestMapping("test14.htm")
	public String studentTest14(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.student_main";
	}
	@RequestMapping("test15.htm")
	public String studentTest15(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "memo.memo"; //2017.06.16  최은혜
	}
	@RequestMapping("test16.htm")
	public String studentTest16(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.student_message";
	}

	@RequestMapping("test17.htm")
	public String studentTest17(){
		System.out.println("student main 컨트롤 탐, test.htm ");
		return "student.data_table";
	}
	/////////////////////////////////////////////////////////////////////////////
}
