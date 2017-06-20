<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="col-lg-12 col-md-12" style="height: 100px"></div>
      	 
      	 
      	 
<div class="row" style="padding-left: 150px ; padding-right: 150px">
                    
                    
                    <!-- foreach -->
                   
                    
                        <%-- <c:if test="${boardList.cateCode==cateList.catecode}"> --%>
      					
    					<c:forEach items="${cateList}" var="cateList">
    					<div>
							<!-- spring -->
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="orange">
                                    <h2 class="card-title">${cateList}</h2>
                          			 <p class="category">최신글 목록을 보여줍니다.</p> 
                                </div>
                                
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <tr><th>NO.</th>
                                            <th>머임</th>
                                            <th>머임</th>
                                            
                                        </tr></thead>
                                        
                                        
                      			     <c:set var="num" value= '0'/>
                      			     
                                     	<c:forEach items="${boardList}" var="boardList">
                                   		
                                 			<c:if test="${num <5}">
                                   								<c:if test="${cateList == boardList.cateCode}" >
						                                        <c:set var="num" value="${num+1}"/>
						                                      	
						                                        
						                                        <a href="www.naver.com"></a>
						                                        
						                                        <tbody>
						                                       	
						                                            <tr>
						                                            
						                                                <td>${boardList.lectureNo}</td>
						                                                <td><a href="read.htm?lectureNo=${boardList.lectureNo}">${boardList.lectureTitle}</a></td>  
						                                                <td>500</td>
						                                           	
						                                            </tr>
						                                        
						                                        </tbody>
						                                        
						                                        </c:if>
                                   			
                                   				
                                 			
                                 			
                                   				
                                      		</c:if>
                                      		
                                        
                                        </c:forEach>                                        
                                        
                                        
                                    </table>
                                  </div>
                                  
                                      					<div align="center">
                                      					<form action="detailList.htm">
                                         				 <input type="hidden" name= "cateCode" value="${cateList}">
                                         				 <button type="submit" class="btn btn-round btn-warning dropdown-toggle">
                                                            
                                                            Details
                                                        </button>
                                                        </form>
                                                        </div>
                                                         
                                  
                                </div>
                                
                            </div>
                            
                        </div>
                        </c:forEach>
                     
                        
                       
						
                        
                        
                        <!--  board 추가 아이콘  -->
                      <div class="col-lg-6">
                                <div class="card card-pricing card-raised">
                                    <div class="content">
                                        <h6 class="category">Small Company</h6>
                                        <div class="icon icon-rose">
                                            <i class="material-icons">note_add</i>
                                        </div>
                                        <h3 class="card-title">board number : 4</h3>
                                        <p class="card-description">
                                           새로운 게시판을 생성하려면 이곳을 눌러 생성 하십시오!!!
                                        </p>
                                        
                                  		<button class="btn btn-rose btn-round"
										data-toggle="modal" data-target="#noticeModal">+
										</button>
                                  		
                                    </div>
                                </div>
                            </div>  
                    </div>
      	 </div>
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
							<h5 class="modal-title" id="myModalLabel">카테고리 추가</h5>
						</div>
						
						<form action="makeCategory.htm" method="post">
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
									
									<input name ="cateCode" type="text" class="form-control" placeholder="카테고리 이름">
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
      	 
