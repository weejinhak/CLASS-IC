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
       
       
      	 <!-- 내용물  contents  -->
      
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h2 class="title text-center"><b>Spring</b></h2>
			<br>
	 
                                
                                
			<div class="nav-left">
				<ul class="nav nav-pills nav-pills-warning nav-pills-icons"
					role="tablist">
					
					<!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
                    
                    
                    <!-- 여기두 섭카테에 따라서.. 바뀌게..포문  -->
					<li class="active"><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> 
						<i class="material-icons">reorder</i> 
						자바
					</a></li>
	<!-- 				<li class=""><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false"> 
							<i class="material-icons">reorder</i> MyBatis(ibatis)
					</a></li> -->
			 
					<li class=""><a href="#description-2" role="tab"
						data-toggle="tab" aria-expanded="false">
						 <!--  <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white"
								data-toggle="modal" data-target="#noticeModal">+</button>
					  <i></i> ADD
					</a>
		       
					</li>
				</ul>
			</div>

			<!-- tab-content -->
			<div class="tab-content">
				<div class="tab-pane active" id="description-1">
					<div class="card">
						<!--  표-->
						<div class="card-content table-responsive">
						
					 
							 <table class="table">
                                            <thead>
                                                <tr>
                                                 
                                                    <th>글 번호 </th>
                                                    <th>글 제목 </th>
                                                    
                                                    <th>작성날짜</th>
                                                    <th class="text-center">Actions</th>
                                                    <th>오늘 수업 담기</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            
                                            <!-- 여기부터 포문  -->
                                            			<c:forEach var="TodayLectureVO" items="${bvo}">
                                            
                                                <tr>
                                              
                                                    <td>${TodayLectureVO.lectureNo} </td>
                                                    <td>${TodayLectureVO.lectureTitle} </td>
                                                    
                                                    <td>${TodayLectureVO.lectureDate} </td>
                                                    <td class="td-actions text-center">
                                                  
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">mode_edit</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                    <td>
                                                    
                                                   
                                                         <div class="checkbox" id="">
		                                                    <label>
<!-- 		                                                    optionsCheckboxes -->
		                                                    <input type="checkbox" name="multy[]" value ="${TodayLectureVO.lectureNo}">
		                                                    <span class="checkbox-material">
		                                                    </span>  
		                                                    </label>
		                                                     
                                               			</div>
                                               			
                                               			
                                               			
                                               			
                                               			
                                               			
                                               			</td>
                                                </tr>
                                                
                                               </c:forEach>
                                                 <tr>
										         <td colspan="5">
										         <!-- 표끝 -->
						
							                     			
							<button type="button" id="submitFrm" class="btn btn-info btn-round" style="margin-left:50px" onclick="multi_storage()">수업 담기</button>
					                  			
					                  			<a href="todayLectureList.htm">
							<button type="button" id="submitFrm" class="btn btn-info btn-round" style="margin-left:50px">담은 수업 보기</button>
												</a>
                                           
										         
										      
										         </td>
										   		  </tr>
                                               
                                            </tbody>
                                        </table>
                                        
                                        
                                        
                                        
                     
                                        
						</div>

						<center>
							<ul class="pagination pagination-info">
								<li><a href="javascript:void(0);"> prev</a></li>
								<li><a href="javascript:void(0);">1</a></li>
								<li><a href="javascript:void(0);">2</a></li>
								<li class="active"><a href="javascript:void(0);">3</a></li>
								<li><a href="javascript:void(0);">4</a></li>
								<li><a href="javascript:void(0);">5</a></li>
								<li><a href="javascript:void(0);">next </a></li>
							</ul>
						</center>
					
					
					
					
						</div>
				</div>

				<!-- 탭2 -->
				<!--              <div class="tab-pane" id="description-2">
                                    <div class="card">
                                              
                                    </div>
                                </div> -->


			</div>

			<!--  tab content end-->


		</div>
	</div>

	<!-- 모달  -->
	<div class="row">
		<div class="col-md-12 text-center">


			<!-- notice modal -->
			<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">수업보드 세부 카테고리 추가</h5>
						</div>
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
										
									<input type="text" class="form-control" placeholder="카테고리 이름">
									</div>
								 
								</div>
								
							
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">Never
								mind</button>
							<button type="button" class="btn btn-success btn-simple">Yes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end notice modal -->


		</div>
	</div>
	</div>

 </div>
 
 <script type="text/javascript"> 
 



 // 멀티컨텐츠 선택받기
 function multi_storage()
 {

 	var cnt2 = $("input[name='multy[]']:checked").length;

 	if(cnt2 < 1){
 		alert(" 게시물을 선택하여 주세요");
 		return;
 	}
 	
 	var chk = document.getElementsByName("multy[]");
 	var len = chk.length;    //체크박스의 전체 개수 
//  	var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수 
 	var checkCnt = 0;        //체크된 체크박스의 개수 
 	var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수  
 	var cnt = 0;    
 	var rowid = new Array();   //체크된 체크박스의 모든 value 값을 담는다 

 	for(var i=0; i<len; i++){

 		if(chk[i].checked == true){ 
 		checkCnt++;        //체크된 체크박스의 개수 
 		checkLast = i;     //체크된 체크박스의 인덱스 
 		} 
 		}  
 	  
    var count=0;
	for(var i=0; i<len; i++){ 
	if(chk[i].checked == true){  //체크가 되어있는 값 구분  
    rowid.push(chk[i].value); 
	count++;
	}

	}
	
	var data="";
  	for(var i=0;i<count;i++){
  		if(i==count-1){
	     data+= rowid[i];
	    
  		}else{
  			
  		   data+= rowid[i]+",";
  	  
  		}	
  		
  		
  	
  	}
    alert(data);


 		alert(rowid);    //'value1', 'value2', 'value3' 의 형태로 출력된다.
 		//ajax 로  보낼데이터를 배열형태로 허용해준당 
 		jQuery.ajaxSettings.traditional = true;

 		 $.ajax({
 	        type: 'POST',
 	        url: 'multi_storage.htm',
 	        data: { data: data } ,
 	        dataType: 'text',
      
 	        success: alert('good'),
 	        error: alert('not good')
 	    });
 
 
 

 }
 
 
</script> 
 
 
 
 