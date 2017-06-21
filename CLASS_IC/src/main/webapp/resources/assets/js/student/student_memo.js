$(document).ready(function(){
	
	//#btn 클릭 시 글 등록 된다. 2017.06.21 최은혜
    $('#btn').click(function(){
        var toAdd = $('input[name=checkListItem]').val();
     if(toAdd === "") {
    	 alert("다시 입력해주세요");
       /* $('.list').append('<div class="item"> Empty </div>');*/
     }else{
    	 $.ajaxSetup({cache:false}); 
    	 $.ajax({
   		  	cashe:false,
 		    url : "insertMemo.htm",
 		  	type : "post",
 			data : { "memo" : toAdd },
 			success : function(data) {
 				
 				$(".checkListItem").val(""); //input 공백으로 초기화
 				$('.list').append('<div class="item">'+ toAdd +'</div>') //등록된 글 추가
 				console.log("등록 성공!!")
 				
 			},
 			error : function(request, status, error){
 				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
 			}
 	  });
    	 
    	 
       
     }
    });
    
    //단일 출력
    function oneSelect() {
    	
    	var email = $('#email').val();
    	var memoNo = $('.memoNo').val();
    	var allData = {"email":email, "memoNo":memoNo}
    	
    	$.ajax({
   		  	cashe:false,
 		    url : "oneText.htm",
 		  	type : "post",
 			data : allData,
 			dataType:'json',
 			success : function(data) {
 				
 				$('.list').append('<div class="item">'+ data.memotext +'</div>') //등록된 글 추가
 				console.log("등록 성공!!")
 				console.log("단일 memoText: "+data.memotext)
 				console.log("단일 memoNo: "+data.memono)
 				
 				
 				
 			},
 			error : function(request, status, error){
 				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
 			}
 	  });
	}
    
    //글 삭제(화면) : 2017.06.21 최은혜
    $(document).on('click', '.item', function(){
    	
    	deleteMemo();
        $(this).remove();
        
    });
    
    //글 삭제 : 2017.06.21 최은혜
    function deleteMemo() {
    	
    	var email = $('#email').val();
    	console.log(email)
    	
    	var memoNo = $('.memoNo').val();
    	console.log(memoNo)
    	
    	var allData = {"email":email, "memoNo":memoNo}
    	$.ajaxSetup({cache:false}); 
    	 $.ajax({
    		
    		cashe:false,
    		async: false,
  		    url : "deleteMemo.htm",
  		  	type : "post",
  			data : allData,
  			success : function(data) {
  				
  				console.log("삭제 성공!!")
  				
  			},
  			error : function(request, status, error){
  				alert('에러탐 : '+ error +"\n"+ "message: " + request.responseText +"\n"+ "code" + request.status);
  			}
  	  });
	}
  
    //input창에 focus됬을때 색 변화 :2017.06.21 최은혜
    $('input').focus(function() {
        $(this).css('outline-color', '#CB5C51');
    });
});

