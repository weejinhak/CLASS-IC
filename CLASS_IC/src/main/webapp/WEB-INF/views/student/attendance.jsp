<!--
	@Project : CLASS-IC
	@File Name : attendance.jsp
	@Author : 최은혜
	@Date : 2017.07.29
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div class="content">
 	<input type="hidden" value="${sessionScope.classCode }" id="classCode" name="classCode" />
       <div class="container-fluid">
       	<div id="attendanceList">
      	 <!-- 내용물  contents  -->
       	</div>                     
       </div>
 </div>
 
<script type="text/javascript">
	
	$(function() {
		
		checkStudent(); //출석 체크
		
		//5초 마다 출석했는지 확인
		checkAlert = setInterval(function() {
			
			checkStudent();
			console.log("출석 체크")
			
			var hour = new Date().getHours();
			var min = new Date().getMinutes();
			
			if(hour==09 && min == 10){ //오전 9시 10분에 완료
				
				clearInterval(checkAlert);
				console.log("오늘 출석체크 완료")
				
			}
			
		}, 5000); 
		
		//학생 출력
		function checkStudent() {
			
			var classCode = $("#classCode").val();
			console.log(classCode)
			
			$.ajax({
				
				type : "post",
				url : "selectStudent.htm",
				data : {
					"classCode" : classCode
				},
				dataType : "html",
				success : function(data) {
						
						$('#attendanceList').html(data); //attendance_check.jsp로 이동
						
				}
				
			});
		}
		
		
	});
	
</script>