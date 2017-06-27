package com.class_ic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.24
* @Author		:	노지영
*/

/*
* @Class: BoardCategoryController 
* @Date: 2017.06. 24
* @Author: 노지영
* @Desc: 게시판의 카테고리 부분의 CRUD를 담담하는 컨트롤러.
*/


@Controller
public class BoardCategoryController {

/*@description : 카테고리 리스트를 select 해오는 메소드*/
	//@RequestMapping(value = "lecturecodeadd.htm", method = RequestMethod.POST)
	
	
	
	
	
	@RequestMapping(value = "boardlecture.htm", method = RequestMethod.POST)
	public void selectCategoryList(){
	System.out.println("selectCategoryList 메소드 들어옴.");
	
	}
	
	public void selectSubCategoryList(){
		
	}
	
	public void insertCategory(){
		
	}
	
	public void deleteCategory(){
		
	}
	
	
	public void insertSubCategory(){
		
	}
	
	public void deleteSubCategory(){
		
	}

}
