<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="row">
      	 
      	       	
      	 
		<div class="col-md-8 col-md-offset-2">
			<h2 class="title text-center"><b>${cateCode}</b></h2>
			<br>
	 
                                
                                
			<div class="nav-left">
				<ul class="nav nav-pills nav-pills-warning nav-pills-icons"
					role="tablist">
					<!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
                    <!--------------------------foreach  -->
                    <c:forEach items="${subCateList}" var="subCateList">
                    
					<li class="active"><a href="detailList_board.htm?cateCode=${cateCode}&subcateCode=${subCateList} "> 
						<i class="material-icons">reorder</i> ${subCateList}
					</a></li>
					
					</c:forEach>
					<!-- end -->
					
					<li class=""><a href="" role="tab"
						data-toggle="tab" aria-expanded="false"> <!--                                            <i class="material-icons">exposure_plus_1</i> -->
							<button class="btn btn-raised btn-round btn-white"
								data-toggle="modal" data-target="#noticeModal">+</button>
					  <i></i><br> ADD
					</a>
		       
					</li>
				</ul>
			</div>

			<!-- tab-content -->

			<!--  tab content end-->
			

		</div>
	</div>
							<!--  표-->
      <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <tr><th>NO.</th>
                                            <th>글제목</th>
                                            <th>글쓴시간</th>
                                            
                                        </tr></thead>
                                        
                                        
                      			     
                      			     
                                     	<c:forEach items="${list}" var="boardVO">
                                   		
                                 			
						                                        
						                                        <tbody>
						                                       	
						                                            <tr>
						                                            
						                                                <td>${boardVO.lectureNo}</td>
						                                                <td><a href="read.htm${pageMaker.makeSearch(pageMaker.cri.page) }&lectureNo=${boardVO.lectureNo}">${boardVO.lectureTitle}</a></td>
						                                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.lectureDate}" /></td>
						                                           	
						                                            </tr>
						                                        
						                                        </tbody>
						                                        
						                                    
                                        </c:forEach>                                        
                                        
                                        
                                    </table>
                                    
                                     <!-- 페이징처리 -->
										<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="detailList.htm${pageMaker.makeSearch(pageMaker.startPage - 1) }&cateCode=${cateCode}&subcateCode=${subcateCode}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="detailList_board.htm${pageMaker.makeSearch(idx)}&cateCode=${cateCode}&subcateCode=${subcateCode}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="detailList_board.htm${pageMaker.makeSearch(pageMaker.endPage +1) }&cateCode=${cateCode}&subcateCode=${subcateCode}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- 페이징 처리 END -->
                                    
                                  </div>
						<!-- 표끝 -->
						
						
						
	<!-- 모달  -->
	<div class="row">
		<div class="col-md-12 text-center">


			<!-- notice modal -->
			<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">수업보드 세부 카테고리 추가</h5>
						</div>
						
						<form action="makeSubCategory.htm" method="post">
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
									<input name= "cateCode" type="hidden" value="${cateCode}" >
									<input name="subcateCode" type="text" class="form-control" placeholder="세부 카테고리 이름">
									</div>
								 
								</div>
								
							
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">Never
								mind</button>
							<button type="submit" class="btn btn-success btn-simple">Yes</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- end notice modal -->


		</div>
	</div>
      	 </div>
      	 

      	 
      	 
 </div>
 
 
 
