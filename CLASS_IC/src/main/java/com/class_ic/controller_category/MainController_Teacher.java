package com.class_ic.controller_category;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.dao.TestDAO;
import com.class_ic.vo.Test;

@Controller
@RequestMapping("teacher")
public class MainController_Teacher {
	

	@Autowired
		SqlSession sqlsession;
	
	//teacher main
		@RequestMapping("main.htm")
		public String teacer(){
			System.out.println("teacher common 컨트롤 탐");
			return "teacher.main";
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
			return "teacher.attendance";
		}
		@RequestMapping("test3.htm")
		public String studentTest3(){
			System.out.println("teacher main controller 탐, test.htm ");
			return "teacher.attendancelist_edit";
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


		///////////////////////////////////////////////////////////////////////////////////////////
		
		
		//teacher board
		@RequestMapping("board.htm")
			public String teacherBoard(){
				System.out.println("teacher common board.htm 컨트롤 탐");
				return "teacher.board";
			}
		//teacher board detail
		@RequestMapping("board_detail.htm")
		public String teacherBoardDetail(){
			System.out.println("teacher common board_detail.htm 컨트롤 탐");
			return "teacher.board_detail";
		}
		
		//teacher write GET
		@RequestMapping(value="write.htm", method=RequestMethod.GET)
		public String teacherWrite(){
			System.out.println("teacher write controller");
			return "teacher.write";
		}
				
		//teacher write POST
		@RequestMapping(value="write.htm", method=RequestMethod.POST)
		public String teacherWrite(Test test){
				System.out.println("teacher write controller post");
				System.out.println("제목 값을 가져온다"+test.getTitle());
				TestDAO dao = sqlsession.getMapper(TestDAO.class);
			dao.insert(test);
				return "teacher.main";
		}
		
		//teacher message GET
		/*@RequestMapping(value="msg.htm", method=RequestMethod.GET)*/
		@RequestMapping("msg.htm")
		public  String teacherMessage(){
			System.out.println("메시지 쓰러가자 ");
			return "teacher.message";
		}
		
		/*//teacher message POST
		@RequestMapping(value="msg.htm", method=RequestMethod.POST)
		public  String teacherMessage(){
					
			return "teacher.message";
		}*/

}
