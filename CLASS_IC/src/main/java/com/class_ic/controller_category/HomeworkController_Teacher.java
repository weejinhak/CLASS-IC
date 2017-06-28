package com.class_ic.controller_category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.service.HomeworkService;
import com.class_ic.service.StudentListService;
import com.class_ic.vo.HomeworkDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("teacher")
public class HomeworkController_Teacher {
	
	@Autowired
	private HomeworkService homeworkService;

	//과제 상세게시판 메인 카테고리 출력 : 2017.06.27 최은혜
	@RequestMapping(value="selectCate.htm", method=RequestMethod.POST)
	public void MovePage(String email, HttpServletResponse response,Model model) throws IOException {
		
		System.out.println("Homework controller_Teacher email: "+ email);
		
		List<HomeworkDTO> cateList = homeworkService.selectCate(email);
		//ArrayList<String> optionlist=null;
		
		
		JSONArray array = new JSONArray();
		for(int i=0;i<cateList.size();i++){
			JSONObject obj = new JSONObject();
			obj.put("cateTitle", cateList.get(i).getCateTitle());
			System.out.println(obj);
			//optionlist.add(cateList.get(i).getCateTitle());
			array.add(obj);
		}
		
		//model.addAttribute("optionlist", cateList);
		response.getWriter().println(array);
		//return "common/optionList";
		
	}
}