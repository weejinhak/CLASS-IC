
$(function(){
	//page loding시  myinfo 가져오기 editInfo
	var sessionId="<%=(String)session.getAttribute('email')%>";
	
      $.ajax({
		  type : "POST",
		  url : "/class_ic/getEditInfo.htm",
		  data:{
	    	  email:sessionId
	      },
		  dataType : "html",
		  success : function(data){
			  alter('성공');
				$('.photo').html(data);

		  },
		  error:function(request, status, error){
             
               alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
              
         }
	});
      
      $('#editMyInfo').click(function(){
   	  editMyInfo()
     }); 
	
});  

/* 내 정보 수정  */
function editMyInfo(){
		  
		   $.ajax({ 
		      type: 'POST' ,
		      url: '/class_ic/editInfo.htm', 
		      data:{
		    	  email:sessionId
		      },
		      dataType:'html',
		        success : function(data){
		        	alert('정보 가져옴');
	     			$('.modal-content').html(data);
		        },
		        error:function(request, status, error){
		           alert("정보 모달에 가져오지 못했다")
		        } });   
		   
		} 
