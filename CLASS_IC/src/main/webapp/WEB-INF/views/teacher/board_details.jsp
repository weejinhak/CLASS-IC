<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<script type="text/javascript">

$().ready(function() {

  	 $('.clicksub').click(function click() {

  		 var subcateCode=$(this).attr("id");
  		var cateCode=$('#refercate').text();
  		
  		 $.ajax({
	           type: 'GET',
	           url: 'selectcatesubcateboard.htm',
	           data: {cateCode:cateCode,subcateCode:subcateCode} ,
	           dataType: 'text',
	           success: function(data) {
	             $('#selectdatatable').html(data);
	           },
	           error: function() {
	              alert('bad');
	            
	           } 

	       });

	});
  	 

   });

</script>
<br>
<br>
<br>

	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h2 class="title text-center"><b id="refercate">${cateCode}</b></h2>
			<br>
	 
                                
                                
			<div class="nav-left">
				<ul class="nav nav-pills nav-pills-info nav-pills-icons"
					role="tablist">
					<!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
                    	<c:forEach var="SubCategoryDTO" items="${sublist}">
					<li class=""><a href="#description-1" role="tab"
						data-toggle="tab" aria-expanded="false" class="clicksub" id="${SubCategoryDTO.subcateCode}" > 
						
						<i class="material-icons">reorder</i> ${SubCategoryDTO.subcateCode}
					</a></li>
		            </c:forEach>
			 
					<li class=""><a href="#description-2" role="tab"
						data-toggle="tab" aria-expanded="false" > <!--                                            <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white"
								data-toggle="modal" data-target="#noticeModal">+</button>
					  <i]></i><br> ADD
					</a>
		       
					</li>
				</ul>
				<div id="selectdatatable">
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

