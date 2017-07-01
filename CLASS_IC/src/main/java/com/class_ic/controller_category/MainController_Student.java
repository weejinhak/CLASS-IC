package com.class_ic.controller_category;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("student")
public class MainController_Student {
	
	
	@RequestMapping(value="main.htm", method=RequestMethod.POST)
	public String student(HttpSession session, String classCode){
		session.setAttribute("classCode", classCode);
		
		return "student.student_main";
	}
	
	//student main POST
		@RequestMapping(value="main.htm", method=RequestMethod.GET)
		public String student(){

			
			return "student.student_main";
		}

	//student memo
	@RequestMapping(value="memo.htm", method=RequestMethod.GET)
	public String studentMemo(){

		return "memo.memo";
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

	//링크_파일 게시판 이동
		@RequestMapping(value="linkFile.htm", method=RequestMethod.GET)
		public String linkFile(){

			return "student.LinkFileList";
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


}
