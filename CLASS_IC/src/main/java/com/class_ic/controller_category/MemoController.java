/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/

package com.class_ic.controller_category;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class_ic.dao.MemoDAO;
import com.class_ic.vo.MemoVO;

@Controller
@RequestMapping("student")
public class MemoController {
	
@Autowired
private SqlSession sqlsession;
	
//insert
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody void insertMemo(@RequestParam(value="memo") String memo) {
		
		MemoVO vo = new MemoVO();
		vo.setEmail("a@gmail.com");
		vo.setMemoText(memo);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		int result = dao.insertMemo(vo);
		System.out.println("result: " +result);
		
	}
	
	//select
		@RequestMapping(value="selectMemo.htm", method=RequestMethod.POST)
		public @ResponseBody List<MemoVO> select(@RequestParam(value="email") String email, HttpSession session) {
			
			//session.setAttribute("email", "a@gmail.com");
			
			//String email =(String) session.getAttribute("email");
			
			MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
			List<MemoVO> memoList = dao.selectMemo(email);
			
			session.setAttribute("memoList", memoList);
			
			
			return memoList;
		}
		
		
		//delete
		@RequestMapping(value="deleteMemo.htm", method=RequestMethod.POST)
		public @ResponseBody void select(@RequestParam("memoNo") int memoNo, HttpSession session) {
			
			//String email =(String) session.getAttribute("email");
			
			MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
			
			MemoVO vo = new MemoVO();
			vo.setMemoNo(memoNo);
			vo.setEmail("a@gmail.com");
			
			int result = dao.deleteMemo(vo);
			
			//return "memo";
		}
	

}
