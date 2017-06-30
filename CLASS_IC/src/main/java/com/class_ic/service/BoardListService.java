package com.class_ic.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.class_ic.app.dto.MemberDTO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.dao.BoardDAO;
import com.class_ic.vo.CategoryDTO;
import com.class_ic.vo.ClassByLectureDTO;
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
/*
		List<CommonsMultipartFile> files = lecture.getFiles();	
		List<String> filenames = new ArrayList<String>();//파일명만 추출	
		
		if(files != null && files.size() > 0){
			//업로드한 파일이 하나라도 있다면
			for(CommonsMultipartFile multifile : files){
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("${pageContext.request.contextPath}/resources/upload");
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

	//파일 업로드 추가 부분 끝 

	System.out.println("boardContentSave 메소드 들어옴.");
    String title=(String)request.getParameter("title");
    String content=(String)request.getParameter("content");
    String cate=(String)request.getParameter("cate");
    String subcate=(String)request.getParameter("subcate");
    String classCode= request.getParameter("classCode");
    System.out.println(title+","+content+","+cate+","+subcate+"/"+classCode);
    
    LectureBoardDTO dto= new LectureBoardDTO();
    dto.setClassCode(classCode);
    dto.setCateCode(cate);
    dto.setSubcateCode(subcate);
    dto.setLectureContent(content);
    dto.setLectureTitle(title);
    //파일 업로드 추가 부분
    /*dto.setFileSrc(filenames.get(0));
    dto.setFileSrc2(filenames.get(1));*/
    //파일 업로드 추가 부분
    BoardDAO board=sqlsession.getMapper(BoardDAO.class);
    
    board.insertBoardContent(dto);
    
    /* int file_insert = board.insertFile(dto);
   System.out.println("파일 입력 결과: "+file_insert);
    int file_board = board.insertLectureBoardFile(dto);
    System.out.println("통합게시판 파일 테이블 입력 결과: "+file_board);*/
    

	
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
	
	public String selectMember(Model model,HttpServletRequest request,HttpSession session){

			BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
			
			String email=(String)session.getAttribute("email");
			
			ArrayList<MemberDTO> memberlist = dao.selectMember(email);
			
			System.out.println("memberlist뜨냐?"+memberlist);
			System.out.println("이메일이다~  " + email);
			
			model.addAttribute("memberlist",memberlist);
			
			String viewpage = "common/boardMemberList";
	
		return viewpage;
		
	}
	
	public String boardMultiSend(String lectureNo,String classCode){
			
		System.out.println("기수로 보내기 서비스 탄다.");

		
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
			
		String[] array = lectureNo.split(",");
	    ClassByLectureDTO dto=new ClassByLectureDTO();
		dto.setClassCode(classCode);
		
		ArrayList<ClassByLectureDTO> list=dao.selectClassByLecture();
		
		boolean exist=false;
	     for(int i=0;i<array.length;i++){
	    	 
	    	 for(ClassByLectureDTO all:list){
	    		 if(all.getlectureNo()==Integer.parseInt(array[i])){
	    			 
	    			 System.out.println(array[i]+"있음");
	    			 exist=true;
	    			 
	    		 }
	    	 }
	    	 if(exist){
	    	 break;
	    	 }
	    	 
	    			 System.out.println(array[i]);
	                 dto.setlectureNo(Integer.parseInt(array[i]));
	                 dao.boardMultiSend(dto);
	    		
	    	 }
            
	     

	     
	String viewpage = "teacher.totalLectureBoard";
	return viewpage;
	
}
	
	//여기서 부터 합침
	//통합게시판 리스트 출력
	 public ModelAndView allBoard(LectureBoardDTO bvo, HttpServletRequest request){
		 
		 BoardDAO  bdao = sqlsession.getMapper(BoardDAO.class);
         
         ArrayList<LectureBoardDTO> blist = bdao.allList();
         
         // 리턴 셋팅
         ModelAndView m = new ModelAndView();
         m.setViewName("teacher.totalLectureBoard");
         m.addObject("bvo", blist);  
         
         return m;
	 }
	
	  
	//통합게시판 카테고리,서브카테고리 select box 
	  public ModelAndView totalBoard(LectureBoardDTO bvo, HttpServletRequest request){ 
		  
		  BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);
	         
	         String cateCode = request.getParameter("cateCode");
	         String subcateCode = request.getParameter("subcateCode");
	         
	         ArrayList<LectureBoardDTO> blist = bdao.allBoard(cateCode,subcateCode); 
 
	         // 리턴 셋팅
	         ModelAndView m = new ModelAndView();
	         m.setViewName("common/totalboardlist");
	         m.addObject("bvo", blist);  
	         
	         return m;
	  }
	  
	  //통합게시판 수정화면 처리
	   public ModelAndView totalboardEdit(LectureBoardDTO dto,HttpServletRequest request,int lectureNo){

		   BoardDAO bdao = sqlsession.getMapper(BoardDAO.class);
		  
		   int lectureNo1 = lectureNo;
		   System.out.println("lectureNo 나오냐" + lectureNo);
		   
		   ArrayList<LectureBoardDTO> list = bdao.totalboardEdit(lectureNo1);
		   System.out.println(list.size());
		   
		   ModelAndView m = new ModelAndView();
		   m.setViewName("teacher.totalLectureBoard_Edit");
		   m.addObject("list", list);
		    System.out.println("모델단"+m);
		  
		   return m;
	   }
	   
	   //통합게시판 수정된 데이터 DB저장
	    public String totalboardEditOk(LectureBoardDTO dto){
	 	   System.out.println("수정오케이컨트롤러11"+dto);
		   
		   BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		   dao.totalboardEditOk(dto);
		                 
		  return "redirect:allboard.htm";
	    }
	   
	    //다중삭제
	    public String multi_del(HttpServletRequest request, HttpServletResponse response ) {
	    	  System.out.println("다중삭제 컨트롤러");

	          String test=request.getParameter("data");
	     
	          BoardDAO bdao = sqlsession.getMapper(BoardDAO.class); 
	          
	             String[] array = test.split(",");

	             for(int i=0;i<array.length;i++){
	                
	                //삭제로 바꿈    
	                bdao.deleteLect(Integer.parseInt(array[i]));
	                
	             }
	            return "redirect:allboard.htm";
	            
	   		}
	    
	    //하나 씩 삭제
         public String delete(HttpServletRequest request, HttpServletResponse response){ 
             System.out.println("totalBoard_delete.htm 컨트롤러 탐 ");
             int lectureNo = Integer.parseInt( request.getParameter("lectureNo"));
             
             
             BoardDAO bdao = sqlsession.getMapper(BoardDAO.class); 
             
             bdao.deleteLect(lectureNo) ;
  
             return "redirect:allboard.htm";
         }
            
	    	 
	   //게시판 글 상세보기
         public ModelAndView boardContentDetail(HttpServletRequest request, HttpServletResponse response,LectureBoardDTO bvo ){  //lectureNo 올걸 
             
             BoardDAO bdao = sqlsession.getMapper(BoardDAO.class); 
             
             int lectureNo = Integer.parseInt( request.getParameter("lectureNo"));
               System.out.println("lectno" +lectureNo);
             ArrayList<LectureBoardDTO> blist = bdao.totalBoard_contentview(lectureNo); 
             System.out.println("은영 상세"+blist);
             // 리턴 셋팅
             ModelAndView m = new ModelAndView();
             m.setViewName("teacher.board_content_view");
             m.addObject("bvo", blist);  
             
             return m;
          }
}
