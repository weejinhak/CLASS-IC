<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--에디터 추가부분 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.css" rel="stylesheet">
<br>
<br>
<br>
<br>
<script type="text/javascript">

	   $().ready(function() {
        demo.checkFullPageBackgroundImage();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
        
       cate();
        



        $("#save").click(function() {
        	save(); 
        	
        });
        
        
       	function save() {
       		
        	var title= $("#title").val();
    		var content=$("#content").val();
    		var cate=$("#cate").val();
    		var subcate=$("#subcate").val();
    		var sessionClassCode="<%=(String)session.getAttribute("classCode")%>";

       		console.log(title);
        	console.log(content);
        	console.log(cate);
        	console.log(subcate);
        	console.log(sessionClassCode);

        	$.ajax({ 
        		type: 'post' ,
        		/* enctype: "multipart/form-data", */
        		url: '${pageContext.request.contextPath}/boardcontentsave.htm', 
        		data:{title:title,content:content,cate:cate,subcate:subcate, classCode:sessionClassCode},
        		dataType:'text',
                success : function(data){
                	alert('글쓰기 입력 성공!');
                	location.href="boardcontent.htm";
                	/* var title= $("#title").val("");
            		var content=$("#content").val("");
            		var cate=$("#cate").val("");
            		var subcate=$("#subcate").val(""); */
                },
                error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
                } });	
        	}
       	
       	function cate() {
       		
        	$.ajax({ 
        		type: 'post' ,
        		url: '${pageContext.request.contextPath}/selectcategory.htm', 
        		dataType:'text',
                success : function(data){
					$('#cate').html(data);
             
           
                },
            	error : function(){
                    alert('통신실패!!');
                    alert(title);
                    alert(content);
                } });
       	}
			
       	$('#cate').change(function(event){
       		
       		subcate();
       	
       	});

       	function subcate() {
       		
       		
       		var cate = $("#cate").val();
       		console.log(cate);
       		
       		$.ajax({
       	        url: '${pageContext.request.contextPath}/selectsubcategory.htm',
       	        data: {"cate":cate},
       	        dataType:'text',
       	        type: 'POST',
       	        
       	        success: function(data){
       	       
       	       	$('#subcate').html(data);
       	           
       	        }
       	    });
		}
    	
    
        
    });
</script>

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-text" data-background-color="rose">
			<h4 class="card-title">통합 게시판 글 입력하기</h4>
		</div>
		<div class="card-content">
			<div class="row">

				<div class="dataTables_length" id="datatables_length">&nbsp; &nbsp; &nbsp; &nbsp;
					<label class="form-group form-group-sm">카테고리
					<select id="cate"name="datatables_length" aria-controls="datatables"class="form-control">           
					
					</select> 
					<span
						class="material-input">
					</span>
					</label> &nbsp; &nbsp; &nbsp; &nbsp; <label
						class="form-group form-group-sm">서브 카테고리
						
						<select name="datatables_length" aria-controls="datatables"
						class="form-control" id="subcate"></select> <span
						class="material-input"></span></label>
				</div>

				<label class="col-sm-2 label-on-left">제목 : </label><div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						 <input type="text" class="form-control"  style="width: 90%"
					id="title"	name="title"> 
					<span class="help-block">글의 제목을 입력해 주세요.</span> <span class="material-input"></span>
					</div>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2 label-on-left">내용 : </label>
				<div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						<!--에디터 추가부분 -->
					<!-- 	<div class="main">
                         <div id="editor_panel"></div>  -->
                         <!--에디터 추가부분 -->
						<textarea cols="50" style="width: 90%; height: 600px; color: gray"
							id="content" name="contnet"></textarea>

						<span class="help-block">과제의 제목을 입력해 주세요.</span> <span
							class="material-input"></span>
							<!--에디터 추가부분 -->
							</div>
							<!--에디터 추가부분 -->
					</div>
				</div>
			</div>
			
			

			<div class="td-actions text-center">
				<button type="button" rel="tooltip" class="btn btn-info btn-round"
					id="list" name="list">
					<i class="material-icons">list</i>
				</button>
				<button type="button" rel="tooltip"
					class="btn btn-success btn-round" id="save" name="save">
					<i class="material-icons">done</i>
				</button>
				<button type="button" rel="tooltip" class="btn btn-danger btn-round">
					<i class="material-icons" id="close" name="close">close</i>
				</button>
			</div>
			<br> <br> <br>
		</div>
	</div>


<!--에디터 추가부분 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/lang/summernote-ko-KR.js"></script>
<script>
    $(document).ready(function() {
        $('#content').summernote({
           dialogsFade: true,
           height: 600,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,
            lang: 'ko-KR',         
        });
        
    });
  </script>