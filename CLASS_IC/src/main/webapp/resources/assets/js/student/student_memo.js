
/*
@Project : CLASS-IC
@File name : student_memo.js
@Author : 최은혜
@Data : 2017.06.15
@Desc :
*/
$(document).ready(function() {
  $(".ul").on("click", ".li", function() {
    $(this).toggleClass("completed");
  });

  $(".ul").on("click", ".span", function() {
    $(this).parent().fadeOut(500, function() {
      $(this).remove();
    });
    event.stopPropagation();
  });

  $(".in").keypress(function(event) {
	    if (event.which === 13) {
	      
	   var memo = $(".in").val(); 	
	    	
	      if(memo != ""){
	    	 
	    	  $.ajax({
	  		  	url : "insertMemo.htm",
	  		  	type : "post",
	  			data : { "memo" : memo },
	  			
	  			success : function(data) {
	  				alert('성공')
	  				$(this).val("");
	  				
	  				console.log(data)
	  				console.log("등록 성공!!")
	  				
	  			},
	  			error : function(request, status, error){
	  				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
	  			}
	  	  });
	    	  
	      }else{
	    		alert("다시 입력해 주세요.");
	    	}
	    }
	 });



  $(".fa-plus").click(function() {
    $(".fa-plus").toggleClass("fa-minus");
    $(".in").slideToggle(350, "linear");
  });
});