/*
* @FileName	:	CommonController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "student/excelDownload.htm", method = RequestMethod.GET)
	public ModelAndView createCode(@RequestParam("email") String email,@RequestParam("classcode") String classcode) {
		// ModelAndView 바로 리턴

		List<AttandanceDTO> memberattendacnelist = attendanceListService.attendanceSelect(email, classcode);

		
		return new ModelAndView("excelview", "memberattendacnelist", memberattendacnelist);
	}

}
