<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- css link -->
<link href="${pageContext.request.contextPath}/resources/assets/css/group.css" rel="stylesheet" />
<div class="content">
       <div class="container-fluid">
<div id="wrapper">
<!-- 학생 리스트  -->
<%-- 	<div class="canvas">
	<c:forEach var="slist" items="${member_list2}">
		<div class="alternative" id="alt">
		<img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img_g"/>
		 ${slist.name }
		</div>
		<!-- <div class="alternative" id="alt2">Alternative Number Two</div>
		<div class="alternative" id="alt3">Alternative Number Three</div>
		<div class="alternative" id="alt4">Alternative Number Four</div>
		<div class="alternative" id="alt5">Alternative Number Five</div>
		<div class="alternative" id="alt6">Alternative Number Six</div> -->
		</c:forEach>
	</div> --%>

	<div id="scale">
	
		<!-- 
		<div class="top">${i }조</div>
		<div class="mid">Average</div>
		<div class="bottom">Bad</div> 
		-->
		
	</div>

	<!--조 나누기  -->
	<!-- 학생 리스트가 있는 칸 -->
	<div class="head" ><p>학생리스트</p>
	<!-- 학생 리스트  -->
	<div class="canvas">
	<c:forEach var="slist" items="${member_list2}">
		<div class="alternative" id="alt_${var.index}">
		<img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img_g"/>
		 ${slist.name }
		</div>
		<!-- <div class="alternative" id="alt2">Alternative Number Two</div>
		<div class="alternative" id="alt3">Alternative Number Three</div>
		<div class="alternative" id="alt4">Alternative Number Four</div>
		<div class="alternative" id="alt5">Alternative Number Five</div>
		<div class="alternative" id="alt6">Alternative Number Six</div> -->
		</c:forEach>
	</div>
	</div>
	<!--  style="overflow:scroll; width:300px; height:150px; padding:10px; background-color:gold;" -->
	<c:forEach var="i" begin="1" end="10">
	<div class="tier tier${i} }" ><p>${i }조</p></div>
	<!-- <div class="tier tier2"><p>Tier Two</p></div>
	<div class="tier tier3"><p>Tier Three</p></div>
	<div class="tier tier4"><p>Tier Four</p></div> -->
	</c:forEach>
</div>
</div>
</div>
<!--  js link -->
<script src="${pageContext.request.contextPath}/resources/assets/js/group.js"></script>
<script type="text/javascript">
$( document ).ready(function() {

	var element = ".alternative",
    x = 0, y = 0;

	interact(element)
		.autoScroll(true)
	    .draggable(true)
	    .snap({
	         mode: 'grid',
	         grid: { x: 10, y: 10 },
	         range: Infinity,
	         elementOrigin: { x: 0, y: 0 }
	     }) 
	    .on('dragmove', function (event) {
	    	event.target.className = event.target.className + "";

	        x += event.dx;
	        y += event.dy;

	        event.target.style.webkitTransform =
	        event.target.style.transform =
	            'translate(' + x + 'px, ' + y + 'px)';
	    })
	    .on('dragend', function (event) {

	        event.target.className = event.target.className + " placed";

	        console.log('dragged a distance of ' + 
	            Math.sqrt(event.dx*event.dx + event.dy*event.dy) + 
	            ' pixels to ' + event.pageX + ', ' + event.pageY);

	        x = 0;
	        y = 0;

	    })
	    .inertia(true)
	    .restrict({
	        drag: 'parent',
	        elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
	        //endOnly: true
	    })
		;


});
</script>
 