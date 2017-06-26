<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- css link -->
<link href="${pageContext.request.contextPath}/resources/assets/css/final_group.css" rel="stylesheet" />

<div class="content">
       <div class="container-fluid">
       <!--  내용 -->
<div id="dhtmlgoodies_dragDropContainer">
	<div id="topBar">
	</div>
	<div id="dhtmlgoodies_listOfItems">
		<div>
			<p>Available students</p>
		<ul id="allItems">
		<c:forEach  var="list" items="${member_list2 }">
			<li id="${list.email}">${list.name}</li>
			</c:forEach>
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
<script src="${pageContext.request.contextPath}/resources/assets/js/final_group.js"></script>