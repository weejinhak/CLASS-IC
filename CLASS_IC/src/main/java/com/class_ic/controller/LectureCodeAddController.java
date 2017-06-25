/*
* @FileName		:	LectureCodeAddController.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.18
* @Author		:	위진학
*/
package com.class_ic.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.LectureCodeAddService;
import com.class_ic.vo.LectureDTO;


/*
* @Class: LectureCodeAddController
* @Date: 2017.06. 18.
* @Author: 위진학
* @Desc: 강사가 기수 추가시 동작하는 Controller
*/
@Controller
@RequestMapping("common")
public class LectureCodeAddController {

	@Autowired
	private LectureCodeAddService lecturecodeaddservice;

	
	/*
	@description : 강사가 입력하는 input을 parameter로 받아 service로 넘김.
	*/
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
		SimpleDateFormat simpledataformat = new SimpleDateFormat("yyyy-mm-dd");
		
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
	
	/*
	@description : 페이지 로드시 QR코드를 불러내기 위한 URL
	*/
	@RequestMapping("/createCode.htm")
    public ModelAndView createCode(@RequestParam String content){
		//ModelAndView 바로 리턴 
		System.out.println("찍히고 있니??");
		System.out.println("찍힘");
		return new ModelAndView("qrcodeview", "content", content);
	}
	
	
	/*
	@description : 페이지 로드시 email에 맞는 기수를 가져오기 위한 함수
	*/
	@RequestMapping(value ="lecturecodeSelect.htm", method = RequestMethod.POST)
	public String lectureSelect(@RequestParam String email,Model model){
		try {

			List<LectureDTO> lecturelist=lecturecodeaddservice.lecturelistselect(email);	
			model.addAttribute("lecturelist", lecturelist); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return "common/lectureList";
	}
	
	@RequestMapping(value ="lecturecodeSelectStudent.htm", method = RequestMethod.POST)
	public String lectureSelectStudent(@RequestParam String email,Model model){
		try {

			List<LectureDTO> lecturelist=lecturecodeaddservice.lecturelistselect(email);	
			model.addAttribute("lecturelistStudent", lecturelist); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return "common/lectureListStudent";
	}

}
