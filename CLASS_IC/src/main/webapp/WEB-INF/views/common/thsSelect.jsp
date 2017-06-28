<!--
	@Project : CLASS-IC
	@File Name : thsSelect.jsp
	@Author : 이현정
	@Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC ""src/main/webapp/WEB-INF/views/common/thsSelect.jsp"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Material Dashboard Pro by Creative Tim</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' dname='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- common header -->
<jsp:include page="inc/common_header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

	/* 페이지 로드시 QR 코드 가져옴. */
	$(document).ready(function() {
   			console.log("페이지가 시작1");
   			var url ="createCode.htm";			 
			$("#img").attr("src", url + "?content=" + 151); 	
	});
	
	/* 페이지 로드시 Session- email에 맞는 기수를 가져오고 그 수만큼 반복.   */
	$(document).ready(function() {
		  console.log("페이지가 시작2");
		  var sessionId="<%=(String)session.getAttribute("email")%>";
		  console.log(sessionId);
			$.ajax({
				  type : "POST",
				  url : "common/lecturecodeSelect.htm",
				  dataType : "html",
				  data: {
				      email: sessionId
				  },
				  success : function(data){
						$('#lecturelist').html(data);
						alert('성공');
				  },
				  error:function(request, status, error){
		              
		                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
		               
		          }
			});
	});
</script>

</head>

<body>
    <div class="wrapper wrapper-full-page">    
			   <div class="full-page login-page" filter-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/login.jpeg">
					            <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->           
				  <div class="content">
						<div class="col-xs-3"></div>
						<div class="col-xs-6">
							  <button class="btn btn-success" data-toggle="modal" data-target="#noticeModal">
						         <span class="btn-label"><i class="material-icons">check</i>새로운 기수 만들기
	                          </button>
							<div class="row">					

								<div class="col-md-4">
									<div class="card card-chart" data-count="4">
										<div class="card-header" data-background-color="red" data-header-animation="true">
											<div align="center">
											<h3 class="card-title" >
												<br>통합 관리
												<br>페이지
											</h3></div>
										</div>
										<div class="card-content">
											<div class="card-actions">
												<button type="button" class="btn btn-info btn-simple" rel="tooltip" data-placement="bottom" title="" data-original-title="go!">
													<i class="material-icons">input</i>
												</button>
											</div>					
								            <br>					
											<p class="category">통합 관리 페이지로 이동.</p>
										</div>
										<div class="card-footer">
											<div class="stats">
												<i class="material-icons">access_time</i> campaign sent 2 days ago
											</div>
										</div>
									</div>
								</div>
								
								<div id="lecturelist"></div>
								
								
							</div>
							
							
					
					
						</div>
						<div class="col-xs-3"></div>
					
					</div>
			</div>
</div>

         	<!-- 모달  -->
	<div class="row">
		<div class="col-md-12 text-center">
			<!-- notice modal -->
			
					<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-notice">
						
						<form action="lecturecodeadd.htm" method="post">
							<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											<i class="material-icons">clear</i>
										</button>
										<h5 class="modal-title" id="myModalLabel">과정 추가</h5>
									</div>
									
											<div class="modal-body">
												<div class="instruction">
													<div class="row">
														<div class="col-md-12"> 															
															<div class="form-group">
						                                        <label class="label-control">과정 시작일</label>
						                                        <input type="text" class="form-control datepicker"  id="classstart" name="classstart">
						                                    	<span class="material-input"></span>
						                                    </div>
														</div>													 
													</div>
													<div class="row">
														<div class="col-md-12"> 															
															<div class="form-group">
						                                        <label class="label-control">과정 최종일</label>
						                                        <input type="text" class="form-control datepicker" id="classend" name="classend">
						                                        <span class="material-input"></span>
					                                        </div>														
														</div>													 
													</div>		
													
														<div class="row">
														<div class="col-md-12"> 															
															<div class="form-group">
						                                        <label class="label-control">과정 이름</label>
						                                        <input type="text" class="form-control" id="classtitle" name="classtitle">
						                                        <span class="material-input"></span>
					                                        </div>														
														</div>													 
													</div>	
																								
										
													
													<div class="row">
														<div class="col-md-12">				
															  <div class="form-group">
							                                   	     <label class="label-control">Time Picker(시작시간)</label>
							                                        <input type="text" class="form-control timepicker"  id="classopentime" name="classopentime">
							                                    	<span class="material-input"></span>
							                                   </div>
														</div>
													</div>
		
				
													<div class="row">
														<div class="col-md-12">				
															  <div class="form-group">
							                                   	     <label class="label-control">Time Picker(끝나는 시간)</label>
							                                        <input type="text" class="form-control timepicker"  id="classclosetime" name="classclosetime">
							                                    	<span class="material-input"></span>
							                                   </div>
														</div>
													</div>
															
													<div class="row">
														<div class="col-md-12">				
															  <div class="form-group">
							                                   	     <label class="label-control">초대 코드</label>
							                                        <input type="text" class="form-control" id="classinvitecode" name="classinvitecode">
							                                    	<span class="material-input"></span>
							                                   </div>
														</div>
													</div>
													
														<div class="row">
														<div class="col-md-12">				
															  <div class="form-group">
							                                   	     <label class="label-control">이메일</label>
							                                        <input type="text" class="form-control" id="email" name="email">
							                                    	<span class="material-input"></span>
							                                   </div>
														</div>
													</div>
													
														<div class="row">
														<div class="col-md-12">				
															  <div class="form-group">
							                                   	     <label class="label-control">classcode</label>
							                                        <input type="text" class="form-control" id="classcode" name="classcode">
							                                    	<span class="material-input"></span>
							                                   </div>
														</div>
													</div>
												</div>												 
											</div>
								<div class="modal-footer text-center">
									<button type="button" class="btn btn-simple" data-dismiss="modal">Never
										mind</button>
									<button type="submit" class="btn btn-success btn-simple">Yes</button>
								</div>
								
							</div>
							</form>
					 </div>
				</div>
		
			<!-- end notice modal -->
          </div>
       </div>
</body>
<!-- common footer -->
<jsp:include page="inc/common_footer.jsp"></jsp:include>

<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();
        demo.initFormExtendedDatetimepickers();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
</html>