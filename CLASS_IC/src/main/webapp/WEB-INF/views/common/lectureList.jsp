<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
			$('.gotomain').click(function(){

				  console.log("페이지 이동");
				  var classcode = $('#classCodehidden').val();
					var index = $("input[name^='classCodehide']").index(this);
					var classCodehide =$("input[name^='classCodehide']:eq("+index+")").val(); 
				  console.log(sessionId);
					$.ajax({
						  type : "POST",
						  url : "main.htm",
						  data: {
						      classCode: classCodehide
						  },
						  success : function(data){
								alert('성공');
								location.href="";

						  },
						  error:function(request, status, error){
				              
				                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
				               
				          }
					});
			});
	
	});
</script>

              <c:forEach items="${lecturelist}" var="n">
						<div class="col-md-4">
										<div class="card card-chart" data-count="3">
										
												<div class="card-header" data-background-color="blue"
													data-header-animation="true" >
													<div align="center">
													<h3 class="card-title" >
														<br>${n.classCode}
													</h3></div>
												</div>
												
												<div class="card-content">
														<div class="card-actions">
															<!-- <form action="teacher/main.htm" method="POST"> -->
															<input type="hidden" value="${n.classCode }" name="classCode" id="classCodehide_${var.index}"/>
															<button type="button" class="btn btn-info btn-simple"
																rel="tooltip" data-placement="bottom" title=""
																data-original-title="go!" name="gotomain">
																<i class="material-icons">input</i>													
															</button>
														<!-- </form> -->
														</div>											
															<br>
														<p class="category">
															${n.classTitle}
														</p>
												</div>
												
												<div class="card-footer">
													<div class="stats">
														<i class="material-icons">access_time</i> campaign sent 2 days ago
													</div>
												</div>
										</div>
					</div>
            </c:forEach>

