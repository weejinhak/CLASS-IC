package com.class_ic.controller_category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student")
public class MainController_Student {

	//student main
	@RequestMapping("main.htm")
	public String student(){
		System.out.println("student main 컨트롤 탐");
		return "student.main";
	}
	
	/////////////////////////////////////////////////////////////////////////////
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
			return "student.student_memo";
		}
		
	/////////////////////////////////////////////////////////////////////////////
}
