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

@Controller
public class IndexController {
	
	@RequestMapping("index.htm")
	public String index(){
		System.out.println("Tiles를 안타는 경우");
		//internarl view resolver를 태우는 경우는 index 처럼 해당 파일명만 쓴다 아래와 같이 
		//return "index";
		//해당 파일이 폴더 안에 있을 경우
		//return "폴더명/jsp 파일명" 이렇게 쓴다. 즉, return "join/login"
		//redirect의 경우 
		//redirect:파일명을 쓴다. 
		//return "redirect:index";
		//return "redirect:join/login";
		
		return "join/Join";
	}
	
	@RequestMapping("main.htm")
	public String main(){
		System.out.println("main 겸 login 후보1");
		return "common/main";
	}
	
	

}
