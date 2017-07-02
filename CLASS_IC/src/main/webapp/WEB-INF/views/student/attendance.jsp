<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
 <div class="content">
 	<input type="hidden" value="${sessionScope.classCode }" id="classCode" name="classCode" />
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="orange">
                                    <h4 class="card-title">학생부</h4>
                          			 <p class="category">New employees on 15th September, 2016</p> 
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
		
		var classCode = "<%=(String)session.getAttribute("classCode")%>";
		console.log("attendance : "+classCode)
		
		$.ajax({
			
			type : "post",
			url : "selectStudent.htm",
			data : {
				"classCode" : classCode
			},
			dataType : "Json",
			success : function(data) {
				
				alert("뜨나");
				
				/* $("#tbody").empty();
				$("#tbody").html(data); */
				$.each(data, function(){
					
					$("#tbody").append("<tr><td><img src='"+${this.photoSrc }+'" id="img"></td>"+
							+"<td>"+${this.email}+"</td>"+
							+"<td>"+${this.name }+"</td>"+
							+"<td>"+${this.phone}+"</td></tr>");   
					
		});	//end each
				
				
	}// end success
	
}); //end ajax

	
</script>