<!--
   @Project : CLASS-IC
   @File Name : joinus.jsp
   @Author : 이현정
   @Date : 2017.06.15
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>CLASS-IC 회원가입</title>

<link rel='stylesheet prefetch'
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
<link rel='stylesheet prefetch'
   href='https://fonts.googleapis.com/icon?family=Material+Icons'>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<!-- 프로필 사진 추가 -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/photo.css">
</head>

<body>

   <div class="cotn_principal">
      <div class="cont_centrar">

         <div class="cont_login">
            <div class="cont_info_log_sign_up">
               <div class="col_md_login">
                  <div class="cont_ba_opcitiy">

                     <h2>Student</h2>
                     <p>Sign up as a student.</p>
                     <button class="btn_login" onclick="cambiar_login()">Sign
                        up now</button>
                  </div>
               </div>
               <div class="col_md_sign_up">
                  <div class="cont_ba_opcitiy">
                     <h2>Teacher</h2>


                     <p>Sign up as a teacher.</p>

                     <button class="btn_sign_up" onclick="cambiar_sign_up()">Sign
                        up now</button>
                  </div>
               </div>
            </div>


            <div class="cont_back_info">
               <div class="cont_img_back_grey">
                  <img
                     src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
                     alt="" />
               </div>

            </div>
            <div class="cont_forms">
               <div class="cont_img_back_">
                  <img
                     src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
                     alt="" />
               </div>
               <form id="join_student" action="${pageContext.request.contextPath}/join_st.htm" method="POST" enctype="multipart/form-data">              		
               <div class="cont_form_login">
                  <a href="#" onclick="ocultar_login_sign_up()"><i
                     class="material-icons">&#xE5C4;</i></a>
                  <h2>Sign up as a Student</h2>
               		<!-- 사진 업로드 시작 -->
                     <div id='profile-upload'>
					 <div class="hvr-profile-img">
					  <input type="file" name="files[0]" id='getval'  class="upload w180" title="Dimensions 180 X 180" id="imag"></div>
					  <i class="material-icons">camera_enhance</i>
					  </div>
                     <!-- 사진 업로드 끝 -->
                     <input type="text" id="email_st" name="email" placeholder="Email" />
                     <input type="text" id="name_st" name="name" placeholder="User" /> 
                     <input type="password" id="pwd_st" name="pwd" placeholder="Password" /> 
                     <input type="password" id="pwdconfirm_st" name="pwdconfirm" placeholder="Confirm Password" />
                     <input type="text" id="phone_st" name="phone" placeholder="PhoneNumber" />
                     <!-- <input type="file" id="photoSrc_st" name="files" aceholder="imgSrc" />  -->
                     
                     <input type="hidden" id="authority_st" name="authority" value="ROLE_STUDENT" />
                     <button class="btn_login" id="btn_submit_st" type="submit">let's go</button>
               </div>
               </form>
				<!-- student -->
				<form id="join_teacher" action="${pageContext.request.contextPath}/join_te.htm" method="POST" enctype="multipart/form-data">
               <div class="cont_form_sign_up">
                  <br> <br> <br> <a href="#"
                     onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                  <h2>Sign up as a Teacher</h2>
                  <!-- 사진 업로드 시작 -->
                     <div id='profile-upload2'>
						<div class="hvr-profile-img">
						<input type="file" name="files[0]" id='getval2'  class="upload w180" title="Dimensions 180 X 180" id="imag"></div>
						<i class="material-icons">camera_enhance</i>
					 </div>
                     <!-- 사진 업로드 끝 -->
                  <input type="text" id="email_te" name="email" placeholder="Email" />
                  <input type="text" id="name_te" name="name" placeholder="User" /> <input
                     type="password" id="pwd_te" name="pwd" placeholder="Password" /> <input
                     type="password" id="pwdconfirm_te" name="pwdconfirm"
                     placeholder="Confirm Password" /> 
                     <input type="text" id="phone_te"
                     name="phone" placeholder="PhoneNumber" /> 
                     <!-- <input type="text"
                     id="photoSrc_te" name="photoSrc" placeholder="imgSrc" />  -->
                     <input
                     type="hidden" id="authority_te" name="authority"
                     value="ROLE_TEACHER" />
                  <button class="btn_sign_up" id="btn_submit_te" type="submit">Let's
                     go</button>
                  
               </div>
               </form>
				<!-- teacher -->
            </div>

         </div>
      </div>
   </div>

   <script
      src="${pageContext.request.contextPath}/resources/assets/js/join.js"></script>
 <!-- 사진 추가부분 -->
 <script
      src="${pageContext.request.contextPath}/resources/assets/js/photo.js"></script>
</body>
<!--   Core JS Files   -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.1.1.min.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.min.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/material.min.js"
   type="text/javascript"></script>

<script
   src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js"
   type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.js"></script>
<!--   Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>


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