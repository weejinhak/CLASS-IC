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
      public  ArrayList<LectureBoardDTO> allBoard(String subcateCode) ;
 
 
      
      
      
   

      



}