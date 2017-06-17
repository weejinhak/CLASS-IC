<!-- 
@Project : CLASS-IC
@File name : student_memo.jsp
@Author : 최은혜
@Data : 2017.06.15
@Desc :

 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  
 
    <link
	href="${pageContext.request.contextPath}/resources/assets/css/student/student_memo.css"
	rel="stylesheet" /> <!-- 2017.06.15 최은혜 -->
	
<div id="content">
     <div id="container">
    <h2>Memo <i class="onOff fa fa-plus" aria-hidden="true"></i></h2>
    <input type="text" placeholder="새로운 메모를 남겨주세요" class="in">

    <ul class="ul">
      <!--  New To-Do items will go here     -->
      
    </ul>

  </div>
</div>
  <!-- 2017.06.15 최은혜 -->
  <script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo.js"></script>

</html>