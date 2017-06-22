<!-- 
@Project : CLASS-IC
@File name : student_memo.jsp
@Author : 최은혜
@Data : 2017.06.15
@Desc :

 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link
	href="${pageContext.request.contextPath}/resources/assets/css/student/student_memo.css"
	rel="stylesheet" /> <!-- 2017.06.15 최은혜 -->
	
<div id="content">
<input type="hidden" value="b@gmail.com" id="email" name="email">

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
 


  <script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo.js"></script>



</html>