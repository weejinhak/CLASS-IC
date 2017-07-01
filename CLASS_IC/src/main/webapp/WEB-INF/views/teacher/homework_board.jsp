<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <div class="content">
       <div class="container-fluid">
          <!-- 내용물  contents  -->
          <div class="row">
               <div class="card">
               <!-- 과제카테고리 / 조  추가-->
               <div class="col-sm-10 col-md-offset-3">
               <!-- 셀렉트 박스(메인 카테고리 선택) -->
                   <div class="col-sm-3">
                        <select  id="selectCateList01" class="form-control selectCateList" title="메인 카테고리 선택해주세요"  >
                                      <option disabled="disabled" selected="selected">카테고리 선택</option>
                             </select>
                         </div>
                         <div class="col-sm-3">
                     <!-- input 박스(조 카테고리 추가) -->
                             <input type="text" class="form-control" placeholder="조를 입력해주세요" id="partyName"> 
                         </div>  
                         <div class="col-sm-3" align="right">
                         <button type="button" class="btn btn-danger btn-round" id="addCateBtn">조 추가</a></button>
                         </div>
                                    
                         </div><!-- end 과제카테고리 / 조  추가-->
               </div>
               
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
<!--                   <div class="card-content">
                            테이블
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
                                            	<div class="div"></div>
                                            </tbody>
                                        </table>
                                    </div>
                        </div>  -->
                        
                        <table id="datatables"
											class="table table-striped table-no-bordered table-hover dataTable dtr-inline"
											cellspacing="0" width="100%" style="width: 100%;" role="grid"
											aria-describedby="datatables_info">
											<thead>
												<tr role="row">
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 98px;">학생이름</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 98px;">일자</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 225px;">입실시간</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 225px;">퇴실시간</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 114px;">상태</th>
												</tr>
											</thead>

											<tfoot>
												<tr>
     												<th rowspan="1" colspan="1">이름</th>
													<th rowspan="1" colspan="1">일자</th>
													<th rowspan="1" colspan="1">입실시간</th>
													<th rowspan="1" colspan="1">퇴실시간</th>
													<th rowspan="1" colspan="1">상태</th>
												</tr>
											</tfoot>
											<tbody class="tbodyappend">

											</tbody>
										</table>
                                    
                                     <button type="button" class="btn btn-info btn-round" id="noticeBtn" style="float: right;">
                                                                                               글쓰기
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
<<<<<<< HEAD
	$(function() {
		
		showMainCate();
		selectAllList();
		
		$("#addCateBtn").click(function() {
			addHomework();
		});
		
		$("#selectCateList02").change(function(){
			showTeamList();
		});
		
		$('#selectTeamList').change(function(){
			selectCateCodeList();
		});
		
		
		
		$("#noticeBtn").click(function() {
			location.href="homeworkNoticePage.htm";
		});
			
			function showMainCate() {
				
				var email = sessionId;
					
						console.log(email)
						
						$.ajax({
							
							type : "post",
							url:"selectCate.htm",
							data : {"email" : email},
							dataType : 'Json',
							success : function(data) {
									
								$.each(data, function(){
									$(".selectCateList").append("<option value='"+this.cateCode+"'>" + this.cateTitle + "</option> ");
		                                console.log("main cateTitle: "+this.cateTitle)
								});
								
					   		}, 
					   		
					   		error:function(request, status, error){
			                    //console.log(error);
			                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
					   		}
					   		
					 });
		} //end showMainCate
		
		
		function addHomework() {
			
			var email = sessionId;
			var classCode = sessionClassCode;
			
			console.log(email)
			
			var cateCode = $("#selectCateList01 option:selected").val();
			var partyName = $("#partyName").val();
			
			$.ajax({
				
				type : "post",
				url:"addHomework.htm",
				data : {"cateCode": cateCode, "partyName":partyName,"email":email,"classCode":classCode},
				dataType: 'text',
				success : function(data) {
					
						alert("성공");
						
						$("#partyName").val("");
		   		}, 
		   		
		   		error:function(request, status, error){
=======
   $(function() {
      
      showMainCate();
      selectAllList();
      
      $("#addCateBtn").click(function() {
         addHomework();
      });
      
      $("#selectCateList02").change(function(){
         showTeamList();
      });
      
      $("#noticeBtn").click(function() {
         location.href="homeworkNoticePage.htm";
      });
         
         function showMainCate() {
            
            var email = sessionId;
               
                  console.log(email)
                  
                  $.ajax({
                     
                     type : "post",
                     url:"selectCate.htm",
                     data : {"email" : email},
                     dataType : 'Json',
                     success : function(data) {
                           
                        $.each(data, function(){
                           $(".selectCateList").append("<option value='"+this.cateCode+"'>" + this.cateTitle + "</option> ");
                                      console.log(this.cateTitle)
                        });
                        
                        }, 
                        
                        error:function(request, status, error){
                             //console.log(error);
                             alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
                        }
                        
                });
      } //end showMainCate
      
      
      function addHomework() {
         
         var email = sessionId;
         var classCode = sessionClassCode;
         
         console.log(email)
         
         var cateCode = $("#selectCateList01 option:selected").val();
         var partyName = $("#partyName").val();
         
         $.ajax({
            
            type : "post",
            url:"addHomework.htm",
            data : {"cateCode": cateCode, "partyName":partyName,"email":email,"classCode":classCode},
            dataType: 'text',
            success : function(data) {
               
                  alert("성공");
                  
                  $("#partyName").val("");
               }, 
               
               error:function(request, status, error){
>>>>>>> refs/remotes/origin/sohyeon
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
               }
            
         });
         
      }//end addHomework
      
      function showTeamList() {
         
         var email = sessionId;
         var classCode = sessionClassCode;
         var cateCode = $("#selectCateList02").val();
            
         console.log("showTeamList : "+cateCode)
         console.log(classCode)
         console.log(email)
               
               $.ajax({
                  
                  type : "post",
                  url:"selectTeam.htm",
                  data : {"email" : email, "classCode": classCode , "cateCode":cateCode},
                  dataType : 'Json',
                  success : function(data) {
                     
                      $("#selectTeamList").empty();
                     
                     $.each(data, function(){
                        $("#selectTeamList").append("<option value='"+this.partyName+"'>" + this.partyName + "</option> ");
                                   console.log(this.partyName)
                                  
                     });
                     
                     
                     }, 
                     
                     error:function(request, status, error){
                          //console.log(error);
                          alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
                     }
                     
             });
      } //end showTeamList
      
      //과제게시판 전체 정렬
      function selectAllList() {
         
         var email = sessionId;
         var classCode = sessionClassCode;
         
         $.ajax({
            
            type : "post",
            url:"selectAllList.htm",
            data : {"email" : email, "classCode": classCode },
            dataType : 'Json',
            success : function(data) {
               
               $.each(data, function(){
                  
                  $(".tbodyappend").append('<tr role="row" class="odd">'+"<td>"+this.assignNo+"</td><td>"+this.cateCode+"</td><td>"+this.assignTitle+"</td><td>"+this.name+"</td><td>"+this.assignDate+"</td></tr>");
                           
               });
               
               $('td').click(function() {
					var assignNo = this.assignNo;
					
					$.ajax({
<<<<<<< HEAD
						
						type : "post",
						url:"selectTeam.htm",
						data : {"email" : email, "classCode": classCode , "cateCode":cateCode},
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
		
		//과제게시판 전체 정렬
		function selectAllList() {
			
			var email = sessionId;
			var classCode = sessionClassCode;
			
			$.ajax({
				
				type : "post",
				url:"selectAllList.htm",
				data : {"email" : email, "classCode": classCode },
				dataType : 'html',
				success : function(data) {
=======
						type:'GET',
						url:'homeworkContent.htm',
						data : {classCode:classCode,email:email,assignNo:assignNo},
						success: function(){
							alert('성공');
							locatio.href="homeworkContent.htm"
						}
>>>>>>> refs/remotes/origin/sohyeon
					
<<<<<<< HEAD
					$('#tbody').empty();
					$('#tbody').html(data); 
					console.log(data)
					
		   		}, 
		   		
		   		error:function(request, status, error){
=======
					})
			   });
               
               
               }, 
               
               error:function(request, status, error){
>>>>>>> refs/remotes/origin/sohyeon
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
<<<<<<< HEAD
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
				         
				           email:sessionId,
				           classcode:sessionClassCode,
				           partyName:partyName
				        },
				        dataType:'html',
				        success:function(data){
				        
				        	$('#tbody').empty();	
				         $('#tbody').html(data);    
				         
				         console.log(data)
				        }
				     });
		}
		
		
		
	}); 
=======
               }
            
         });
         
      }
      
    
      
      
      
   }); 
>>>>>>> refs/remotes/origin/sohyeon
</script>



<!--데이터테이블에 검색과 페이징처리를 담당하는 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#datatables').DataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
			responsive : true,
			language : {
				search : "__INPUT__",
				searchPlaceholder : "검색해보세요",
			}

		});		
		
	});
</script>
