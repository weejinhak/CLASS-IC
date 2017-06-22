<!-- 
@Project : CLASS-IC
@File name : student_memo.jsp
@Author : 최은혜
@Data : 2017.06.15
@Desc :
 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


=======
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
 <c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  
 
    <link
	href="${pageContext.request.contextPath}/resources/assets/css/student/student_memo.css"
	rel="stylesheet" /> <!-- 2017.06.15 최은혜 -->
	
	<div id="content">
	
	<textarea placeholder="메모를 작성해 주세요."></textarea>
<div id="content">
<<<<<<< HEAD
<input type="hidden" value="b@gmail.com" id="email" name="email">
=======
     <div id="container">
    <h2>Memo <i class="onOff fa fa-plus" aria-hidden="true"></i></h2>
    <input type="text" placeholder="새로운 메모를 남겨주세요" class="in">
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC

<<<<<<< HEAD
<div class="todo card-content">
  
  <div class="list">
     <!-- 여기에 리스트가 들어온다 -->
  </div>
  
  <input type="text" name="checkListItem" class="checkListItem"  id="checkListItem" />
  <button id="btn">+</button>
 
</div>
</div>

 <!-- 2017.06.15 최은혜 -->
<script type="text/javascript">
	$(function() {
		
		//글 검색 : 2017.06.21 최은혜
		var email = $('#email').val();
		
		$.ajaxSetup({cache:false}); 
		$.ajax({
			  cashe:false,
		      type : "post",
		      url : "selectMemo.htm",
		      data : { "email" : email },
		      dataType:'json',
		      async: false,
		      success : function(data) {
		    	  
		         $.each(data, function(index,item) {

		        	 $('.list').append('<div class="item col-xs-4" id="'+item.memono+'"> <input type="hidden" class="memoNo" value="'+item.memono+ '" name="memoNo" />'
		        			 +item.memotext+'<button class="deletebutton" value="'+item.memono+'">x</button></div>')
		         
		         		 console.log("memoNO: "+item.memono)
		         }); 
		         
		      }
		      
		   });
	});
</script>
 


=======
	<div id="create">+</div> 
	
	</div>
	
	<script>
	//select
	$(function() {
		
		var email = "a@gmail.com";
		
		$.ajax({
			  
		  	type : "post",
			url : "selectMemo.htm",
			data : { "email" : email },
			success : function(data) {
				
				console.log(data)
				
				var html = "";
				
				$.each(data, function(index,item) {
					
					html =+ "<textarea> " + data.memoText + "</textarea>";
					
				});
  				
  				$("#create").before(html);
				
				console.log("조회 성공!!")
			},
  			error : function(request, status, error){
  				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
  			}
	  });
		
	});

</script>
	
  <!-- 2017.06.15 최은혜 -->
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
  <script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo.js"></script>

<<<<<<< HEAD


=======
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
</html>