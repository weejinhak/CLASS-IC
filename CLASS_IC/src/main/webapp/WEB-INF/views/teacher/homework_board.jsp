<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<div align="center">
	<h3>과제 페이지</h3>
</div>
<div class="container-fluid">

	<div class="row">
		<div class="card">
			<!-- 과제카테고리 / 조  추가-->
			<div class="col-sm-10 col-md-offset-3">
				<!-- 셀렉트 박스(메인 카테고리 선택) -->
				<div class="col-sm-3">
					<select id="selectCateList01" class="form-control selectCateList"
						title="메인 카테고리 선택해주세요">
						<option disabled="disabled" selected="selected">카테고리 선택</option>
					</select>
				</div>
				<div class="col-sm-3">
					<!-- input 박스(조 카테고리 추가) -->
					<input type="text" class="form-control" placeholder="조를 입력해주세요"
						id="partyName">
				</div>
				<div class="col-sm-3" align="right">
					<button type="button" class="btn btn-danger btn-round"
						id="addCateBtn">
						조 추가</a>
					</button>
				</div>

			</div>
			<!-- end 과제카테고리 / 조  추가-->
		</div>

		<!-- 카테고리 select start -->
		<div class="dataTables_length" id="datatables_length">

			<!-- 셀렉트 박스(메인 카테고리 선택) -->
			<label class="form-group"> <select id="selectCateList02"
				class="form-control selectCateList" title="메인 카테고리 선택">
					<option disabled="disabled" selected="selected">카테고리 선택</option>
			</select>

			</label>

			<!--  셀렉트 박스(조 카테고리 선택) -->
			&nbsp; &nbsp; &nbsp; &nbsp; <label class="form-group"> <select
				id="selectTeamList" class="form-control" title="조 선택">
					<option disabled="disabled" selected="selected">조 선택</option>
			</select>
			</label>


		</div>


		<div class="col-md-12">

			<div class="card">
				<div class="card-header card-header-icon"
					data-background-color="purple">
					<i class="material-icons">assignment</i>
				</div>
				<div class="card-content">
					<h4 class="card-title">integrated management system</h4>
					<div class="toolbar">
						<!--        Here you can write extra buttons/actions for the toolbar              -->
					</div>
					<div class="material-datatables">
						<div id="datatables_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">

							<div class="row">
								<div class="col-sm-12">
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
												<th class="sorting" tabindex="0" aria-controls="datatables"
													rowspan="1" colspan="1" style="width: 50px;">기수</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th rowspan="1" colspan="1">이름</th>
												<th rowspan="1" colspan="1">일자</th>
												<th rowspan="1" colspan="1">입실시간</th>
												<th rowspan="1" colspan="1">퇴실시간</th>
												<th rowspan="1" colspan="1">상태</th>
												<th rowspan="1" colspan="1">기수</th>
											</tr>
										</tfoot>
										<tbody id="tbodyappend">








										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div>


					<button type="button" id="noticeBtn" class="btn btn-info btn-round"
						style="margin-left: 730px; margin-top: 10px; float: left;">
						<i class="material-icons">done</i>글쓰기
					</button>


					<button type="button" id="submitFrm" class="btn btn-info btn-round"
						style="margin-left: 20px;" onclick="multi_del()">
						<i class="material-icons">clear</i>체크 삭제
					</button>
				</div>
			</div>
			<!-- end content-->
		</div>
		<!--  end card  -->
	</div>
	<!-- end col-md-12 -->
</div>
<!-- end row -->


<!--기수로 보내기 모달 끝 -->

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

<script type="text/javascript">
$('#selectTeamList').click(function(){
    selectCateCodeList();
 });
 
//partyName별 출력
/*서브카테고리가 변경이 되면 Ajax를 태움 : 2017.06.29 위진학   */ 
function selectCateCodeList() {

         var partyName=$("#selectTeamList").val();
	     console.log(partyName);
         $.ajax({
            type : "post",
            url:'homeworkSelectList.htm',
            data:{
               email:sessionId,
               classcode:sessionClassCode,
               partyName:partyName
            },
            dataType:'json',
            success:function(data){                
    			console.log(data);
    			$('#tbodyappend').empty();
    			
    			$.each(data, function() {
    				$("#tbodyappend").append(
    						'<tr class="odd">'+
    						'<td>'+ this.assignNo + '</td>' +
    						'<td>'+ this.assignNo + '</td>' +
    						'<td>'+ this.cateCode + '</td>' +
    						'<td tabindex="0" class="sorting_1">'+ this.assignTitle + '</td>'+
    						'<td tabindex="0" class="sorting_1">'+ this.name + '</td>' + 
    						'<td>'+ this.assignDate + '</td>' +
    						'</tr>'
    						)
    			});
    			
            }
         });
		}
</script>


<script type="text/javascript">

   $(function(){
      
       showMainCate();
         
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
         
         
   });//end 전체 function

   
   
</script>