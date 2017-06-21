/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/

package com.class_ic.controller_category;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody void insert(@RequestParam("memo") String memo) {
		
		MemoVO vo = new MemoVO();
		vo.setEmail("b@gmail.com");
		vo.setMemoText(memo);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		int result = dao.insertMemo(vo);
		System.out.println("result: " +result);
		
	}
	
	@RequestMapping(value="selectMemo.htm", method= RequestMethod.GET)
	public @ResponseBody void select(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println(request.getParameter("email"));
		
		String email= request.getParameter("email");
		
		MemoVO vo = new MemoVO();
		vo.setEmail(email);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		List<MemoVO> memoList = dao.selectMemo(vo);
		
			response.getWriter().print(memoList);
		
	}


}
