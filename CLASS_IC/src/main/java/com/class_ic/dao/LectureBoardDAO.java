/*@Project : CLASS-IC
@File name : board_details_view.jsp
@Author : 김은영
@Data : 2017.06.21
@Desc :
 */
package com.class_ic.dao;


import java.util.ArrayList;

import com.class_ic.vo.LectureBoardDTO;

public interface LectureBoardDAO {
 
	

	  //게시판  리스트 조회 
	  //원래는 boardvo일것 
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
      
	  //링크 리스트 			//나중에 기수 세션으로 불러와 담아 
	  public ArrayList<LectureBoardDTO> linkList();
	  
	  //파일 리스트  			//나중에 기수 세션으로 불러와 담아  

	  public ArrayList<LectureBoardDTO> fileList();
   

      



}