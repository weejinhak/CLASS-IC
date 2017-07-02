<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <!-- 
@Project : CLASS-IC
@File name : board_details_
@Author : 김은영
@Data : 2017.06.21
@Desc :
 --> 
 
 
 <div class="content">
 
       <div class="container-fluid">
      
      
<div class="col-md-12">
                            <div class="card">
                             <c:set var="LectureBoardDTO" value="${bvo}" />
                            
                                
                                    <div class="card-header card-header-text" data-background-color="rose">
                                        <h4 class="card-title">&nbsp; &nbsp;&nbsp;  카테고리&nbsp; &nbsp;&nbsp;   | 서브카테고리&nbsp; &nbsp;&nbsp;    </h4>
                                    
                                    </div>
                                          
                                    <div class="card-content">
                                        <div class="row">
                                     <label class="col-sm-2 label-on-left">제목 : </label>
                                     <div class="col-md-5">
                                        <div class="card">
                                            <div class="card-header">
                                             
                                            </div>
                                            <div class="card-content">
                                              ${LectureBoardDTO.lectureTitle}
                                             <!--  여기에 뿌려준다 -->
                                            </div>
                                        </div>
                                 </div>
                                 
                                   <label class="col-sm-1 label-on-left">등록일: </label>
                                   <div class="col-md-3">
                                  <div class="card">
                                   <div class="card-header"> 
                                   </div>
                                   <div class="card-content"> 
                                          
                                         
                                            ${LectureBoardDTO.lectureDate} 
                                    <!--여기에 뿌려준다   -->
                                   </div>
                               </div>
                        </div>
                        
            
                         <div class="col-sm-1"></div>
                         </div>
                                        
                                        
                         
                         
                          <!--  글 내용 -->         
                                            <div class="row">
                                            <label class="col-sm-2 label-on-left">내용 : </label>
                           <div class="col-sm-9">
                            <div class="card">
                                <div class="card-header">
                                   
                                </div>
                                <div class="card-content">
                                ${LectureBoardDTO.lectureContent}  
                                    <!--여기에 뿌려준다   -->
                                    
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-1"></div>
                                        </div>
                                        
                                        
                                        
                                          
                                               <br><br><br><br><br>     
                                                   
                                                 <div class="row">   
                                                    <div class="col-sm-1"></div>                   
          <div class="col-sm-1 label-on-left">첨부 파일</div>
         				
 						<%-- <c:set var="file" value="${bfile}" /> --%>
                        <!-- 파일 첨부  --> 
                                    <div class="col-md-3">
                                           <div class="card">
                                <div class="card-header">     </div> 
                                <div class="card-content">
                                
                                <!-- 여기 파일 뿌려준다  -->
                                <c:set var="file" value="${bfile}" />
                                    <ul class="mailbox-attachments clearfix">
                                    
                <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span> 
                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> ${file.fileSrc}</a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                        
                        </span>
                  </div>
                </li>
                <li>
                <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span> 
                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> ${file.fileSrc2}</a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                        
                        </span>
                  </div>
                </li>           
              </ul>

               </div>
              
              </div><!--card end  -->
             </div><!--col-md-5 end   -->
 
               <!-- 파일 첨부 끝 -->
               
                     <!-- 링크  첨부  --> 
                       <label class="col-sm-1 label-on-left">관련 링크 </label>  
                          <div class="col-md-4">
                       
                           <div class="card">
                                <div class="card-header">
                                   
                                </div> 
                                
                                    <div class="card-content">
                                    <c:forEach var="link" items="${blink }">
                         		<%-- 	<c:set var="link" value= /> --%>
                                    <!--여기에 뿌려준다   -->
                                <ul class="mailbox-attachments clearfix">
                      <%--           <li>      링크 제목:${link.linkTitle} </li> 
                                <li>      링크 URL: <a href="${link.linkSrc}">${link.linkSrc}</a> </li><br> --%>
                                   <li>      링크 제목: </li> 
                                <li>      링크 URL: </li><br />
                               
               </ul>
             							  </c:forEach>
                        </div>
                        
               </div>
                </div>
               <div class="col-sm-1"></div>
                     <!-- 링크 첨부 끝 -->
                     
                     
             </div>
             </div> 
              <!--  row 끝-->
     
                 
                     <div class="col-md-12">    
                   
                       </div>    
                           
                                       
                                       <div class="td-actions text-center">
                                                        <button type="button" rel="tooltip" class="btn btn-info btn-round" data-original-title="" title="">
                                                            <i class="material-icons">list</i>
                                                        </button>
                                                        <button type="button" rel="tooltip" class="btn btn-success btn-round" data-original-title="" title="">
                                                            <i class="material-icons">edit</i>
                                                        </button>
                                                        <button type="button" rel="tooltip" class="btn btn-danger btn-round" data-original-title="" title="">
                                                            <i class="material-icons">close</i>
                                                        </button>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                      
                                 
                                 
                                        </div>  <!-- 카드 끝 -->
                                    
                                    </div><!--12 end  -->
                           
                            </div> 
                 
                
      </div> 

 