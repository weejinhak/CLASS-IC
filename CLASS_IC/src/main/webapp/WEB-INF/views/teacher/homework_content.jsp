<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<br>
<br>
<br>
<br>

   
   

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-text"  data-background-color="purple">
			<h4 class="card-title">과제 게시판</h4>
		</div>
		
	
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