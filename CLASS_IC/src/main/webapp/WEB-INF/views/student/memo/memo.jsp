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
    <textarea placeholder="메모를 작성하세요" class="textarea">
    	
    </textarea><button class="btn">삭제</button>
	<div id="create">+</div> 
</div>
  <!-- 2017.06.15 최은혜 -->
<script type="text/javascript">

	var email = "b@gmail.com";

	$.ajax({
		
	 	type : "get",
		url : "selectMemo.htm",
		data : { "email" : email },
		datatype:"Json",
		success : function(data) {
			
			alert(JSON.stringify(data));
			
			var str=JSON.stringify(data);
			var newstr=JSON.parse(str);
			
			console.log("성공")
			
			var html = "";
			 memotext=[];
						 
			while (newstr.length >0)
				{
					
				 console.log(newstr.memoText)
				
				}

			
			
		/* 	$(data).each(data, function(index,event) {
				html += '<textarea class="textarea">'+data.memoText+'</textarea>';
			});
				
				$(".textarea").append(html);
			 */
				
				
			console.log("조회 성공!!")
			
			
		}
		
		
	});
	
</script>
  <script
	src="${pageContext.request.contextPath}/resources/assets/js/student/student_memo.js"></script>
</html>