<!--
	@Project : CLASS-IC
	@File Name : memberPwChg.jsp
	@Author : 은영
	@Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CLASS-IC</title>
 <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/material-dashboard.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />

 <link href="${pageContext.request.contextPath}/resources/assets/css/login.css" rel="stylesheet" />
 
</head>

<script type="text/javascript">
$(function(){
	$('#memberChkBtn').click(function(){
		if($('#memberEmail').val()==""){
			alert('이메일 주소(아이디)를 입력해주세요.');
			$('#memberPw').focus();
			return;
		}
		if($('#memberPhone').val()==""){
			alert('가입한 전화번호를 입력해 주세요 .');
			$('#memberPhone').focus();
			return;
		}
	  
		$('#frm').submit();
	});
});
</script>

<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert('이메일이 전송되었습니다 .');
	 /* 맨 처음 로그인 페이지로 이동  */
	</script>
</c:if>

<body>
  <div id="particles-js">
  <div id="formpz">
	<!-- <img src="resources/assets/img/login_bg.jpg"> -->
	 <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                         <!-- 폼 태그  -->
                            <form id="frm" method="post" action="memberCheck.htm">
							
                                <div class="card card-login card-hidden">
                                    <div class="card-header text-center" data-background-color="rose">
                                    
                                                     <h3 class="card-title">비밀번호 변경 본인확인</h3>
                                   
                                    </div>
                                    <p class="category text-center">
                                        
                                        
                                    </p>
                                    <div class="card-content">
                             <br><center> 
                             <h6 class="card-title">본인 확인을 위한 정보를 입력해 주세요</h6></center>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">email</i>
                                            </span>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Email address</label>
                                                <input type="email" class="form-control"  id="memberEmail" name=memberEmail placeholder="ex) class_ic@gmail.com" />
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Phone number</label>
                                                <input type="text" class="form-control"   id="memberPhone" name=memberPhone placeholder="ex) 010-1111-1234" />
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="footer text-center">
                                       <button class="btn btn-rose" type="submit" id="memberChkBtn">본인 인증</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
  </div>
  </div>

<script src="${pageContext.request.contextPath}/resources/assets/js/login.js" type="text/javascript"></script>
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