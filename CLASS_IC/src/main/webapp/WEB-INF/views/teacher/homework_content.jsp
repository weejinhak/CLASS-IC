<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<br>
<br>
<br>
<br>

   
   

<<<<<<< HEAD
<script type="text/javascript">

	   
</script>

<div class="content">

	<div class="col-md-12">
                            <div class="card">
                            <form method="post" action="addNotice.htm" class="form-horizontal" name="frm" id="frm">
                            		<input type="hidden" name="email" id="email" value="${sessionScope.email }">
                            		<input type="hidden" name="classCode" id="classCode" value="${sessionScope.classCode }">
                                    <div class="card-header card-header-text" data-background-color="rose">
                                        <i class="material-icons">library_books</i>
                                    </div>
                                    <div class="card-content">
                                    	
                                        <div class="row">
                                        
                                        <!-- 카테고리 select box -->
                                         <div class="col-sm-3">
					         			<select  id="selectCateList01" class="form-control selectCateList" title="메인 카테고리 선택해주세요"  name="cateCode">
                                			<option disabled="disabled" selected="selected">카테고리 선택</option>
                             			</select>
                         				</div>
                         					<!-- 제목 -->
                                            <div class="col-sm-8">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" placeholder="제목을 입력하세요" id="assignTitle" name="assignTitle">
                                                </div>
                                            </div>
                                            
                                            <!-- 체크박스 -->
                                                <div class="checkbox checkbox-inline">
                                                    <label>
                                                        <input type="checkbox" name="assignNotice" id="assignNotice" value="true">공지
                                                    </label>
                                                </div>
                                        </div>
                                       
                                        <!-- 내용 -->
                                        <div class="row">
                                        	<div class="col-md-4">
                                        	<textarea rows="20%" cols="100%" id="assignContent" name="assignContent"></textarea>
                                        	</div>
                                        </div>
                                    </div>
                                   </form> 
                                 <!-- 버튼 -->
                                        <div class="row">
                                        	<div class="td-actions text-center">
												<button type="button" rel="tooltip"
													class="btn btn-success btn-round" id="save" name="save">
													<i class="material-icons">done</i>
												</button>
												<button type="button" rel="tooltip" class="btn btn-danger btn-round">
													<i class="material-icons" id="close" name="close">close</i>
												</button>
											</div>
                                        	
                                        </div>
                            </div>
                        </div>
	
</div>
         <!--   contents 영역 끝 -->


<script type="text/javascript">
//화면 갱신 시 메인카테고리 출력
showMainCate();

//close 버튼 클릭시
$("#close").click(function() {
	closeBtn();
});

//save 버튼 클릭시
$("#save").click(function() {
	$("#frm").submit();
	
});

//form
$("#frm").submit(function(event) {
	
	var email = $("#email").val();
	var classCode = $("#classCode").val();
	var cateCode = $(".selectCateList").val();
	var assignNotice = $("#assignNotice").val();
	var assignTitle = $("#assignTitle").val();
	var assignContent = $("#assignContent").val();
	
});

//function : 메인 카테고리 출력
function showMainCate() {
	
	var email = sessionId;
=======
<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-text"  data-background-color="purple">
			<h4 class="card-title">과제 게시판</h4>
		</div>
>>>>>>> refs/remotes/origin/sohyeon
		
	
	<c:forEach var="list" items="${list}">
		<div class="card-content">
			<div class="row">

				<div class="dataTables_length" id="datatables_length" style="margin-top: -20px; margin-left: -10px;">&nbsp; &nbsp; &nbsp; &nbsp;
					<label class="form-group form-group-sm">카테고리  <br>
			         ${list.cateCode }
					<span
						class="material-input">
					</span>
					</label> 
				</div>
				<form id="editForm">
				<label class="col-sm-2 label-on-left" style="margin-top: 30px;">제목  </label><div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						 <input type="text" class="form-control"  style="width: 90%"
					id="lectureTitle"	name="lectureTitle" value="${list.assignTitle}"> 
						
					</div>
				</div>
			</div>

			<input type="hidden" id="lectureNo" name="lectureNo" value="${list.lectureNo }">
			
			<div class="row">
				<label class="col-sm-2 label-on-left"  style="margin-top: 20px;">내용  </label>
				<div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						<textarea cols="50" style="width: 90%; height: 600px; color: gray"
							id="lectureContent" name="lectureContent">${list.assignContent}</textarea>

					</div>
				</div>
			</div>
			</form>

			<div class="td-actions text-center">
			
			
				<button type="button" rel="tooltip" class="btn btn-info btn-round"
					id="list" name="list" onclick="location.href='selectAllList.htm' ">
					<i class="material-icons">list</i>
				</button>

			
				<button type="submit" rel="tooltip"
					class="btn btn-success btn-round" id="editOk" name="editOk">
					<i class="material-icons">done</i>
				</button>
				
	
		
			</div>
			<br> <br> <br>
		
		</div>
		</c:forEach>
	
	</div>

</div>

<script type="text/javascript">



</script>