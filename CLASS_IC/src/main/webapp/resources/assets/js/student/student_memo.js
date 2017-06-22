$(document).ready(function(){
	
	//#btn 클릭 시 글 등록 된다. 2017.06.21 최은혜
    $('#btn').click(function(){
      
        var email = $('#email').val();
        var checkListItem=$('#checkListItem').val();
        
     if(checkListItem === "") {
    	 alert("다시 입력해주세요");
      
     }else{
    	 $.ajaxSetup({cache:false}); 
    	 $.ajax({
   		  	cashe:false,
 		    url : "insertMemo.htm",
 		  	type : "post",
 			data : { "email" : email, "checkListItem": checkListItem },
 			success : function(item) {
 			
 				location.href= 'selectMemo2.htm';
 				

<<<<<<< HEAD
 			},
 			error : function(request, status, error){
 				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
 			}
 	  });
       
     }
    });
    
    
    //글 삭제(화면) : 2017.06.21 최은혜
    //글 삭제 : 2017.06.21 최은혜
    $(document).on('click', '.deletebutton', function(){
    	var email = $('#email').val();
    	console.log(email)
    	
    	var memoNo = $(this).val();
    	console.log(memoNo)
    	
    	var id="#"+memoNo;
    	
    	var allData = {"email":email, "memoNo":memoNo}
    	$.ajaxSetup({cache:false}); 
    	 $.ajax({
    		
    		cashe:false,
    		async: false,
  		    url : "deleteMemo.htm",
  		  	type : "post",
  			data : allData,
  			success : function(data) {
  				console.log(id)
  				console.log("삭제 성공!!")
  				
  			},
  			error : function(request, status, error){
  				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
  			}
  	  });
    	
        $(id).remove();
        
    });
    
  
    //input창에 focus됬을때 색 변화 :2017.06.21 최은혜
    $('input').focus(function() {
        $(this).css('outline-color', '#CB5C51');
    });
});
=======
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
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC

<<<<<<< HEAD
=======
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
>>>>>>> branch 'eh' of https://github.com/johntei/CLASS-IC
