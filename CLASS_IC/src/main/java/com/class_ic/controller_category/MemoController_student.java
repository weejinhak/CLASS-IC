/*@Project : CLASS-IC
@File name : MemoController_student.java
@Author : 최은혜
@Date : 2017.06.15
*/

package com.class_ic.controller_category;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.class_ic.service_category.MemoService;
import com.class_ic.vo.MemoVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
* @Class: MemoController_student
* @Date: 2017.06. 15
* @Author: 최은혜
* @Desc: 메모 작성시 동작하는 Controller(학생)
*/

@Controller
@RequestMapping("student")
public class MemoController_student {
   
   @Autowired
   private MemoService memoService;
   
   //글 등록 : 2017.06.21 최은혜
   @RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
   public @ResponseBody String insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
         
          String email=request.getParameter("email");
          String checkListItem=request.getParameter("checkListItem");
      
      memoService.insertMemo_Student(email, checkListItem);
      
      return "redirect:memo.memo";
   }
   
   //memo.jsp 글 출력 : 2017.06.21 최은혜
   @RequestMapping(value="selectMemo.htm", method= RequestMethod.POST)
      public void select(HttpServletRequest request, HttpServletResponse response) throws IOException {
         
         String email= request.getParameter("email");
      
         List<MemoVO> memoList = memoService.selectMemo_student(email);
          JSONArray array = new JSONArray();

          for(int i=0;i<memoList.size();i++){
             JSONObject obj= new JSONObject();
             obj.put("memotext",memoList.get(i).getMemoText());
             obj.put("memono", memoList.get(i).getMemoNo());
             array.add(obj);
          }
         response.getWriter().println(array);      
      }
   
   //memo.jsp 글 출력 : 2017.06.21 최은혜
   @RequestMapping(value="selectMemo2.htm", method= RequestMethod.GET)
      public ModelAndView select2(HttpServletRequest request, HttpServletResponse response) throws IOException {
         ModelAndView view= new ModelAndView();
         view.setViewName("memo.memo");
         String email= request.getParameter("email");
       
         List<MemoVO> memoList = memoService.selectMemo_student(email);
          JSONArray array = new JSONArray();

          for(int i=0;i<memoList.size();i++){
             JSONObject obj= new JSONObject();
             obj.put("memotext",memoList.get(i).getMemoText());
             obj.put("memono", memoList.get(i).getMemoNo());
             array.add(obj);
          }
         response.getWriter().println(array);
      return view;      
      }
   
   
   //글 삭제 : 2017.06.21 최은혜
   @RequestMapping(value="deleteMemo.htm", method=RequestMethod.POST)
   public @ResponseBody String delete(@RequestParam(value="email") String email, @RequestParam(value="memoNo") int memoNo) {
   
      memoService.deleteMemo_Student(email, memoNo);
      
      return "redirect:memo.memo";
      
   }


}