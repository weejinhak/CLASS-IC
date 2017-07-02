<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
 <div class="content">
                <div class="container-fluid">
                
                	<input type="hidden" value="${sessionScope.classCode}" id="classCode" name="classCode">
        
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="orange">
                                    <i class="material-icons">assignment</i>
                                </div>
                                
                                <div class="card-content">
                                    <h4 class="card-title">링크 게시판</h4>
                                    	<div class="toolbar">
						<!--        Here you can write extra buttons/actions for the toolbar              -->
					</div>
                                     
 
			
			<!-- tab-content -->
 
					 
				 
						<!-- 여기서 부터 링크 데이터 테이블           -->
                                                
                                    <div class="material-datatables">
                                        <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                            <thead>
                                            
                                            
                                                <tr>
                                                    <th align="center">링크 제목</th> 
                                                    <th align="center">링크 주소</th> 
                                         
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
                                    
                                                    <td class="text-right">
                                                 
<%--                                                     <a href="linkEdit.htm?linkNo=${lvo.linkNo}" class="btn btn-simple btn-primary btn-icon edit"><i class="material-icons">border_color</i></a> --%>
                                                    <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                 
                                                </tr>
                                                </c:forEach>
                                         <!--   tr td 끝-->
                                         
                                         
                                         
                                            </tbody>
                                        </table>
                                        </div>
                                   
                                    	<!-- 여기서 부터 링크 데이터 테이블  끝         -->
                                               
                                </div>
                                
                            </div><!--카드 끝  -->
                           
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

   

        // 삭제 a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

 
        

        $('.card .material-datatables label').addClass('form-group');
        
        
    });
    
   
</script>
 <!-- end 단어검색, 게시물표시, 페이징 Javascript -->