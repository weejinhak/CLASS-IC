<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <link href="${pageContext.request.contextPath}/resources/assets/css/todolist.css" rel="stylesheet" />
    <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 '<div class="row">
         <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
               <div class="card-header" data-background-color="orange">
                  <i class="material-icons">mood</i>
               </div>
               <div class="card-content">
                  <p class="category">남은 수업일수</p>
                  <h3 class="card-title">D-137</h3>
               </div>
               <div class="card-footer">
                  <div class="stats">
                     <i class="material-icons text-danger">warning</i> <a
                        href="#pablo">Get More Space...</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
               <div class="card-header" data-background-color="rose">
                  <i class="material-icons">done</i>
               </div>
               <div class="card-content">
                  <p class="category">오늘 출석자</p>
                  <h3 class="card-title">15/30</h3>
               </div>
               <div class="card-footer">
                  <div class="stats">
                     <i class="material-icons">local_offer</i> Tracked from Google
                     Analytics
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
               <div class="card-header" data-background-color="green">
                  <i class="material-icons">public</i>
               </div>
               <div class="card-content">
                  <p class="category">현재 이산화탄소 농도</p>
                  <h3 class="card-title">400ppm</h3>
               </div>
               <div class="card-footer">
                  <div class="stats">
                     <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
               </div>
            </div>
         </div>

         <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
               <div class="card-header" data-background-color="blue">
                  <i class="material-icons">people</i>
               </div>
               <div class="card-content">
                  <p class="category">아무거나</p>
                  <h3 class="card-title">ring</h3>
               </div>
               <div class="card-footer">
                  <div class="stats">
                     <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>
   <!--   <div class="wrapper">
            <div class="content"> -->
   <div class="container-fluid">
      <div class="row">


       <div id="boardlist"></div>

         <!--To do list-->

         <div class="col-lg-12 col-md-12">
           		<div class="tdl-holder">
			<h2>TO DO LIST</h2>
			<div class="tdl-content">
				<ul>
					<c:forEach var="list" items="${list}">
					<li><label><input type="checkbox"><i></i><span>${list.listContent}</span><a href='#'  id="${list.listNo}">–</a></label></li>
				
					</c:forEach>
				</ul>
			</div>
			<input type="text" class="tdl-new" name="listContent" id="listContent" placeholder="해야할 일을 쓰세요" style="color: black;">
				</div>
         </div>
         
         </div>
      	 </div>
  </div>
<%-- <script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script> --%>
<script type="text/javascript">
   $(document).ready(function() {


      $.ajax({
         type : "get",
         url : "boardmain.htm",
         dataType : 'html',
         success : function(data) {

            $('#boardlist').html(data);
      
         }
      });

      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();

      demo.initVectorMap();
   });

    /* TO DO LIST */  
  $(".tdl-new").bind('keypress', function(e){
    var code = (e.keyCode ? e.keyCode : e.which);
    console.log(code);
    
    if(code == 13) {
      var v = $(this).val();
      var s = v.replace(/ +?/g, '');
      if (s == ""){
        return false;
      }else{
    	console.log(v);	
    	
    	$.ajax({
  		url: "TodoListInsertOk.htm",
  		type:'get',
  		dataType : "text",
  		data : {listContent: v},
  		success : function(){
  			console.log(data.listContent)
  		}
  			 }); 
    	  
        $(".tdl-content ul").append("<li><label><input type='checkbox'><i></i><span>"+ v +"</span><a href='#'>–</a></label></li>");
        $(this).val("");
      }
    }
  });


  $(".tdl-content a").bind("click", function(){
	    var listNo = $(this).attr('id');
	    console.log(listNo);
	
	      
    var _li = $(this).parent().parent("li");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function(){
          _li.remove();
        });
        
        
        
        
    	$.ajax({
      		url: "TodoListDelete.htm",
      		type:'get',
      		dataType : "text",
      		data : {listNo: listNo},
      		success : function(){
      			
      		}
      			 }); 
    return false;
  });

  
  
  // for dynamically created a tags
  $(".tdl-content").on('click', "a", function(){
    var _li = $(this).parent().parent("li");
    var listNo = $('#listNo');
  alert(listNo);
    
        _li.addClass("remove").stop().delay(100).slideUp("fast", function(){
          _li.remove();
          
         
        });
        

        
    return false;
  });

</script>
