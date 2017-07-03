package com.class_ic.controller_category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.BoardListService;

@Controller
@RequestMapping("student")
public class MainController_Student {
	@Autowired
	private BoardListService boardlistservice;

	@RequestMapping(value = "main.htm", method = RequestMethod.POST)
	public String student(HttpSession session, String classCode) {
		session.setAttribute("classCode", classCode);

		return "student.student_main";
	}

	// student main POST
	@RequestMapping(value = "main.htm", method = RequestMethod.GET)
	public String student() {

		return "student.student_main";
	}

	// student memo
	@RequestMapping(value = "memo.htm", method = RequestMethod.GET)
	public String studentMemo() {

		return "memo.memo";
	}

	// boardList 게시판 이동
	@RequestMapping(value = "board.htm", method = RequestMethod.GET)
	public String board() {

		return "student.board";
	}

	// homework_board게시판 이동
	@RequestMapping(value = "homework.htm", method = RequestMethod.GET)
	public String homework() {

		return "student.homework_board";
	}

	// BoardListService
	// 링크 게시판 이동
	@RequestMapping(value = "linkFile.htm", method = RequestMethod.GET)
	public ModelAndView linkfile(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		ModelAndView viewpage = boardlistservice.linkfileviewbyStudent(request, response, mv);
		return viewpage;

	}

	// 달력 게시판 이동
	@RequestMapping(value = "calendar.htm", method = RequestMethod.GET)
	public String calendar() {

		return "student.calendar";
	}

	// 출석 데이터 테이블
	@RequestMapping("attend.htm")
	public String attend() {

		return "student.data_table";
	}

}
