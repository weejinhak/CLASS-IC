
/*
@Project : CLASS-IC
@File name : student_memo.js
@Author : 최은혜
@Data : 2017.06.15
@Desc :
*/

$(document).ready(function() {
	
$("#create").click(function() {
  $(this).before("<textarea placeholder='메모를 작성해 주세요.'></textarea>");
});

$("textarea").focusout(function() {
	
	insertMemo()
	  
	  });


//insert
function insertMemo() {
	  
	  var memo = $("textarea").val();
	  
	  console.log(memo)
	  
	  if(memo != ""){
		  
		  $.ajax({
			  
			  	type : "post",
				url : "insertMemo.htm",
				data : { "memo" : memo },
				success : function(data) {
					
					console.log(data)
					console.log("등록 성공!!")
					
				},
	  			error : function(request, status, error){
	  				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
	  			}
		  });
		  
	  }else{
	    	alert("메모를 입력해주세요.");
	    }
	  
}

}); //document
