<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div class="content">
 	<input type="hidden" value="${sessionScope.classCode }" id="classCode" name="classCode" />
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="orange">
                                    <h4 class="card-title">${sessionScope.classCode }기 학생부</h4>
                                </div>
                                <br> 
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                         <tr>
                                         	<th>사진</th>
                                         	<th>email</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbody">
                                            <!-- 이곳에 내용이온다 -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
      	 </div>
 </div>
 
 <script type="text/javascript">
	
	$(function() {
		
		var classCode = $("#classCode").val();
		console.log(classCode)
		
		$.ajax({
			
			cashe : false,
			type : "post",
			url : "selectStudent.htm",
			data : {
				"classCode" : classCode
			},
			dataType : "Json",
			success : function(data) {

				$.each(data,function(index, item) {

						$('#tbody').append('<tr><td><img src="${pageContext.request.contextPath}/resources/assets/img/faces/'+item.photoSrc+'" alt="'+item.name+'" style="width: 40px;" class="img-circle"></td><td>'+item.email+'</td><td>'+item.name+'</td><td>'+item.phone+'</td></tr>')

						});
			}
			
		});
		
	});
	
</script>