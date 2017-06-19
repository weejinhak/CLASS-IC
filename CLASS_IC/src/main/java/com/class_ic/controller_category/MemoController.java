/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/

package com.class_ic.controller_category;

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
	
//insert
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody String insertMemo(@RequestParam(value="memo") String memo , HttpServletResponse response) {
		
		
		MemoVO vo = new MemoVO();
		vo.setEmail("a@gmail.com");
		vo.setMemoText(memo);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		int result = dao.insertMemo(vo);
		System.out.println("result: " +result);
		
		return "memo";
	}

}
