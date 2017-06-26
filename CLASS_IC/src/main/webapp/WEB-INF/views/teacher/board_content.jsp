<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<br>
<br>
<br>
<br>

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-text" data-background-color="rose">
			<h4 class="card-title">글 입력하기</h4>
		</div>
		<div class="card-content">
			<div class="row">

				<div class="dataTables_length" id="datatables_length">
					&nbsp; &nbsp; &nbsp; &nbsp; <label class="form-group form-group-sm">카테고리
					<select id="cate"
						name="datatables_length" aria-controls="datatables"
						class="form-control"><option value="Web">Web</option>
							<option value="Spring">Spring</option>
							<option value="Java">Java</option>
							<option value="Detabases">Detabases</option></select> <span
						class="material-input"></span></label> &nbsp; &nbsp; &nbsp; &nbsp; <label
						class="form-group form-group-sm">서브 카테고리
						
						<select name="datatables_length" aria-controls="datatables"
						class="form-control" id="subcate"><option value="Web">Web</option>
							<option value="Spring">Spring</option>
							<option value="Java">Java</option>
							<option value="Detabases">Detabases</option></select> <span
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
						<textarea cols="50" style="width: 90%; height: 600px; color: gray"
							id="content" name="contnet"></textarea>

						<span class="help-block">과제의 제목을 입력해 주세요.</span> <span
							class="material-input"></span>
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

</div>


<script type="text/javascript">
	


	   $().ready(function() {
        demo.checkFullPageBackgroundImage();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
        
       

        $("#save").click(function() {
        	
        	var title= $("#title").val();
    		var content=$("#content").val();
    		var cate=$("#cate").val();
    		var subcate=$("#subcate").val();

        	console.log(title);
        	console.log(content);
        	console.log(cate);
        	console.log(subcate);

        	$.ajax({ 
        		type: 'post' ,
        		url: '${pageContext.request.contextPath}/boardcontentsave.htm', 
        		data:{title:title,content:content,cate:cate,subcate:subcate},
        		dataType:'text',
                success : function(data){
                    alert("통신 성공!!") ;
             
                },
            	error : function(){
                    alert('통신실패!!');
                    alert(title);
                    alert(content);
                }



        	});	
        	


        	});
        
    });
</script>
