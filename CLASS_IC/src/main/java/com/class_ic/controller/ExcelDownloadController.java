/*
* @FileName	:	CommonController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.service.AttendanceListService;
import com.class_ic.vo.AttandanceDTO;

@Controller
public class ExcelDownloadController {

	@Autowired
	private AttendanceListService attendanceListService;

	/*
	 * @description :엑셀로 학생출석을 다운로드
	 */
	@RequestMapping(value = "student/excelDownload.htm", method = RequestMethod.POST)
	public ModelAndView createCode(HttpServletRequest request) {
		// ModelAndView 바로 리턴
		String email=request.getParameter("email");
		String classcode=request.getParameter("classcode");
		System.out.println("엑셀다운을위한 컨트롤러 탐 !!" + email+":"+classcode);
		List<AttandanceDTO> memberattendacnelist = attendanceListService.attendanceSelect(email, classcode);

		
		return new ModelAndView("excelview", "memberattendacnelist", memberattendacnelist);
	}

}
