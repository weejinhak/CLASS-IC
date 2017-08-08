/*
* @FileName	:	IndexController.java
*
* @Project		:	CLASS-IC
* @Date			:	2017.06.15
* @Author		:	이현정
*/
package com.class_ic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
* @Class: IndexController
* @Date: 2017.07.02
* @Author: 이현정
* @Desc: 인덱스 및 메인 화면 이동
*/
@Controller
public class IndexController {
	
	@RequestMapping("index.htm")
	public String index(){
		
		return "common/index";
	}
	
	@RequestMapping("main.htm")
	public String main(){

		return "common/main";
	}
	
	

}
