<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 학생 -->
	 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="row">
					<div class="card">
					<div class="col-lg-8">
					<!-- 셀렉트 박스(메인 카테고리 선택) -->
					    <div class="col-sm-3">
                                <select id="selectCateList02" class="form-control selectCateList"   title="메인 카테고리 선택" >
                                	<option disabled="disabled" selected="selected">카테고리 선택</option>
                                </select>
                         </div>
                        
                         <div class="col-sm-3">
                    <!--  셀렉트 박스(조 카테고리 선택) -->
                                <select id="selectTeamList" class="form-control" title="조 선택" >
                                	<option disabled="disabled" selected="selected" id="op1">조 선택</option>
                                </select>
                         </div>  
                         </div>
                         
                         <div class="col-sm-12"> 
						<div class="card-content">
					 				<!-- 테이블 -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <th>카테고리 </th>
                                                    <th>제목</th>
                                                    <th>글쓴이</th>
                                                    <th>등록일</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbody">
                                            </tbody>
                                        </table>
                                    </div>
                        </div> 
                                    
                                     <button type="button" class="btn btn-info btn-round" id="noticeBtn" style="float: right;">
                                    	글쓰기</a>
                                    </button>
                                    
                                    </div>
                                    
                                
						<center>
							<ul class="pagination pagination-info">
								<li><a href="javascript:void(0);"> prev</a></li>
								<li><a href="javascript:void(0);">1</a></li>
								<li><a href="javascript:void(0);">2</a></li>
								<li class="active"><a href="javascript:void(0);">3</a></li>
								<li><a href="javascript:void(0);">4</a></li>
								<li><a href="javascript:void(0);">5</a></li>
								<li><a href="javascript:void(0);">next </a></li>
							</ul>
						</center>
					 
					 		</div>
					 </div>
						<!-- 표끝 -->


			</div>

		</div>

      
<script type="text/javascript">
	$(function() {
		
		showMainCate();
		selectAllList();
		
		$("#selectCateList02").change(function(){
			showTeamList();
		});
		
		$('#selectTeamList').click(function(){
			selectCateCodeList();
		});
		
		$("#noticeBtn").click(function() {
			location.href="homeworkPage.htm";
		});
			
		//메인카테고리
			function showMainCate() {
				
				var classCode = sessionClassCode;	
						
						$.ajax({
							
							type : "post",
							url:"selectMainCate.htm",
							data : {"classCode" : classCode},
							dataType : 'Json',
							success : function(data) {
									
								$.each(data, function(){
									$(".selectCateList").append("<option value='"+this.cateCode+"'>" + this.cateCode + "</option> ");
								});
								
					   		}, 
					   		
					   		error:function(request, status, error){
			                    //console.log(error);
			                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
					   		}
					   		
					 });
		} //end showMainCate
		
		
		//팀명 List
		function showTeamList() {
			
			var classCode = sessionClassCode;
			var cateCode = $("#selectCateList02").val();
					
					$.ajax({
						
						type : "post",
						url:"selectStudentTeam.htm",
						data : { "classCode": classCode , "cateCode":cateCode},
						dataType : 'Json',
						success : function(data) {
							
							 $("#selectTeamList").empty();
							
							$.each(data, function(){
								$("#selectTeamList").append("<option value='"+this.partyName+"'>" + this.partyName + "</option> ");
	                                console.log("partyName: "+this.partyName)
	                               
							});
							
							selectCateCodeList();
							
				   		}, 
				   		
				   		error:function(request, status, error){
		                    //console.log(error);
		                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
				   		}
				   		
				 });
		} //end showTeamList
		
		//과제게시판 전체 출력
		function selectAllList() {
			
			var email = sessionId;
			var classCode = sessionClassCode;
			
			$.ajax({
				
				type : "post",
				url:"selectAllListStudent.htm",
				data : {"email" : email, "classCode": classCode },
				dataType : 'html',
				success : function(data) {
					
					$('#tbody').empty();
					$('#tbody').html(data); 
					console.log(data)
					
		   		}, 
		   		
		   		error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
		   		}
				
			});
			
		}
		
		

		//partyName별 출력
		  /*서브카테고리가 변경이 되면 Ajax를 태움 : 2017.06.29 위진학   */ 
		  function selectCateCodeList() {

				     var partyName=$('#selectTeamList').val();

				     $.ajax({
				    	 type : "post",
				        url:'homeworkSelectList.htm',
				        data:{
				         
				           classcode:sessionClassCode,
				           partyName:partyName
				        },
				        dataType:'html',
				        success:function(data){
				        
				        	$('#tbody').empty();	
				         $('#tbody').html(data);    
				         
				        }
				     });
		}
		
		
		
	}); 
</script>





