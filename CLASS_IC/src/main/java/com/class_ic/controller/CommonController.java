package com.class_ic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common")
public class CommonController {
	
	@RequestMapping("select.htm")
	public String theSelect(){
		System.out.println("commont select controller 기수선택");
		
		return "common/theSelect";
	}

}
