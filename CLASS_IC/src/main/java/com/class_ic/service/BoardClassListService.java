package com.class_ic.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.dao.BoardClassDAO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.MemberDTO;
import com.class_ic.vo.SubCategoryDTO;


/*
* @Project		:	CLASS-IC
* @Date		    :	2017.07.1
* @Author		:	노지영
*/

/*
* @Class: BoardListController 
* @Date: 2017.07. 1
* @Author: 노지영
* @Desc: 클래스별 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 서비스.
*/

@Service
public class BoardClassListService {

	@Autowired
	private SqlSession sqlsession;


	public ModelAndView boardContent(HttpServletRequest request,ModelAndView model){
		
		String cateCode=request.getParameter("cateCode");
		String subcateCode=request.getParameter("subcateCode");
		model.addObject("cateCode",cateCode);
		model.addObject("subcateCode",subcateCode);
		model.setViewName("teacher.board_content_class");
		return model;
		
	}
	// 카테고리 select 
	public ModelAndView selectCate(HttpServletRequest request, HttpServletResponse response) { // lectureNo

		ModelAndView m = new ModelAndView();
		// 올걸
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);

		String[] color={"rose","blue","green","orange","red"};
		int count=0;
		HttpSession session=request.getSession();
		String email = (String) session.getAttribute("email");
		ArrayList<SubCategoryDTO> catelist= bdao.selectCate(email);
	    ArrayList<LectureBoardDTO> boardlist=null;
		SubCategoryDTO dto=new SubCategoryDTO();
		
		dto.setEmail(email);
		
		for(SubCategoryDTO list:catelist){
			list.setColor(color[count%4]);
			count++;
			
			
			dto.setCateCode(list.getCateCode());
			boardlist=bdao.selectCateboard(dto);
			list.setBoardlist(boardlist);
			
		
		}

		m.addObject("catelist",catelist);
		m.setViewName("teacher.board");

		
		return m;
	}
	
	
	//게시글 insert(게시판 insert 수업담기 insert) 
	public void boardContentSaveService(HttpServletRequest request, LectureBoardDTO lecture) throws IOException {

/*		//파일 업로드 처리 추가
		List<CommonsMultipartFile> files = lecture.getFiles();	
		List<String> filenames = new ArrayList<String>();//파일명만 추출	
		
		if(files != null && files.size() > 0){
			//업로드한 파일이 하나라도 있다면
			for(CommonsMultipartFile multifile : files){
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/resources/upload");
				String fpath = path + "\\" + filename;
				System.out.println(filename + "/" + fpath);
				if(!filename.equals("")){
					//서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				}
				filenames.add(filename);// 실제 DB insert 할 파일명
			}
		}*/
		//파일 업로드 처리 끝

		System.out.println("boardContentSave 메소드 들어옴.");
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		String cate = (String) request.getParameter("cate");
		String subcate = (String) request.getParameter("subcate");
		String classCode = request.getParameter("classCode");
		System.out.println(title + "," + content + "," + cate + "," + subcate + "/" + classCode);
		HttpSession session=request.getSession();
		String classCode2 = (String) session.getAttribute("classCode");
		LectureBoardDTO dto = new LectureBoardDTO();
		ClassByLectureDTO dto2=new ClassByLectureDTO();

		dto2.setClassCode(classCode2);
		dto.setClassCode(classCode);
		dto.setCateCode(cate);
		dto.setSubcateCode(subcate);
		dto.setLectureContent(content);
		dto.setLectureTitle(title);
		// 파일 업로드 추가 부분
	/*	
		 dto.setFileSrc(filenames.get(0)); */
		// dto.setFileSrc2(filenames.get(1));
		 
		// 파일 업로드 추가 부분
		BoardDAO board = sqlsession.getMapper(BoardDAO.class);
		BoardClassDAO classboard=sqlsession.getMapper(BoardClassDAO.class);

		board.insertBoardContent(dto);

		  classboard.boardMultiSend(dto2);
			
		
/*		  int file_insert = board.insertFile(dto);		
		  System.out.println("파일 입력 결과: "+file_insert); */
		

	}

	
	//카테고리에서 상세보기 누르면 서브카테고리와 게시글 상세로 들어감
	public ModelAndView cateDetails(ModelAndView modal,HttpServletRequest request,HttpServletResponse response,String cateCode){ // lectureNo
		HttpSession session=request.getSession();
		String email = (String) session.getAttribute("email");
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);
		SubCategoryDTO dto=new SubCategoryDTO();
		dto.setCateCode(cateCode);
		dto.setEmail(email);
		
		ArrayList<SubCategoryDTO> sublist=bdao.selectSubcate(dto);
		
		System.out.println("퇀다퇀다2");
	    modal.setViewName("teacher.board_details");
	    modal.addObject("cateCode",cateCode);
	    modal.addObject("sublist",sublist);
	      
		
		return modal;
	}
	
	//카테고리 서브 카테고리에 알맞는 게시글을 모두 가져옴.
	public ModelAndView selectCateSubcateboard(ModelAndView modal,HttpServletRequest request,HttpServletResponse response,SubCategoryDTO dto){ // lectureNo
		HttpSession session=request.getSession();
		String email = (String) session.getAttribute("email");
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);
		SubCategoryDTO dto2=new SubCategoryDTO();
		dto2.setCateCode(dto.getCateCode());
		dto2.setEmail(email);
		dto2.setSubcateCode(dto.getSubcateCode());
		

		ArrayList<LectureBoardDTO> boardlist=bdao.selectCateSubcateboard(dto2);
		
		System.out.println("퇀다퇀다3");
	    modal.setViewName("common/classboardlist_data_table");
	    modal.addObject("boardlist",boardlist);
	    modal.addObject("cateCode",dto.getCateCode());
	    modal.addObject("subcateCode",dto.getSubcateCode());
	   
	      
		
		return modal;
	}
	
	
	// 수업 보드 내 action의 x버튼 누르기 삭제 
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		System.out.println("totalBoard_delete.htm 컨트롤러 탐 ");
		ClassByLectureDTO dto= new ClassByLectureDTO();
		int lectureNo = Integer.parseInt(request.getParameter("lectureNo"));
		dto.setlectureNo(lectureNo);
		dto.setClassCode(classCode);

		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);
		int result=bdao.deletx(dto);


		return "redirect:allboard.htm";
	}
	
	// 다중삭제
	public String multi_del(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		System.out.println("다중삭제 컨트롤러");
		HttpSession session=request.getSession();
		String classCode = (String) session.getAttribute("classCode");
		String test = request.getParameter("data");
		ClassByLectureDTO dto= new ClassByLectureDTO();
		BoardClassDAO bdao = sqlsession.getMapper(BoardClassDAO.class);
		dto.setClassCode(classCode);
		

		
		String[] array = test.split(",");

		for (int i = 0; i < array.length; i++) {
			dto.setlectureNo(Integer.parseInt(array[i]));
			// 삭제로 바꿈
			bdao.deletx(dto);

		}
		
	
		return "redirect:allboard.htm";

	}
}
