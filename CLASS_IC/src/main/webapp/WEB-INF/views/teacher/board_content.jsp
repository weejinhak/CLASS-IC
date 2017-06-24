<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.fileDrop {
  width: 25%;
  height: 175px;
  border: 4px dotted;
  background-color: silver;
  margin: auto;
}
</style>


 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="col-md-12">
                            <div class="card">
                         <br><br>
                         
                                <div class="card-header card-header-text" data-background-color="rose">
                                 <h4 class="card-title">글 입력하기</h4>
                                  </div>
                                  
                           
                           <br><br>
                           

                           
                           <!-- <input type="radio" name="gender" value="man">남
						   <input type="radio" name="gender" value="woman">여 -->
                           
                  <form  id='registerForm' role =form method="post" action="boardWriteOk.htm" class="form-horizontal">
                           
                         <div style="display:inline-block;">
                                         카테고리 <select id="category" name="cateCode" >
			                <c:forEach items="${list}" var="list"> / 
								<option value="${list}">${list}</option>
							</c:forEach>
						</select>
						 </div>
						 <br><br>
						 
						  <div style="display:inline-block;" id="subOption">
							
						 </div> 
						 
						 <div class ="subList" id="subList" style="display:inline-block;">
							
			       
							
						 </div>

                            
                                

                                    <div class="card-content">
                                    
                                        <div class="row">
                                            <label class="col-sm-2 label-on-left">제목 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input name ="lectureTitle" type="text" class="form-control" value="" style="width: 90%">
                                                    <span class="help-block">글의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                            <div class="row">
                                            <label class="col-sm-2 label-on-left">내용 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <textarea name="lectureContent" cols="50" style="width: 90%; height: 300px; color: gray"></textarea>

                                                    <span class="help-block">과제의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        	<br>
                                            <div class="form-group">
												<div class="fileDrop"><h5 align="center"><br><br>Drag and Drop your file!</h5></div>
											</div>
											        </div>
                                       
                                                        <!-- /.box-body -->

	<div class="box-footer">
		<div>
			<hr>
		</div>

		<ul class="uploadedList">
		</ul>

		<button type="submit" class="btn btn-primary">Submit</button>

	</div>
</form>


		

	</div>
</div>
                                                    
                                                    <br>
                                                    <br>
                                                    <br>

                                        </div>
                                 
                                    </div>
                           
                            
                            
      	 


<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="delbtn"></a>
	</span>
  </div>
</li>                
</script>    




<script>
var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	console.log(file);
	
	$.ajax({
		  url: 'uploadAjax.htm',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});



/////////////////Option ajax//////////////////
//id ="cate" name="cateCode_AJAX"

$('#category').change(function(event){
	
	
	var temp = $("#category").val();
	console.log(temp);
	
	$.ajax({
        url: 'subOption.htm',
        data: {"temp":temp},
        dataType:'text',
        type: 'POST',
        
        success: function(data){
      
       	$('#subOption').html(data);
           
        }
    });
});


/* $.ajax({				
	url:"Apart.etc",
	data:{ ApartName : $(this).attr('id')},
	dataType: "text",
	success: function(data){
		$('#apartlist').html(data);
	}				
}); */




</script>
