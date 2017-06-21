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
	<input type="hidden" value="b@gmail.com" name="email" id="email">
	<div class="memoArea">
    <textarea placeholder="메모를 작성하세요" class="textarea"></textarea>
    </div>
	<div id="create">+</div> 
</div>
  <!-- 2017.06.15 최은혜 -->
<script type="text/javascript">

	var email = "b@gmail.com";
	

	$.ajax({
	      
	      type : "get",
	      url : "selectMemo.htm",
	      data : { "email" : email },
	      dataType:'json',
	      success : function(data) {
	                
	         
	         $.each(data, function(index,item) {
	            
	            console.log(item.memotext)
	         }); 
	            
	            
	            
	         console.log("조회 성공!!")
	         
	      }
	      
	      
	   });
	
</script>
  <script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo.js"></script>
</html>