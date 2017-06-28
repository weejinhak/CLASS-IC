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
			 
	   public  ArrayList<LectureBoardDTO> allBoard(String subcateCode) ;
 
	   //글 상세보기 
 		public ArrayList<LectureBoardDTO> totalBoard_contentview(int lectureNo);
 
		//글  삭제      
	   public void deleteLect(int lectureNo);


	   
 
	   
	

	   



}
