
$(function(){

$('#myInfo').click(function(){
    	  var sessionId="<%=(String)session.getAttribute('email')%>";
    	  console.log(sessionId);
			$.ajax({
				  type : "GET",
				  url : "editInfo.htm",
				  data: {
				      email: sessionId
				  },
				  success : function(data){
						alert('성공');
				  },
				  error:function(request, status, error){
		              
		                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
		               
		          }
			});
    	  
      });
      
$('#editMyInfo').click(function(){
	  var sessionId="<%=(String)session.getAttribute('email')%>";;
      var pwd_te = $('#pwd_te').val();
      var name_te = $('#name_te').val();
      var phone_te = $('#phone_te').val();
      var photoSrc_te = $('#photoSrc_te').val();
      var authority_te = $('#authority_te').val();
	  var mydata = {"email":email_te, "pwd":pwd_te, "name":name_te , "phone":phone_te ,"photoSrc":photoSrc_te, "authority": authority_te };
      
	  console.log(sessionId);
		$.ajax({
			  type : "POST",
			  url : "editInfo.htm",
			  data: mydata,
			  success : function(data){
					$('#lecturelist').html(data);
					alert('성공');
			  },
			  error:function(request, status, error){
	              
	                alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error );
	               
	          }
		});
	  
});
  	
});  