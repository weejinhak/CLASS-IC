<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <c:forEach var="LectureBoardDTO" items="${bvo}">
                                <form method="get" action="/" class="form-horizontal">
                                    <div class="card-header card-header-text" data-background-color="rose">
                                        <i class="material-icons">assignment</i>
                                    </div>
                                    <div class="card-content">    
                                    <!--  여기서부터 포문 --> 

                                        <div class="row">
                                            <label class="col-sm-2 label-on-left">제목 : </label>
                                            <div class="col-sm-10">
<!--                                                 <div class="form-group label-floating is-empty"> -->
<!--                                                     <label class="control-label"></label> -->
                                                    <input type="text" class="form-control" value="${LectureBoardDTO.lectureTitle}" style="width: 90%" readonly="readonly">
                                                  
                                    <!--   <span class="material-input"></span></div> -->
                                            </div>
                                        </div>
                                        
                                    
                    
                                            <div class="row">
                                            <label class="col-sm-2 label-on-left">내용 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <textarea  cols="50" style="width: 90%; height: 300px; color: gray" readonly="readonly">${LectureBoardDTO.lectureContent}</textarea>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                          
                                               <br><br><br><br><br>         
                                       
                      <div class="col-sm-1">    </div>
                      <div class="col-sm-5">
                      
                        <!-- 파일 첨부  --> 
                                       첨부 파일 
                                       
                                    <ul class="mailbox-attachments clearfix">
                                    
                                         <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>

                  <div class="mailbox-attachment-info">  
                    <a href="#" class="mailbox-attachment-name">
                    <i class="fa fa-paperclip"></i> ${LectureBoardDTO.fileTitle} </a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                     
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name">
                    <i class="fa fa-paperclip"></i> Sep2014-report.pdf </a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                     
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon"><i class="fa fa-file-word-o"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> App Description.docx</a>
                        <span class="mailbox-attachment-size">
                          1,245 KB
                          
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon has-img"><img src=" " alt="Attachment"></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-camera"></i> photo1.png</a>
                        <span class="mailbox-attachment-size">
                          2.67 MB
                       
                        </span>
                  </div>
                </li>           
              </ul>
              </div>
                     <div class="col-sm-5">
                     <!-- 링크  첨부  --> 
                     
                     관련 링크 <br>
                                <ul class="mailbox-attachments clearfix">
                                <li>      링크 제목:${LectureBoardDTO.linkTitle} </li> 
                                <li>      링크 URL:<a href="${LectureBoardDTO.linkSrc}">${LectureBoardDTO.linkSrc}</a> </li><br>
                                   <li>      링크 제목: </li> 
                                <li>      링크 URL: </li><br>
                                   <li>      링크 제목: </li> 
                                <li>      링크 URL: </li><br>
               </ul>
                     </div>
                    <div class="col-sm-1"></div>
                     <!-- 링크 첨부 끝 --> 
              
                    </div>
                 
</form>
                
 </c:forEach>                      
                  <div class="col-md-12">                 
                                       
                                       <div class="td-actions text-center">
   
                                 <button type="button" rel="tooltip" class="btn btn-info btn-round"
                                    id="list" name="list" onclick="location.href='allboard.htm' ">
                                    <i class="material-icons">list</i>
                                 </button>
                                                       <%--  <a href="${pageContext.request.contextPath}/teacher/totalLectureBoard_Edit?lectureNo=${LectureBoardDTO.lectureNo}" id="lectureNo" name="lectureNo"> --%>
                                                       
                                                     
                                                        <button type="submit" rel="tooltip" class="btn btn-success btn-round" >
                                                            <i class="material-icons">edit</i>>
                                                        </button>
                                                          <input type="hidden" value="${LectureBoardDTO.lectureNo}">
                                                      
                                                      
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                        </div>
                                 
                                    </div>
                           
                            </div>
                 

      
      
      
      
      
      
      </div>
 </div>
 
 
 
 