<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
 <div class="content">
                <div class="container-fluid">
                
                	<input type="hidden" value="${sessionScope.classCode}" id="classCode" name=classCode>
        
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="orange">
                                    <i class="material-icons">assignment</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">링크 | 파일 게시판</h4>
                                    
                                     
                <!--임시 test  -->
        
        		<div class="nav-center">
				<ul class="nav nav-pills nav-pills-warning nav-pills-icons"
					role="tablist">
					
					<!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
                    
                    
         
					<li class="active"><a href="#link" role="tab"
						data-toggle="tab" aria-expanded="false"> 
							<button class="btn btn-raised btn-round btn-white">링크</button>
					</a></li>
	 
			 
					<li class=""><a href="#file" role="tab"
						data-toggle="tab" aria-expanded="false">
						 <!--  <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white">수업 보드 파일</button>
					 
					</a>
		       
					</li>
					
					
						<li class=""><a href="#file2" role="tab"
						data-toggle="tab" aria-expanded="false">
						 <!--  <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white">과제 게시판 파일</button>
					 
					</a>
		       
					</li>
				</ul>
			</div>
			
			
			<!-- tab-content -->
			<div class="tab-content">
				<div class="tab-pane active" id="link">
					<div class="card">
						<!--  표-->
						<div class="card-content table-responsive">
						
					 
				 
						<!-- 여기서 부터 링크 데이터 테이블           -->
                                                
                                    <div class="material-datatables">
                                        <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                            
                                            
                                                <tr>
                                                    <th   align="center">링크 제목</th> 
                                                    <th   align="center">링크 주소</th> 
                                                    
                                                    <th   align="center">연관 글 링크</th> 
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <!--  여기서부터 tr td-->
                                                      <c:forEach var="lvo" items="${lvo}">
                                                <tr>
                                                    <td>
                                                    ${lvo.linkTitle}
                                                    </td>
                                                    <td>
                                                      <a href="http://${lvo.linkSrc}"  target="_blank">
                                                    ${lvo.linkSrc}</a>  
                                                    </td> 
                                                    <td> 
			<!--  lectureno 넘겨줘서 상세보여주기  --> <a href="#">
                                                    ${lvo.lectureTitle}</a></td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a> 
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                   <td></td>
                                                </tr>
                                                </c:forEach>
                                         <!--   tr td 끝-->
                                         
                                         
                                         
                                            </tbody>
                                        </table>
                                    </div>
                                  <!--  넣어주기 끝-->   
                                  
                                    <div align="right">
                  <button class="btn btn-danger" data-toggle="modal"
                     data-target="#noticeModal">
                     <span class="btn-label"> <i class="material-icons">check</i>
                     </span>링크 추가
                  </button>
               </div>
                  
                                        
						</div>
        
        	</div>
       	 </div>
       
       <!--  -->
       
       
	 <!-- 모달  -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->
         
         <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
            
            
         <form action="linkInsert.htm" method="POST">         
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="material-icons">clear</i>
                     </button>
                     <h5 class="modal-title" id="myModalLabel">링크 추가</h5>
                  </div>
                  <div class="modal-body">
                     <div class="instruction">
                     
                          
                        
                           <div class="row">
                           <div class="col-md-12">
                            
                              
                           <input type="text" class="form-control" placeholder="링크 이름" id="linkTitle" name="linkTitle">
                           </div>
                         
                        </div>
                        
                              <div class="row">
                           <div class="col-md-12">
                            
                              
                           <input type="text" class="form-control" placeholder="링크 주소" id="linkSrc" name="linkSrc">
                           </div>
                         
                        </div>
                        
                         
                        
                     </div>
                      
                      
                  </div>
                  <div class="modal-footer text-center" >
                 	 <button type="submit" class="btn btn-success btn-simple" >작성</button>
                     <button type="button" class="btn btn-simple" data-dismiss="modal">취소
                        </button>
                     
                  </div>
               
               </div>
            </form>
               
            </div>
         </div>
           </div>
                  </div>
              
         <!-- end notice modal -->
	 
	 
	 
		<!--  -->				 
				 
<!--    여기서부터 파일게시판           -->
                                            
                                    <div class="tab-pane" id="file">
					<div class="card">
						<!--  표-->
						<div class="card-content table-responsive">
						
                                    <div class="material-datatables">
                                        <table id="datatables2" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                                <tr>   
                                                    <th   align="center">파일</th>
                                                   
                                                    <th   align="center">연관 수업 글</th> 
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <!--  여기서부터 tr td-->
                                             <c:forEach var="lfvo" items="${lfvo}">
                                                <tr>
                                                    <td>
                                                    ${lfvo.fileSrc}
                                                    </td>
                                                  <td>
                                                  			<!--  lectureno 넘겨줘서 상세보여주기  --> <a href="#">
                                                    ${lfvo.lectureTitle}</a>
                                                    </td>
                                               
                                                   
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a> 
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                   <td></td>
                                                </tr>
                                                </c:forEach> 
                                         <!--   tr td 끝-->
                                            </tbody>
                                        </table>
                                    </div>   
                                        
                     <!--  넣어주기 끝 -->
                                        
                              						</div>
        
        </div>
        </div>
                  
                                        
                                    				 
<!--    여기서부터 과제 파일게시판           -->
                                            		<div class="tab-pane" id="file2">
					<div class="card">
						<!--  표-->
						<div class="card-content table-responsive">
						
					 
                                    
                                    <div class="material-datatables">
                                        <table id="datatables3" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                                <tr>   
                                                    <th   align="center">파일</th>
                                                   
                                                    <th   align="center">연관 과제 글</th> 
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <!--  여기서부터 tr td-->
                                             <c:forEach var="afvo" items="${afvo}">
                                                <tr>
                                                    <td>
                                                    ${afvo.fileSrc}
                                                    </td>
                                                    <td>
                                                    			<!--  assignNo 넘겨줘서 상세보여주기  --> <a href="#">
                                                    			${afvo.assignTitle}</a>
                                                    </td>
                                                   <td></td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a> 
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                                </c:forEach> 
                                         <!--   tr td 끝-->
                                            </tbody>
                                        </table>
                                    </div>   
                                        
                     <!--  넣어주기 끝 -->    
                              
                                  
                                        
						</div>
        
        </div>
        </div>
        
        
        
        
        
        
        
        </div>
        
        
        
        
                <!--임시 test  --> 
                                    
                                    
                                    
                                    <div class="toolbar">
                                        <!--        Here you can write extra buttons/actions for the toolbar              -->
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
            </div>
            
    
    
    
    
    
    
    
<!-- 단어검색, 게시물표시, 페이징 Javascript -->
 <script type="text/javascript">
    $(document).ready(function() {
        $('#datatables').DataTable({
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


        var table = $('#datatables').DataTable();

        // 수정 record
        table.on('click', '.edit', function() {
            $tr = $(this).closest('tr');

            var data = table.row($tr).data();
            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
        });

        // 삭제 a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

 

        $('.card .material-datatables label').addClass('form-group');
    });
    
    /* 파일 게시판 용 */
    $(document).ready(function() {
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


        var table = $('#datatables2').DataTable();

        // 수정 record
        table.on('click', '.edit', function() {
            $tr = $(this).closest('tr');

            var data = table.row($tr).data();
            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
        });

        // 삭제 a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

  

        $('.card .material-datatables2 label').addClass('form-group');
    });
    
    /* 과제 파일 게시판 용 */
    $(document).ready(function() {
        $('#datatables3').DataTable({
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


        var table = $('#datatables3').DataTable();

        // 수정 record
        table.on('click', '.edit', function() {
            $tr = $(this).closest('tr');

            var data = table.row($tr).data();
            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
        });

        // 삭제 a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

   

        $('.card .material-datatables3 label').addClass('form-group');
    });
    
    
</script>
 <!-- end 단어검색, 게시물표시, 페이징 Javascript -->