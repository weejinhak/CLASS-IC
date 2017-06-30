<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
 <div class="content">
                <div class="container-fluid">
                
                
        
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
							<button class="btn btn-raised btn-round btn-white">파일</button>
					 
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
                                                    <th>링크 제목</th>
                                                    <th>링크 주소</th> 
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <!--  여기서부터 tr td-->
                                                      <c:forEach var="lvo" items="${lvo}">
                                                <tr>
                                                    <td>${lvo.linkTitle}</td>
                                                    <td><a href="http://${lvo.linkSrc}"  target="_blank">${lvo.linkSrc}</a></td> 
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
                                  <!--  넣어주기 끝-->      
                     
                                        
						</div>
        
        	</div>
       	 </div>
       
				<div class="tab-pane" id="file">
					<div class="card">
						<!--  표-->
						<div class="card-content table-responsive">
						
					 
				 
<!--                 여기서부터 파일게시판           -->
                                            
                                    
                                    <div class="material-datatables">
                                        <table id="datatables2" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                                <tr>   
                                                    <th>파일1</th>
                                                    <th>파일2</th> 
                                                    <th class="disabled-sorting text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <!--  여기서부터 tr td-->
                                             <c:forEach var="fvo" items="${fvo}">
                                                <tr>
                                                    <td>${fvo.fileSrc}</td>
                                                    <td>${fvo.fileSrc2}</td>
                                                   
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

        //좋아요 record
        table.on('click', '.like', function() {
            alert('You clicked on Like button');
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

        //좋아요 record
        table.on('click', '.like', function() {
            alert('You clicked on Like button');
        });

        $('.card .material-datatables2 label').addClass('form-group');
    });
    
    
</script>
 <!-- end 단어검색, 게시물표시, 페이징 Javascript -->