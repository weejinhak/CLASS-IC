package com.class_ic.controller_category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("ClaendarList.htm")
	
	public String insertCalendar(){
	
		
		return "join/login";
	}
	
	

}
