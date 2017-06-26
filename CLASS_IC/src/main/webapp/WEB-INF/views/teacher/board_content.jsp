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
<!-- 네이버 에디터 부분 시작 -->'
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "lectureContent", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/smarteditorSample/SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["lectureContent"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["lectureContent"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>
<!-- 네이버 에디터 부분 끝  -->	
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="col-md-12">
                            <div class="card">
                         <br><br>
                         
                                <div class="card-header card-header-text" data-background-color="rose">
                                 <h4 class="card-title">글 입력하기</h4>
                                  </div>
                                  
                           <form method="post" action="boardWriteOk.htm" class="form-horizontal">
                           <br><br>
                           
                         <div style="display:inline-block;">
			                            카테고리<select name="cateCode" onchange ="">
			                
			                <c:forEach items="${list}" var="list">
							<option value="${list}">${list}</option>
							</c:forEach>
							</select>
						 </div>
						 
						 <div style="display:inline-block;">
			                            서브카테고리<select name="subcateCode" onchange ="checkSel(this)">
							<option value="사과">사과</option>
							<option value="감">감</option>
							<option value="배">배</option>
							</select>
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
                                                    <textarea id="lectureContent" name="lectureContent" cols="50" style="width: 90%; height: 300px; color: gray"></textarea>

                                                    <span class="help-block">과제의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        	<br>
                                            <div class="form-group">
												<div class="fileDrop"><h5 align="center"><br><br>Drag and Drop your file!</h5></div>
											</div>

                                       
                                       <div class="td-actions text-center">
                                                        <button type="button" rel="tooltip" class="btn btn-info btn-round" data-original-title="" title="">
                                                            <i class="material-icons">list</i>
                                                        </button>
                                                        <button type="submit" rel="tooltip" class="btn btn-success btn-round" data-original-title="" title="">
                                                            <i class="material-icons">edit</i>
                                                        </button>
                                                        <button type="button" rel="tooltip" class="btn btn-danger btn-round" data-original-title="" title="">
                                                            <i class="material-icons">close</i>
                                                        </button>
                                                        </form>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                        </div>
                                 
                                    </div>
                           
                            </div>
      	 </div>
</div>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>    


<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
	
	
	$.ajax({
		  url: '/uploadAjax',
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



</script>
