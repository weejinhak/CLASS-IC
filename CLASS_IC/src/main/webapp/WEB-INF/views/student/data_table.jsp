<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">	
	/* 페이지 로드시 출석가져옴!   */
	$(document).ready(function() {
		  console.log("페이지가 시작2");

			$.ajax({
				  type : 'GET',
				  url : 'attendanceTable.htm',
				  dataType : 'html',
				  data: {
				      email : 'a@gmail.com',
				      classcode: '151'
				  },
				  success : function(data){
						$('#attendancelist').html(data);
				  }
			});
	});
</script>