/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/

package com.class_ic.controller_category;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class_ic.dao.MemoDAO;
import com.class_ic.vo.MemoVO;

@Controller
public class MemoController {
	
private SqlSession sqlsession;
	
	@RequestMapping(value="sendMemo.htm", method=RequestMethod.POST)
	public String insert(MemoVO vo) {
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		int result = dao.insertMemo(vo);
		
		return "memo.memo";
	}

}
