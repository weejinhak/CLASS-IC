<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link href="${pageContext.request.contextPath}/resources/assets/css/board_content.css" rel="stylesheet" />
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
         <c:forEach var="list" items="${list}">
            <div class="card-header card-header-text"
               data-background-color="rose">
               <h4 class="card-title">&nbsp; &nbsp;&nbsp;${list.cateCode} </h4>

            </div>

            <div class="card-content ">
               <div id="face">
                  <div class="singlepage old-singlepage">
                     <div class="entry-wrap">
                        <div class="entry">
                           <div id="single-title-wrap">
                              <div id="single-title-block">
                                 <h1 class="new-single-title">${list.assignTitle}</h1>
                                 <div class="single-meta-wrap">
                                    <div class="single-meta-line"></div>
                                    <div class="single-meta">
                                       <span class="sm-dot">·</span> <a>작성일자: ${list.assignDate}</a><span class="sm-dot">·</span> 
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="single-top-ads">
                              <!-- BuySellAds.com Zone Code -->
                              <div id="bsap_672" class="bsap" data-serve="CA7DP">

                                 <article class="entry-content alert alert" style="width: 690px; height: 400px;">
                                    <p class="single-first-p">${list.assignContent}</p>
                                    <p class="fixed-empty-p">&nbsp;</p>

                                 </article>
                                 <!-- enty-content -->
                              </div>
                              <!-- entry -->
                              
                           </div>
                           <!-- entry-wrap -->
                              
                        </div>
                        
                     </div>
                     
                  </div>
      
               </div>
               <!--  row 끝-->
            </div>
            <!-- 카드 끝 -->
			</c:forEach>
         </div>
         <!--12 end  -->
	
      </div>


   </div> </div>
<script type="text/javascript">

</script>
 