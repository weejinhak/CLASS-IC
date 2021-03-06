<!--
	@Project : CLASS-IC
	@File Name : login.jsp
	@Author : 이현정
	@Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CLASS-IC LOGIN</title>
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
</head>

<body>
   
   [css 테스트 목록]<br/>
   [공톷페이지] <br/><!-- 기수선택 추가 6/17 -->
    <a href="common/select.htm">thsSelect</a> <br/>
    <a href="common/select_teacher.htm">thsSelect_teacher</a> <br/>
     <a href="common/select_student.htm">thsSelect_student</a> <br/>
   [선생 페이지]<br/>
   <a href="teacher/test1.htm"> attandance_edit</a> <br/>
   <a href="teacher/test2.htm"> student</a> <br/>
<!--    <a href="stable.htm?authority="+"ROLE_STUDENT"> student group 아 쫌</a> <br/> -->
   <!--  <a href="teacher/stable.htm"> student group</a> <br/> -->
    <a href="teacher/sgroup.htm"> student group</a>개피곤 <br/>
   <a href="teacher/test4.htm"> board_content</a> <br/>
   <a href="teacher/test5.htm"> board_details_view</a> <br/>
   <a href="teacher/test6.htm"> board_details</a> <br/>
   <a href="teacher/test7.htm">board_homework_content</a> <br/>
   <a href="teacher/boardlecture.htm"> board</a> <br/>
   <a href="teacher/test9.htm"> Calendar</a> <br/>
   <a href="teacher/test10.htm"> class_condition</a> <br/>
   <a href="teacher/test11.htm">History</a> <br/>
   <a href="teacher/test12.htm"> homework_board</a> <br/>
   <a href="teacher/test13.htm"> message</a> <br/>
   <a href="teacher/test14.htm"> teacher_main</a> <br/>
   <a href="teacher/test15.htm"> fileManager</a> <br/>
   
   write와 main은 test용으로 내가 별도로 만든거니 체크 안해도 됨<br/>
   
   [학생 CSS 체크]<br/>
   <a href="student/test1.htm"> attendance_edit</a> <br/>
   <a href="student/test2.htm"> attendance</a> <br/>
   <a href="student/test3.htm">attandance_check</a><br/>
   <a href="student/test4.htm"> board_details_view</a> <br/>
   <a href="student/test5.htm"> board_details</a> <br/>
   <a href="student/test6.htm">board_homework_content</a> <br/>
   <a href="student/test7.htm"> board</a> <br/>
   <a href="student/test8.htm"> calendar</a> <br/>
   <a href="student/test9.htm"> class_condition</a> <br/>
   <a href="student/test10.htm">History</a> <br/>
   <a href="student/test11.htm"> homework_board</a> <br/>
   <a href="student/test12.htm">linkfilebar</a> <br/>
   <a href="student/test13.htm"> memo_content</a> <br/>
   <a href="student/test14.htm"> student_main</a> <br/>
   <a href="student/test15.htm"> student_memo</a> <br/>
   <a href="student/test16.htm"> student_message</a> <br/>
   <a href="student/test17.htm"> 데이터 시트</a> <br/>
  	main와 student은 test용으로 내가 별도로 만든거니 체크 안해도 됨<br/>
   
   
   
   
   
   <br/><br/>
   
   
   타일즈: <a href="teacher/main.htm">선생님 페이지</a> <br/>
   타일즈 : <a href="student/main.htm">학생 페이지</a> <br/>
   
   
   
   
    <div class="wrapper wrapper-full-page">
        <div class="full-page login-page" filter-color="black" data-image="${pageContext.request.contextPath}/resources/assets/img/login.jpeg">
            <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        
                		 <form action="loginOk.htm" method="POST">
                                <div class="card card-login card-hidden">
                                    <div class="card-header text-center" data-background-color="rose">
                                                     <h3 class="card-title">Login</h3>
                                       
                                    </div>
                                    <p class="category text-center">
                                        Class intelligent Command 
                                        
                                    </p>
                                    
                                    <div class="card-content">
                             <br>
                            
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">email</i>
                                            </span>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Email address</label>
                                                <input type="email" class="form-control"  id="email" name="email">
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Password</label>
                                                <input type="password" class="form-control" id="pwd" name="pwd">
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="footer text-center">
                                       <button class="btn btn-rose" type="submit">Login </button>
                                    </div>
                                </div> 
                                 </form>     
                                	<a href="join.htm">회원가입 링크</a>           
                        </div>
                       
                    </div>
                </div>
            </div>
        
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/material.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
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
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>
<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>

</html>