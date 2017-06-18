package com.class_ic.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.LectureCodeAddService;
import com.class_ic.vo.LectureDTO;

@Controller
@RequestMapping("common")
public class LectureCodeAddController {

	@Autowired
	private LectureCodeAddService lecturecodeaddservice;

	@RequestMapping(value = "lecturecodeadd.htm", method = RequestMethod.POST)
	public void lectureinsert(HttpServletRequest request){
		System.out.println("lecture 컨트롤 탔음");
		
		LectureDTO lectureDto = new LectureDTO();
		
		SimpleDateFormat sdf= new SimpleDateFormat(pattern)
		
		lectureDto.setClasscode(request.getParameter("classcode"));
		lectureDto.setClasstitle(request.getParameter("classtitle"));
		lectureDto.setClassstart(request.getParameter("classstart"));
		lectureDto.setClassend(request.getParameter("classend"));
		lectureDto.setClassopentime(request.getParameter("classopentime"));
		lectureDto.setClassclosetime(request.getParameter("classclosetime"));
		lectureDto.setClassinvitecode(request.getParameter("classinvitecode"));
		lectureDto.setEmail(request.getParameter("email"));
		
		try {
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
