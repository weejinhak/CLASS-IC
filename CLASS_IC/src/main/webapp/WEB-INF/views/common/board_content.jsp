<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CLASS-IC</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/material-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
    <!--   Core JS Files   -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/material.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/resources/assets/css/board_editor.css" rel="stylesheet" />
	
</head>

<body>
    <div class="wrapper">
       
          <!-- side navi 메뉴 영역-->
             <div class="sidebar" data-active-color="rose" data-background-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/sidebar-1.jpg">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/index.htm" class="simple-text">
                    151기 (강사)
                </a>
            </div>
            <div class="logo logo-mini">
                <a href="${pageContext.request.contextPath}/index.htm" class="simple-text">
                    CLASS-IC
                </a>
            </div>
            <div class="sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="${pageContext.request.contextPath}/resources/assets/img/faces/kosta.jpg" />
				</div>
				<div class="info">
					<a data-toggle="collapse" href="#collapseExample" class="collapsed">
						임경균 <b class="caret"></b>
					</a>
					<div class="collapse" id="collapseExample">
						<ul class="nav">
							<li><a href="#">나의 정보수정</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.htm">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</div>
			<ul class="nav">
				<li>
					<a href="main.htm"> <i class="material-icons">home</i>
							<p>메인</p>
					</a>
				</li>
				
				<li>
					<a href="historylist.htm"> <i class="material-icons">schedule</i>
							<p>히스토리</p>
					</a>
				</li>
				
				<li>
					<a href="board.htm"> <i class="material-icons">dashboard</i>
							<p>수업보드</p>
					</a>
				</li>		
				</li>
				<li>
					<a href="boardWriteOk.htm"> <i class="material-icons">dashboard</i>
							<p>수업게시글 에디터용</p>
					</a>
				</li>

				<li>
					<a href="homework.htm"> <i class="material-icons">playlist_add_check</i>
							<p>과제게시판</p>
					</a>
				</li>
				
				<li>
					<a href="#"><i class="material-icons">account_box</i>
							<p>학생부</p>
					</a>
				</li>
				
				<li>
					<a href="calendar.htm"> <i class="material-icons">today</i>
							<p>달력</p>
					</a>
				</li>
				<!-- 링크는 메뉴를 통해서 추가해주세요 -->
				<li>
					<a href="#"> <i class="material-icons">edit</i>
							<p>추가링크</p>
					</a>
				</li>
				
				<li>
					<a href="#"> <i class="material-icons">toys</i>
							<p>교실상태</p>
					</a>
				</li>
			</ul>
		</div>
      </div>
  
           <div class="main-panel">
          <c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

<script>
   var wsocket;
   var msg;
   var sessionId="<%=(String)session.getAttribute("email")%>";
   var sessionClassCode="<%=(String)session.getAttribute("classCode")%>"
   function connect() {

      alert(sessionClassCode + " / " + sessionId);
      console.log(sessionId);
      /* alert("소켓연결!"); */
      wsocket = new WebSocket("ws://192.168.1.180:8090/class_ic/chat-ws.htm?email="+sessionId);
      appendMessage("웹 소켓연결되었습니다.");
      wsocket.onopen = onOpen;
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;

   }
   function disconnect() {
      wsocket.close();
   }
   function onOpen(evt) {
      appendMessage("연결되었습니다.");
   }
   function sendMessage() {

      var sendmessage = $("#message").val();
      var remail="a@gmail.com";
      console.log(sendmessage)
      $.ajax({
         type : "get",         
         url : "sendMessage.htm",
         dataType : "html",
         data : {
            "sendmessage" : sendmessage   ,
            "remail": remail
         },
         success : function(data) {
            console.log("성공!!")
         }
      });

      wsocket.send(remail);

   }

   function onMessage(evt) {

      console.log(evt.data+"한테 신호옴!!!");

      $.ajax({

         type : "post",
         dataType : "html",
         url : "newAlarm.htm",
         data : {
            "newAlarm" : evt.data
         },
         success : function(data) {
            console.log("헤더 업데이트 성공");
            console.log(data);
            $('#alarm').empty();
            $('#alarm').html(data);

         }
      });

   }
   function onClose(evt) {
      appendMessage("연결을 끊었습니다.");
   }

   function appendMessage(msg) {
      console.log(msg);

   }

   $(document).ready(function() {
      appendMessage("소켓이 준비되었습니다.");
      connect();
      $('#sendBtn').click(function() {

         sendMessage();

      });
      

   });
   
</script>



<nav class="navbar navbar-transparent navbar-absolute">
   <div class="container-fluid">

      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav navbar-right">
            <li>[ ${sessionScope.name } ]님 강의실 입장</li>
            <!-- QR  -->
            <li><a href="#pablo" class="dropdown-toggle"
               data-toggle="dropdown"> <i class="material-icons">watch_later</i>
            </a>

               <ul class="dropdown-menu">
                  <center>
                     <li>QR 이미지</li>
                  </center>
               </ul></li>
            <!--QR코드    -->

            <!--쪽지 알림  -->
            <!--아코디언  -->
            <li class="dropdown">
               <div class="dropdown dropdown-accordion"
                  data-accordion="#accordion">
                  <a class="dropdown-toggle" href="#" data-toggle="dropdown"> <i
                     class="material-icons" style="padding-top: 10px; color: #555555">notifications</i>
                     <span class="notification" id="alarm">${sessionScope.totalCount}</span>
                     <p class="hidden-lg hidden-md">
                        Notifications <b class="caret"></b>
                     </p>
                  </a>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                     <li>
                        <div class="panel-group" id="accordion">
                           <div class="panel panel-default">
                              <div class="panel-heading">
                                 <h4 class="panel-title">
                                    <a href="#collapseOne" data-toggle="collapse"
                                       data-parent="#accordion"> 김은영 <span
                                       class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                    </a> <input type="text" id="message" placeholder="메시지를 입력하세요" />
                                    <button id="sendBtn">전송</button>
                                 </h4>
                              </div>
                           </div>
                        </div>
                     </li>
                  </ul>
               </div>

            </li>
            <!-- 아코디언 끝 -->

            <!--쪽지알림 끝  -->

            <!--즐겨찾기  -->
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown"> <i class="material-icons">book</i>

            </a>
               <ul class="dropdown-menu">
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
                  <li><a href="#">즐겨찾기</a></li>
               </ul></li>

            <!--설정.마이페이지.로그아웃.-->


            <li><a href="#pablo" class="dropdown-toggle"
               data-toggle="dropdown"> <i class="material-icons">brightness_low</i>
                  <p class="hidden-lg hidden-md">option</p>
            </a>

            <!-- 회원정보 수정  -->
               <ul class="dropdown-menu">
                  <center>
                     <li>

                        <div class="photo">
                           <!-- <img src="../../assets/img/faces/avatar.jpg" class="img-circle"
                              width="100" height="100"> -->
                              <img src="${contextPath }/member_img/3.png" class="img-circle"
                              width="100" height="100">
                        </div>
                     <li>
                     <br>
                         <button class="btn btn-primary btn-raised btn-round" data-toggle="modal" data-target="#memberUpdate" id="myInfo">
                                                  회원정보 수정
                                </button>
                     </li>
                     <!-- 회원정보 수정 Modal -->
                                            <div class="modal fade" id="memberUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                <i class="material-icons">clear</i>
                                                            </button>
                                                            <h4 class="modal-title">회원정보 수정</h4>
                                                        </div>
                                                        <div class="modal-body">
                                      <div class="card">
                                      <div class="card-content">
                                      <form class="form-horizontal">
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">Email</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="email" class="form-control" name="email" id="email" readonly="readonly">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">이름</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" name="name" id="name" readonly="readonly">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">비밀번호</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="password" class="form-control" name="pwd" id="pwd">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">비밀번호 확인</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="password" class="form-control"name="pwdconfirm" id="pwdconfirm">
                                                </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <label class="col-md-3 label-on-left">전화번호</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" name="phone" id="phone">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3"></label>
                                            <div class="col-md-9">
                                                <div class="form-group form-button">
                                                    <button type="submit" class="btn btn-fill btn-rose" id="editMyInfo">회원정보 수정</button>
                                                    <button type="button" class="btn btn-fill" data-dismiss="modal">취소</button>
                                                    <button type="submit" class="btn btn-fill btn-warning">회원 탈퇴</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                  </div>                      
                                  </div>
                                </div>                        
                          </div>
                     </div>
                                            </div>
                                            <!--  End Modal -->
                     
                     <li><br><!-- 로그아웃 -->
                          <button id="logout" class="btn btn-round"><a href="${pageContext.request.contextPath}/logout.htm">Logout</a></button>
                     </li>
               </ul></li>

            <li class="separator hidden-lg hidden-md"></li>

            </center>


         </ul>

         <form class="navbar-form navbar-right" role="search">
            <div class="form-group form-search is-empty">
               <input type="text" class="form-control" placeholder="Search">
               <span class="material-input"></span>
            </div>
            <button type="submit" class="btn btn-white btn-round btn-just-icon">
               <i class="material-icons">search</i>
               <div class="ripple-container"></div>
            </button>
         </form>
      </div>
   </div>
</nav>

           
        </div>
    </div>
</body>

<br>
<br>
<br>
<br>
<script type="text/javascript">

	   $().ready(function() {
        demo.checkFullPageBackgroundImage();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
        
       cate();
        



        $("#save").click(function() {
        	save(); 
        	
        });
        
        
       	function save() {
       		
        	var title= $("#title").val();
    		var content=$("#content").val();
    		var cate=$("#cate").val();
    		var subcate=$("#subcate").val();

        	console.log(title);
        	console.log(content);
        	console.log(cate);
        	console.log(subcate);

        	$.ajax({ 
        		type: 'post' ,
        		url: '${pageContext.request.contextPath}/boardcontentsave.htm', 
        		data:{title:title,content:content,cate:cate,subcate:subcate},
        		dataType:'text',
                success : function(data){
                
                	var title= $("#title").val("");
            		var content=$("#content").val("");
            		var cate=$("#cate").val("");
            		var subcate=$("#subcate").val("");
                },
            	error : function(){
                    alert('통신실패!!');
         
                } });	
        	}
       	
       	function cate() {
       		
        	$.ajax({ 
        		type: 'post' ,
        		url: '${pageContext.request.contextPath}/selectcategory.htm', 
        		dataType:'text',
                success : function(data){
					$('#cate').html(data);
             
           
                },
            	error : function(){
                    alert('통신실패!!');
                    alert(title);
                    alert(content);
                } });
       	}
			
       	$('#cate').change(function(event){
       		
       		subcate();
       	
       	});

       	function subcate() {
       		
       		
       		var cate = $("#cate").val();
       		console.log(cate);
       		
       		$.ajax({
       	        url: '${pageContext.request.contextPath}/selectsubcategory.htm',
       	        data: {"cate":cate},
       	        dataType:'text',
       	        type: 'POST',
       	        
       	        success: function(data){
       	       
       	       	$('#subcate').html(data);
       	           
       	        }
       	    });
		}
    	
    
        
    });
</script>

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-text" data-background-color="rose">
			<h4 class="card-title">통합 게시판 글 입력하기</h4>
		</div>
		<div class="card-content">
			<div class="row">

				<div class="dataTables_length" id="datatables_length">&nbsp; &nbsp; &nbsp; &nbsp;
					<label class="form-group form-group-sm">카테고리
					<select id="cate"name="datatables_length" aria-controls="datatables"class="form-control">           
					
					</select> 
					<span
						class="material-input">
					</span>
					</label> &nbsp; &nbsp; &nbsp; &nbsp; <label
						class="form-group form-group-sm">서브 카테고리
						
						<select name="datatables_length" aria-controls="datatables"
						class="form-control" id="subcate"></select> <span
						class="material-input"></span></label>
				</div>

				<label class="col-sm-2 label-on-left">제목 : </label><div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						 <input type="text" class="form-control"  style="width: 90%"
					id="title"	name="title"> 
					<span class="help-block">글의 제목을 입력해 주세요.</span> <span class="material-input"></span>
					</div>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2 label-on-left">내용 : </label>
				<div class="col-sm-10">
					<div class="form-group label-floating is-empty">
						<label class="control-label"></label>
						<textarea id="lectureContent" name="lectureContent" cols="50" style="width: 90%; height: 600px; color: gray"
							id="content" name="contnet"></textarea>

						<span class="help-block">과제의 제목을 입력해 주세요.</span> <span
							class="material-input"></span>
					</div>
				</div>
			</div>
			
			<!--  파일 업로드 -->
                                       
                                         <div class="row">
                                            <label class="col-sm-2 label-on-left">첨부파일 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <div class="main">
                                                     <div id="editor_panel"></div>  
                                                    &nbsp;<input type="file" id="txtFile" name="files[0]" />
                                            </div>
                                        </div>
                                        </div>
                                        </div>

			<div class="td-actions text-center">
				<button type="button" rel="tooltip" class="btn btn-info btn-round"
					id="list" name="list">
					<i class="material-icons">list</i>
				</button>
				<button type="button" rel="tooltip"
					class="btn btn-success btn-round" id="save" name="save">
					<i class="material-icons">done</i>
				</button>
				<button type="button" rel="tooltip" class="btn btn-danger btn-round">
					<i class="material-icons" id="close" name="close">close</i>
				</button>
			</div>
			<br> <br> <br>
		</div>
	</div>

</div>
<script src="${pageContext.request.contextPath}/resources/assets/js/board_editor.js"></script>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////  -->
<!-- Forms Validations Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.js"></script>
<!--   Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>

</html>
