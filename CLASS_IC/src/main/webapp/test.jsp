<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <html>
   <head>

<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script type="text/javascript" src="<%= request.getContextPath() %>/view/calendar/fullcalendar/lib/jquery.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/view/calendar/validation/jquery.validate.js"></script>
<script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery.flexslider.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery.custom.js"></script>
<link href="<%= request.getContextPath() %>/view/calendar/fullcalendar/fullcalendar.min.css' rel='stylesheet" />
<link href="<%= request.getContextPath() %>/view/calendar/fullcalendar/fullcalendar.print.min.css' rel='stylesheet" media='print' />
<script src="<%= request.getContextPath() %>/view/calendar/fullcalendar/lib/moment.min.js"></script>
<script src="<%= request.getContextPath() %>/view/calendar/fullcalendar/fullcalendar.min.js"></script>
<script src="<%= request.getContextPath() %>/view/calendar/fullcalendar/lib/jquery-ui.js"></script>
<link href="<%= request.getContextPath() %>/view/calendar/fullcalendar/lib/jquery-ui.theme.css" rel='stylesheet' />
<link href="<%= request.getContextPath() %>/view/calendar/fullcalendar/lib/jquery-ui.css" rel='stylesheet' />


<script type="text/javascript">


$(function() {	
	Calendar();
	
    function Calendar(){
    	
      $('#calendar').fullCalendar({
         header: {
            left: "",
            center: 'title',
            right: 'prev,next today'
         },
         defaultDate: '2017-06-14', 
         editable: true,
         selectable:true,
         selectHelper : true,
         select : function(event, jsEvent, view) {
        	 	$("#myModal").dialog("open")               
        }
         
      }); 
    
    }
    
    
    $('#myModal').dialog({
        autoOpen:false,
           modal : true,
          draggable : true, //창 드래그 못하게
          resizable : false, //창 크기 고정
          height : 350,
          width : 550,  
         
     });
    
});

</script>
</head>





<body>

<!--calendar  -->
     <div class="row no-margin">
         <div class="span6" style="width: 100%">
            <h1 class="title-bg" style="text-align: center;">
               My Apart Calendar: <small>일정을 확인해보세요!</small>
            </h1>
         </div>
      </div>
      <div align="center">
      <div id='calendar' style="font-size: large; width:700px; height: 700px"></div>
	  </div>
	  
	  
      <!-- Modal
    ================================================== -->
      <div class="row">
         <div class="span4"></div>
         <!-- Modal -->
         <!-- 일정 등록  -->
         <div id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel">
            <div class="modal-header">

               <h3 id="myModalLabel">일 정 등 록</h3>
            </div>
            <form action="<%=request.getContextPath() %>/CalendarInsertOk.etc" method="post" id="vali">
               <div class="modal-body">
                  <input type="text" name="title" id="title" placeholder="일정을 입력해주세요"><br>
                  <input type="text" name="start" id="start" placeholder="일정의 시작"><br>
                  <input type="text" name="end" id="end" placeholder="일정의 마지막"><br>

               </div>
               <div class="modal-footer">
                  <input type="button" class="btn" value="취소" id="insertmodalclose">
                  <input type="submit" class="btn btn-inverse" value="등록">
               </div>
            </form>
         </div>
      </div>	  
	  
	  
</body>
</html>