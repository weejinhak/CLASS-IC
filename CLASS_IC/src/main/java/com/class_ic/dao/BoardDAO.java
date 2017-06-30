package com.class_ic.dao;

import java.util.ArrayList;
import java.util.List;

import com.class_ic.app.dto.MemberDTO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.ClassByLectureDTO;
import com.class_ic.vo.LectureBoardDTO;
import com.class_ic.vo.SubCategoryDTO;

public interface BoardDAO {  
	
	//통합 게시판 글입력
	int insertBoardContent(LectureBoardDTO lectureBoardDTO);
	
	//통합 게시판 카테고리 모두가져오기
	List<CategoryDTO> selectCategory();
	
	//통합 게시판 서브 카테고리 모두가져오기
	ArrayList<SubCategoryDTO> selectSubCategory();
	
	//자료 DB에 insert (파일 등록)
	public int insertFile(LectureBoardDTO lectureBoardDTO);
	
	//통합게시판과 파일 게시판을 잇는 테이블 insert
	public int insertLectureBoardFile(LectureBoardDTO lectureBoardDTO);
	
	//LectureBoard DAO 옮겨옴
	
	//통합게시판 카테고리,서브카테고리 select box 
    public  ArrayList<LectureBoardDTO> allBoard(String cateCode,String subcateCode) ;
    
    //모든 글을 긁어옴.
    public ArrayList<LectureBoardDTO> allList();

    //수정화면에 출력
    public ArrayList<LectureBoardDTO> totalboardEdit(int lectureNo);
    
    //수정 완료
    public int totalboardEditOk(LectureBoardDTO dto);

    //글  삭제      
    public void deleteLect(int lectureNo);

    
	  //글 상세보기 
	  public ArrayList<LectureBoardDTO> totalBoard_contentview(int lectureNo);
    
	  //기수 불러오기
	  ArrayList<MemberDTO> selectMember(String email);

	  //글 이동하기
	  public void boardMultiSend(ClassByLectureDTO dto);
	  
	  //ClassByLecture 데이터 모두 가져오기
	  
	  public ArrayList<ClassByLectureDTO> selectClassByLecture();
}
