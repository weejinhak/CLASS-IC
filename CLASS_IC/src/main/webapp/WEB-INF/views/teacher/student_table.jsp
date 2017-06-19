<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="${pageContext.request.contextPath}/resources/assets/css/student_table.css" rel="stylesheet" />
   
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->

	<div class="row">
		<div class="col-sm-12">
			<button class="save btn btn-primary">Save Order</button>
			<!--원모양 start -->


<div class="container">
	<div class="product">
	<img src="${pageContext.request.contextPath}/resources/assets/img/st_006.jpg" class="photo_img"/>
	 	<span>name</span>
	 	<input type="hidden" name="email" value="" />
	</div>

	<div class="product">
	<img src="${pageContext.request.contextPath}/resources/assets/img/st_005.jpg" class="photo_img"/>	
		<span>name</span>
		<input type="hidden" name="email" value="" />
	</div>

	<div class="product">
	<img src="${pageContext.request.contextPath}/resources/assets/img/st_004.jpg" class="photo_img"/>		
		<span>name</span>
		<input type="hidden" name="email" value="" />
	</div>

	<div class="favourites">
		<span>&#9733;</span>
		<span>&#x271a;</span>
	</div>

	<div class="favourites-container">

	</div>
</div>	
			<!-- 원모양 end  -->
		</div>
	</div>
</div>
      	 </div>

 <script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 <script src="${pageContext.request.contextPath}/resources/assets/js/student_table.js"></script>