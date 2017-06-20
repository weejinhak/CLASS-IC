
/*
@Project : CLASS-IC
@File name : student_memo.js
@Author : 최은혜
@Data : 2017.06.15
@Desc :
*/
$(document).ready(function() {
  $("#create").on("click", function(e){
	  $(this).before("<textarea placeholder='메모를 작성하세요' class='textarea'></textarea>");
  });
  
  $(".textarea").on("focusout",function(e){
	  e.stopPropagation(); //이벤트 버블링 방지
	  
	  var text = $(this).val();
	  
	  if( text != ''){
		  
	  insertMemo();
	  
	  }else{
		  alert("메모를 등록해주세요");
	  }
  });
  
  function insertMemo() {
	
	  var memo = $(".textarea").val();
	  
	  console.log(memo)
	
	  $.ajax({
		  
		    cache: false,
		    url : "insertMemo.htm",
		  	type : "post",
			data : { "memo" : memo },
			success : function(data) {
				
				console.log("등록 성공!!")
				
			},
			error : function(request, status, error){
				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
			}
	  });
	}
	  

  
});