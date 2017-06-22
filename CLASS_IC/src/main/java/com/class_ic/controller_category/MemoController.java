/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/

package com.class_ic.controller_category;

<<<<<<< HEAD
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
=======
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
<<<<<<< HEAD
import org.springframework.web.servlet.ModelAndView;
=======
<<<<<<< HEAD
<<<<<<< HEAD
=======
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
>>>>>>> refs/remotes/origin/eh
=======
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC

import com.class_ic.dao.MemoDAO;
import com.class_ic.vo.MemoVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("student")
public class MemoController {
	
@Autowired
private SqlSession sqlsession;
	
<<<<<<< HEAD
	
	//글 등록 : 2017.06.21 최은혜
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
	      
	       String email=request.getParameter("email");
	       String checkListItem=request.getParameter("checkListItem");
=======
<<<<<<< HEAD
<<<<<<< HEAD
//insert
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody void insertMemo(@RequestParam(value="memo") String memo) {
=======
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody String insert(@RequestParam(value="memo") String memo , HttpServletResponse response) {
>>>>>>> refs/remotes/origin/eh
=======
	@RequestMapping(value="insertMemo.htm", method=RequestMethod.POST)
	public @ResponseBody String insert(@RequestParam(value="memo") String memo , HttpServletResponse response) {
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
		
		MemoVO vo = new MemoVO();
		vo.setEmail("a@gmail.com");
		vo.setMemoText(memo);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		int result = dao.insertMemo(vo);
		System.out.println("result: " +result);
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
		
<<<<<<< HEAD
		MemoVO vo = new MemoVO();
		vo.setEmail(email);
		vo.setMemoText(checkListItem);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		
		int result = dao.insertMemo(vo);
		System.out.println("insert result: " +result);
		
		
=======
<<<<<<< HEAD
<<<<<<< HEAD
=======
		List<MemoVO> memoList = dao.selectMemo(vo);
		for(int i=0;i<memoList.size();i++){
			memoList.get(i);
		}
		
		return "memo";
>>>>>>> refs/remotes/origin/eh
=======
		List<MemoVO> memoList = dao.selectMemo(vo);
		for(int i=0;i<memoList.size();i++){
			memoList.get(i);
		}
		
		return "memo";
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
	}
	
<<<<<<< HEAD
	//memo.jsp 글 출력 : 2017.06.21 최은혜
	@RequestMapping(value="selectMemo.htm", method= RequestMethod.POST)
	   public void select(HttpServletRequest request, HttpServletResponse response) throws IOException {
	      
	      String email= request.getParameter("email");
	      System.out.println("controller :" +email);
	      
	      MemoVO vo = new MemoVO();
	      vo.setEmail(email);
	      
	      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
	      List<MemoVO> memoList = dao.selectMemo(vo);
	   
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
	      System.out.println("controller :" +email);
	      
	      MemoVO vo = new MemoVO();
	      vo.setEmail(email);
	      
	      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
	      List<MemoVO> memoList = dao.selectMemo(vo);
	   
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
	
	//단일 글 출력
	@RequestMapping(value="oneText.htm", method= RequestMethod.POST)
	   public void oneText(HttpServletRequest request, HttpServletResponse response) throws IOException {
	      
	      String email= request.getParameter("email");
	      String memo = request.getParameter("memoNo");
	      int memoNo = Integer.parseInt(memo);
	      
	      System.out.println("단일 select controller :" +email);
	      
	      MemoVO vo = new MemoVO();
	      vo.setEmail(email);
	      vo.setMemoNo(memoNo);
	      
	      MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
	      MemoVO oneMemo = dao.oneText(vo);
	       
	          JSONObject obj= new JSONObject();
	          obj.put("memotext",oneMemo.getMemoText());
	          obj.put("memono", oneMemo.getMemoNo());
	          
	      response.getWriter().println(obj);      
	   }
	
	
	//글 삭제 : 2017.06.21 최은혜
	@RequestMapping(value="deleteMemo.htm", method=RequestMethod.POST)
	public @ResponseBody void delete(@RequestParam(value="email") String email, @RequestParam(value="memoNo") int memoNo) {
	
		System.out.println("delete email: "+email);
		System.out.println("delete memoNo: "+memoNo);
		
		MemoVO vo = new MemoVO();
		vo.setEmail(email);
		vo.setMemoNo(memoNo);
		
		MemoDAO dao = sqlsession.getMapper(MemoDAO.class);
		int result = dao.deleteMemo(vo);
		System.out.println("delete result: " +result);
		
		
	}

=======
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
	
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC

}













