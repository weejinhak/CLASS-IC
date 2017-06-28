<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<br>
<br>
<br>
<br>
   <div align="center">
      <h3>
         교사 통합 관리 페이지
      </h3>
   </div>
   <div class="container-fluid">

      <div class="row">

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

                     <!-- 카테고리 select start -->
                     <div class="dataTables_length" id="datatables_length">
                        <label class="form-group">카테고리<select
                           name="datatables_length" aria-controls="datatables"
                           class="form-control input-sm"><option value="10">Web</option>
                              <option value="25">Spring</option>
                              <option value="50">Java</option>
                              <option value="-1">Detabases</option></select> 
                        </label>
                        &nbsp; &nbsp; &nbsp; &nbsp;
                           <label class="form-group">서브 카테고리<select
                           name="datatables_length" aria-controls="datatables"
                           class="form-control input-sm"><option value="10">Web</option>
                              <option value="25">Spring</option>
                              <option value="50">Java</option>
                              <option value="-1">Detabases</option></select> 
                        </label>
                        
                     </div>
                     <!-- 카테고리 select end -->
                     <table id="datatables"
                        class="table table-striped table-no-bordered table-hover"
                        cellspacing="0" width="100%" style="width: 100%">
                        <thead>
                           <tr>
                             <th class="text-center">check</th>
                              <th class="text-center">글번호</th>
                              <th class="text-center">글내용</th> 
                              <th class="text-center">작성날짜</th>
                              <th class="text-center">Actions</th>
                           </tr>
                        </thead><!-- 
                        <tfoot>
                           <tr>
                              <th class="text-center">글번호</th>
                              <th class="text-center">글내용</th>
                              <th class="text-center">글종류</th>
                              <th class="text-center">작성날짜</th>
                              <th class="text-center">Actions</th>
                           </tr>
                        </tfoot> -->
                        <tbody>
                        
                     <!-- 여기부터 포문  -->   
                     <c:forEach var="LectureBoardDTO" items="${bvo}">
                           <tr>
                             <td>
                              <div class="text-center" style="margin-top: 4px;">
                                 <div class="checkbox" id="">
                                    <label class="text-center"> <input type="checkbox"
                                       name="multy[]" class="text-center"
                                       value="${LectureBoardDTO.lectureNo}"> <span
                                       class="checkbox-material"></span>
                                    </label>
                                 </div>
                              </div>
                           </td>
                           
                           
                              <td class="text-center">${LectureBoardDTO.lectureNo} </td>
                              
                                          
                                            
                                            <!-- 상세페이지 보기  -->
                                            
                                            <td class="text-center"> <a href="totalBoard_contentview.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                 class="btn btn-simple btn-info btn-icon edit">${LectureBoardDTO.lectureTitle}</a> 
                             </td> 
                              <td class="text-center" >${LectureBoardDTO.lectureDate} </td>
                              <td class="text-center"><a href="totalboardEdit.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                 class="btn btn-simple btn-info btn-icon edit"><i
                                    class="material-icons">edit</i></a> 
                                    
                               
                                    
                                    <a href="totalBoard_delete.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                 class="btn btn-simple btn-danger btn-icon remove"><i
                                    class="material-icons">close</i></a></td>
                           </tr>
                           
                       </c:forEach>    
                        
                           <tr>
                            <td colspan="5">
                                     			
							<button type="button" id="submitFrm" class="btn btn-info btn-round" style="margin-left:50px" onclick="multi_del()">체크 삭제</button>
					                  			
					                  		 
                                                     
                            
                            </td>
                           </tr>
                           
                        </tbody>
                     </table>
                     
                     
                     
                  </div>
               </div>
               <!-- end content-->
            </div>
            <!--  end card  -->
         </div>
         <!-- end col-md-12 -->
      </div>
      <!-- end row -->
   </div>



<script type="text/javascript">

// 멀티컨텐츠 (삭제 )선택받기
function multi_del()
{

	var cnt2 = $("input[name='multy[]']:checked").length;

	if(cnt2 < 1){
		alert(" 게시물을 선택하여 주세요");
		return;
	}
	
	var chk = document.getElementsByName("multy[]");
	var len = chk.length;    //체크박스의 전체 개수 
// 	var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수 
	var checkCnt = 0;        //체크된 체크박스의 개수 
	var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수  
	var cnt = 0;    
	var rowid = new Array();   //체크된 체크박스의 모든 value 값을 담는다 

	for(var i=0; i<len; i++){

		if(chk[i].checked == true){ 
		checkCnt++;        //체크된 체크박스의 개수 
		checkLast = i;     //체크된 체크박스의 인덱스 
		} 
		}  
	  
   var count=0;
	for(var i=0; i<len; i++){ 
	if(chk[i].checked == true){  //체크가 되어있는 값 구분  
   rowid.push(chk[i].value); 
	count++;
	}

	}
	
	var data="";
 	for(var i=0;i<count;i++){
 		if(i==count-1){
	     data+= rowid[i];
	    
 		}else{
 			
 		   data+= rowid[i]+",";
 	  
 		}	
 		
 		
 	
 	}
//    alert(data);


		alert(rowid);    //'value1', 'value2', 'value3' 의 형태로 출력된다.
		//ajax 로  보낼데이터를 배열형태로 허용해준당 
		jQuery.ajaxSettings.traditional = true;

		 $.ajax({
	        type: 'POST',
	        url: 'totalBoard_multi_delete.htm',
	        data: { data: data } ,
	        dataType: 'text',
     
	        success: function() {
	        	alert('good');
	        },
	        error: function() {
	        	alert('bad');
	        } 
	    });




}







   $(document).ready(
         function() {
            $('#datatables').DataTable(
                  {
                     "pagingType" : "full_numbers",
                     "lengthMenu" : [ [ 10, 25, 50, -1 ],
                           [ 10, 25, 50, "All" ] ],
                     responsive : true,
                     language : {
                        search : "_INPUT_",
                        searchPlaceholder : "Search records",
                     }

                  });

            var table = $('#datatables').DataTable();


                     b
            // Delete a record
            table.on('click', '.remove', function(e) {
               $tr = $(this).closest('tr');
               table.row($tr).remove().draw();
               e.preventDefault();
            });

            //Edit record
/*             table.on('click', '.edit', function() {
               alert('You clicked on Like button');
            });
*/
            $('.card .material-datatables label').addClass('form-group');
         });
    
   
   
   
</script>