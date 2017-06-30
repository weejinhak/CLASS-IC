<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- contextpath 가져와서 변수 정의 하고.. -->
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

<script>
   var sessionId="<%=(String)session.getAttribute("email")%>";
   var sessionClassCode="<%=(String)session.getAttribute("classCode")%>"
   

   /* 페이지 로드시 QR 코드 가져옴. */
   $(document).ready(function() {      
         $('#qrclick').click(function() {
            console.log("페이지가 시작1");
            var url ="/class_ic/common/createCode.htm";          
             $("#img").attr("src", url + "?content=" + sessionClassCode);    
             
             
             
        });
   });


   var wsocket;
   var msg;
   function connect() {
      console.log(sessionId);
      /* alert("소켓연결!"); */
      wsocket = new WebSocket("ws://192.168.0.135:8090/class_ic/chat-ws.htm?email="+sessionId);
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
   function sendMessage(studentId) {

      var sendmessage = $("#messageContent").val();
      console.log(sendmessage)
      $.ajax({
         type : "get",         
         url : "/class_ic/common/sendMessage.htm",
         dataType : "html",
         data : {
            "sendmessage" : sendmessage   ,
            "remail": studentId
         },
         success : function(data) {
            console.log("성공!!")
         }
      });

      wsocket.send(studentId);

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
      $('#sendmessagebtn').click(function() {
         var studentId=$('#students').val();
         console.log(studentId);
         sendMessage(studentId);
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
               data-toggle="dropdown" id="qrclick"> <i class="material-icons">watch_later</i>
            </a>

               <ul class="dropdown-menu">
               <center>
                <img id="img" style="display: none" onload="this.style.display='block'" width="180" height="180"/>
               </center>
               </ul>
               
               
             </li>
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
               <div class="col-sm-12">
            <div class="card card-stats">
               <div class="card-header" data-background-color="orange">
                  <i class="material-icons">near_me</i>
               </div>
               <div class="card-content">
               <button class="btn btn-reddit btn-round"  data-toggle="modal"
                     data-target="#noticeModal2">
                                        <i class="material-icons">near_me</i> 쪽지 보내기   
                                    <div class="ripple-container"></div></button>
               </div>
               <div class="card-footer">
               <!--    <div class="stats">
                     <i class="material-icons text-danger">warning</i> <a href="#pablo">Get More Space...</a>
                  </div> -->
               </div>
            </div>
         </div>
                     </li>
                                          <li>
               <div class="col-sm-12">
            <div class="card card-stats">
               <div class="card-header" data-background-color="orange">
                   <i class="material-icons">email</i> 
                   <span class="btn btn-just-icon btn-round btn-pinterest" style="font-size:15px ; float: ">
                                                ${sessionScope.totalCount}
                         </span>
               </div>
               <div class="card-content">
                  <button class="btn btn-reddit btn-round"  data-toggle="modal"
                     data-target="#noticeModal1">
                            <i class="material-icons">email</i> 쪽지함
                        <div class="ripple-container"></div></button>
               </div>
               <div class="card-footer">
               <!--    <div class="stats">
                     <i class="material-icons text-danger">warning</i> <a href="#pablo">Get More Space...</a>
                  </div> -->
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


 <!-- 쪽지 list 모달 -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->
         
         <div class="modal fade" id="noticeModal1" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
         <form action="CalendarInsertOk.htm" method="POST">         
               <div class="modal-content">
                  <div class="modal-header">
              <!-- 타이틀 내용  -->
                  </div>
                  <div class="modal-body">
                   
                      <!-- 주요 내용  -->
                      
                  </div>
                  <div class="modal-footer text-center" >
                     <button type="submit" class="btn btn-success btn-simple" >작성</button>
                     <button type="button" class="btn btn-simple" data-dismiss="modal">취소
                        </button>
                     
                  </div>
               
               </div>
            </form>
               
            </div>
         </div>
         
         <!-- end notice modal -->
                  </div>
                  </div>
                  
                  
                  
                   <!-- 쪽지 보내기 모달 -->
   <div class="row">
      <div class="col-md-12 text-center">
         <!-- notice modal -->
         
         <div class="modal fade" id="noticeModal2" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notice">
            
    
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="material-icons">clear</i>
                     </button>
                     <h5 class="modal-title" id="myModalLabel">일정 추가</h5>
                  </div>
                  <div class="modal-body">
                       <div class="card">
                              <div class="card-header card-header-icon"
                                 data-background-color="orange">
                                 <i class="material-icons">mail_outline</i>
                              </div>
                              <div class="card-content">
                                 <h4 class="card-title">쪽지 보내기</h4>
                                 <!-- 쪽지 태그 -->
                                    <div class="form-group label-floating is-empty">
                                        <div class="dataTables_length" id="datatables_length">
                                     <label class="form-group form-group-sm is-empty">보내는 사람 선택
                                     <!-- 아아아아아아아 -->
                                     <select id="students" name="datatables_length" aria-controls="datatables" class="form-control">            
                                </select>                                    
                                     <span class="material-input"></span>
                                     </label> 
                                     &nbsp; &nbsp; &nbsp; &nbsp;
                                     </div>
                                    </div>                           
                                    <textarea cols="50"style="width: 90%; height: 150px; color: gray" id="messageContent" name="messageContent"></textarea>
                                    <br><br>
                                    <button id="sendmessagebtn" class="btn btn-fill btn-warning">쪽지보내기</button>
                              <!-- 쪽지 태그 -->
                              </div>
                        </div>
                      
                      
                  </div>
                  <div class="modal-footer text-center" >
                     <button type="submit" class="btn btn-success btn-simple" >작성</button>
                     <button type="button" class="btn btn-simple" data-dismiss="modal">취소
                        </button>
                     
                  </div>
               
               </div>

               
            </div>
         </div>
         
         <!-- end notice modal -->
                  </div>
                  </div>
                  
                  
     <script type="text/javascript">
                 $(document).ready(function() {      
                    list();
                    function list() {                         
                       $.ajax({ 
                          type: 'post' ,
                          url: '${pageContext.request.contextPath}/messagememberlist.htm', 
                          dataType:'text',
                          data:{classCode:sessionClassCode},
                            success : function(data){
                           $('#students').html(data);                       
                            },
                           error : function(){
                                alert('통신실패!!');
                                alert(title);
                                alert(content);
                            } });
                      }
                 });                 
        </script>