package com.class_ic.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.LectureCodeAddService;
import com.class_ic.vo.LectureDTO;

@Controller
@RequestMapping("common")
public class LectureCodeAddController {

	@Autowired
	private LectureCodeAddService lecturecodeaddservice;

	@RequestMapping(value = "lecturecodeadd.htm", method = RequestMethod.POST)
	public String lectureinsert(HttpServletRequest request){
		
		///값이 들어오는지 확인.		
		System.out.println("lecture 컨트롤 탔음");
		System.out.println(request.getParameter("classcode"));
		System.out.println(request.getParameter("classtitle"));
		System.out.println(request.getParameter("classstart"));
		System.out.println(request.getParameter("classend"));
		System.out.println(request.getParameter("classopentime"));
		System.out.println(request.getParameter("classclosetime"));
		System.out.println(request.getParameter("classinvitecode"));
		System.out.println(request.getParameter("email"));		
		///
		
		String classstart = request.getParameter("classstart");
		String classend= request.getParameter("classend");
		SimpleDateFormat simpledataformat = new SimpleDateFormat("yyyy/mm/dd");
		
		LectureDTO lectureDto = new LectureDTO();	
		String viewpage="";
		try {
			java.util.Date startdate=simpledataformat.parse(classstart);
			java.util.Date enddate = simpledataformat.parse(classend);			
			Date start = new Date(startdate.getTime());
			Date end = new Date(enddate.getTime());
			
			lectureDto.setClasscode(request.getParameter("classcode"));
			lectureDto.setClasstitle(request.getParameter("classtitle"));
			lectureDto.setClassstart(start);
			lectureDto.setClassend(end);
			lectureDto.setClassopentime(request.getParameter("classopentime"));
			lectureDto.setClassclosetime(request.getParameter("classclosetime"));
			lectureDto.setClassinvitecode(request.getParameter("classinvitecode"));
			lectureDto.setEmail(request.getParameter("email"));
			
			try {
				viewpage=lecturecodeaddservice.addclasscode(lectureDto);
			} catch (Exception e) {
				System.out.println("insert가 안되는 경우");
				e.printStackTrace();
			}
			
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		return viewpage; 		
	}
	
	@RequestMapping("/createCode.htm")
    public ModelAndView createCode(@RequestParam String content){
		//ModelAndView 바로 리턴 
		System.out.println("찍히고 있니??");
		System.out.println("찍힘");
		return new ModelAndView("qrcodeview", "content", content);
	}
	
}
