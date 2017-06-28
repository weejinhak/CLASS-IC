package com.class_ic.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

/*
* @Project		:	CLASS-IC
* @Date		    :	2017.06.27
* @Author		:	노지영
*/

/*
* @Class: BoardListController 
* @Date: 2017.06. 27
* @Author: 노지영
* @Desc: 게시판의 게시글의 정보의 C.R.U.D 를 담당하는 컨트롤러.
*/


@Service
public class BoardListService {
	
	@Autowired
	private SqlSession sqlsession;
	

	public void boardContentSaveService(HttpServletRequest request, LectureBoardDTO lecture ) throws IOException{
		
	//파일 업로드 추가 부분 시작

		List<CommonsMultipartFile> files = lecture.getFiles();	
		List<String> filenames = new ArrayList<String>();//파일명만 추출	
		
		if(files != null && files.size() > 0){
			//업로드한 파일이 하나라도 있다면
			for(CommonsMultipartFile multifile : files){
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/customer/upload");
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
		}

	//파일 업로드 추가 부분 끝 
	System.out.println("boardContentSave 메소드 들어옴.");
    String title=(String)request.getParameter("title");
    String content=(String)request.getParameter("content");
    String cate=(String)request.getParameter("cate");
    String subcate=(String)request.getParameter("subcate");
    System.out.println(title+","+content+","+cate+","+subcate);
    
    LectureBoardDTO dto= new LectureBoardDTO();
    dto.setClassCode("kkj01331@naver.com");
    dto.setCateCode(cate);
    dto.setSubcateCode(subcate);
    dto.setLectureContent(content);
    dto.setLectureTitle(title);
    //파일 업로드 추가 부분
    dto.setFileSrc(filenames.get(0));
    dto.setFileSrc2(filenames.get(1));
    //파일 업로드 추가 부분
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
    
    board.insertBoardContent(dto);
    int file_insert = board.insertFile(dto);
    System.out.println("파일 입력 결과: "+file_insert);
    int file_board = board.insertLectureBoardFile(dto);
    System.out.println("통합게시판 파일 테이블 입력 결과: "+file_board);
    

	
	}
	

	public String selectCategoryService(Model model,HttpServletRequest request){
	System.out.println("selectCategory 메소드 들어옴.");
	
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
	List<CategoryDTO> totalcate= board.selectCategory();
	
	System.out.println(totalcate);
	
	model.addAttribute("listcategory",totalcate);
	
	
	String viewpage="common/boardCateList";
	
    /*	for(String value: totalcate){
	 System.out.println(value);
	}
	*/
	
	return viewpage;
    
	
	}
	

	public String selectSubCategoryService(Model model,HttpServletRequest request){
	System.out.println("selectsubcategory 메소드 들어옴.");
	
	String cate=request.getParameter("cate");
	System.out.println(cate);
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
	List<SubCategoryDTO> subcate= board.selectSubCategory();
	
	ArrayList<SubCategoryDTO> subcate2 = new ArrayList<SubCategoryDTO>();
	for(SubCategoryDTO value:subcate){
		if(value.getCateCode().equals(cate)){
			subcate2.add(value);
			System.out.println(value.getSubcateCode());
		}
	}
	
	model.addAttribute("subcategory",subcate2);
	String viewpage="common/boardSubCateList";
	

	return viewpage;
    
	
	}

}
