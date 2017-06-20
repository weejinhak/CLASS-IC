<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- css link -->
<link href="${pageContext.request.contextPath}/resources/assets/css/student_group.css" rel="stylesheet" />
 
	
<div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->	
      	 <!-- 조편성하기 -->
      	 조편성
      	 회 차: 
      	 <select id="groupCode">
      	 <c:forEach var="i" begin="1" end="10">
      	 <option value="${i }">${i }회차</option>
      	 </c:forEach>
      	 </select>
      	 <!-- 몇 명으로 나눌 것인가, 이것은 member 총 인원수 / 1부터 총인원수 나눈 수를 select 값으로 뿌린다  -->
      	 <select id="groupName">
      	 <%-- <c:set var="memberCount" value=""/> --%>
      	 <%-- <c:forEach var="i" begin="1" end="memberCount" > --%>
      	 <c:forEach var="i" begin="1" end="10" >
      	 <option value="${i }">${i }명씩</option>
      	 </c:forEach>
      	 </select>
      	 <!-- 조이름: <input type="text" id="gropuName" name="groupName" /> -->
      	 <input type="button" id="group_submit_btn"  value="그룹 생성"/>
		
      	 <!--drag & drop start  -->

<div id="dhtmlgoodies_dragDropContainer">
	<div id="topBar">
	</div>
	<div id="dhtmlgoodies_listOfItems">
		<div>
			<p>Available students</p>
		<ul id="allItems">
			<li id="node1">Student A</li>
<!-- 			<li id="node2">Student B</li>
			<li id="node3">Student C</li>
			<li id="node4">Student D</li>
			<li id="node5">Student E</li>
			<li id="node6">Student F</li>
			<li id="node7">Student G</li>
			<li id="node8">Student H</li>
			<li id="node9">Student I</li>
			<li id="node10">Student J</li>
			<li id="node11">Student K</li>
			<li id="node12">Student L</li>
			<li id="node13">Student M</li>
			<li id="node14">Student N</li>
			<li id="node15">Student O</li> -->
		</ul>
		</div>
	</div>
	<div id="dhtmlgoodies_mainContainer">
		<!-- ONE <UL> for each "room" -->
		<div>
			<p>Team a</p>
			<ul id="box1">
				
			</ul>
		</div>
		<div>
			<p>Team B</p>
			<ul id="box2"></ul>
		</div>
		<div>
			<p>Team C</p>
			<ul id="box3">

			</ul>
		</div>
		<div>
			<p>Team D</p>
			<ul id="box4"></ul>
		</div>
		<div>
			<p>Team E</p>
			<ul id="box5">


			</ul>
		</div>
		
	</div>
</div>
<div id="footer">
	<form action="aPage.html" method="post"><input type="button" onclick="saveDragDropNodes()" value="Save"></form>
</div>
<ul id="dragContent"></ul>
<div id="dragDropIndicator"><img src="https://www.apollowebstudio.com/screenshots/2015/insert.gif"></div>
<div id="saveContent"><!-- THIS ID IS ONLY NEEDED FOR THE DEMO --></div>
</div>
</div>
<!--  js link -->
<script src="${pageContext.request.contextPath}/resources/assets/js/student_group.js"></script>