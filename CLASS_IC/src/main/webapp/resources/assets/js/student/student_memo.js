
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

  $(".in").keypress(function(event) {
	    if (event.which === 13) {
	      var memo = $(".in").val();
	      $(this).val("");
	      
	      if(memo != ""){
	    	  
	    	  console.log(memo)
	    	  
	    	  $.ajax({
	    		  
	    		type : "post",
	  			url : "insertMemo.htm",
	  			data : { "memo" : memo },
	  			dataType : "json",
	  			success : function(data) {
	  				$(".ul").empty();
	  				
	                console.log(data)
	  				console.log("성공!!")
	  				
	  				var list;
	  				
	  				$.each(data.d,function(i,e) {
	  					console.log("value : "+ e.memoText );
						list += '<li class="li"><span class="span"><i class="fa fa-trash"></i></span> "' + e[memoText] + '</li>';
	  				});
	  				$(".ul").append(list);
	  			}
	    	  
	    	  });
	      
	      	}else{
	      		alert("다시 입력해 주세요.");
	      	}
	      }
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
