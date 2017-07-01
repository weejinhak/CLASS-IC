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
                <button class="btn btn-just-icon btn-round btn-primary"  data-toggle="modal"
                     data-target="#subcateModal">
                     <i class="material-icons">library_add</i><div class="ripple-container"></div></button>
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
                  
                  $("#tbody").append("<tr><td>"+this.assignNo+"</td><td>"+this.cateCode+"</td><td>"+this.assignTitle+"</td><td>"+this.name+"</td><td>"+this.assignDate+"</td></tr>");
                           
               });
               
               $('td').click(function() {
					var assignNo =$("#assignNo").val();
					
					$.ajax({
						type:'GET',
						url:'homeworkContent.htm',
						data : {classCode:classCode,email:email,assignNo:assignNo},
						success: function(){
							alert('성공');
							locatio.href="homeworkContent.htm"
						}
					
					})
			   });
               
               
               }, 
               
               error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
               }
            
         });
         
      }
      
      //페이징
       $('#datatables2').DataTable({
               "pagingType": "full_numbers",
               "lengthMenu": [
                   [10, 25, 50, -1],
                   [10, 25, 50, "All"]
               ], //게시물 표시
               responsive: true,
               language: {
                   search: "_INPUT_",
                   searchPlaceholder: "단어를 입력하세요", //단어검색
               }

           }); 

      
      
      
   }); 
</script>
<script>
   //partyName별 출력
  /*서브카테고리가 변경이 되면 Ajax를 태움.   */
  /* $('#서브카테고리').change(function(event)){

     var 메인카테고리= $('#메인카테고리').val();
     var 서브카테고리=$('#서브카테고리').val();

     $.ajax({
       
        url:'homeworkSelectList.htm',
        data:{
         
           email:sessionId,
           classcode:sessionClassId,
           cateCode:cateCode,
           partyName:partyName
        },
        dataType:'html',
        success:function(data){
         $('#list').html(data);        
        }
     });
  }); */
</script>




