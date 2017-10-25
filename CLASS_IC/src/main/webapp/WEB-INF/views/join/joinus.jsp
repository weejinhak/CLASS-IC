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

                     <h2>학생</h2>
                     <p>학생으로 회원가입</p>
                     <button class="btn_login" onclick="cambiar_login()">회원가입</button>
                  </div>
               </div>
               <div class="col_md_sign_up">
                  <div class="cont_ba_opcitiy">
                     <h2>강사</h2>
                     <p>강사 회원가입</p>
                     <button class="btn_sign_up" onclick="cambiar_sign_up()">회원가입</button>
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
                  <h2>학생 회원가입</h2>
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
                     <button class="btn_login" id="btn_submit_st" type="submit">가입하기</button>
               </div>
               </form>
				<!-- student -->
				<form id="join_teacher" action="${pageContext.request.contextPath}/join_te.htm" method="POST" enctype="multipart/form-data">
               <div class="cont_form_sign_up">
                  <a href="#"
                     onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                  <h2>강사 회원가입</h2>
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
                  <button class="btn_sign_up" id="btn_submit_te" type="submit">가입하기</button>
                  
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
<!--  Plugin for the Wizard -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.bootstrap-wizard.js"></script>

<!-- DateTimePicker Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datetimepicker.js"></script>

<!-- Select Plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script
   src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.js"></script>



<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

jQuery( function($) { 


   var re_id = /^[a-z0-9_-]{2,10}$/; // 아이디 검사식
   var re_pw = /^(?=.*[a-zA-Z]+)(?=.*[0-9]+).{6,}$/; // 비밀번호 검사식 영문+숫자
   var re_pw_R = /^(?=.*[a-zA-Z]+)(?=.*[0-9]+).{6,}$/; // 비밀번호 확인 검사식 영문+숫자 
   var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
   var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
   var re_tel = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/; // 전화번호 검사식 010-9717-7858
   
   
   var 
      form = $('.form'), 
      uid = $('#uid'), 
      pwd_st = $('#pwd_st'), 
      pwdconfirm_st = $('#pwdconfirm_st'),
      email_st = $('#email_st'), 
      url = $('#url'), 
      phone_st = $('#phone_st'),
      //
      form2 = $('.form2'), 
      uid2 = $('#uid2'), 
      pwd_te = $('#pwd_te'), 
      pwdconfirm_te = $('#pwdconfirm_te'),
      email_te = $('#email_te'), 
      url2 = $('#url2'), 
      phone_te = $('#phone_te');
      

   form.submit( function() {
      if (re_id.test(uid.val()) != true) { // 아이디 검사
         alert('[ID 입력 오류] 유효한 ID를 입력해 주세요.');
         uid.focus();
         return false;
      } else if(re_pw.test(upw.val()) != true) { // 비밀번호 검사
         alert('[PW 입력 오류] 유효한 PW를 입력해 주세요.');
         upw.focus();
         return false;
      } else if(re_mail.test(mail.val()) != true) { // 이메일 검사
         alert('[Email 입력 오류] 유효한 이메일 주소를 입력해 주세요.');
         mail.focus();
         return false;
      } else if(re_url.test(url.val()) != true) { // URL 검사
         alert('[Web 입력 오류] 유효한 웹 사이트 주소를 입력해 주세요.');
         url.focus();
         return false;
      } else if(re_tel.test(tel.val()) != true) { // 전화번호 검사
         alert('[Tel 입력 오류] 유효한 전화번호를 입력해 주세요.');
         tel.focus();
         return false;
      }
   });

   $('#uid, #pwd_st ,#pwdconfirm_st, #email_st, #phone_st').after('<strong style="color:#CC3D3D;FONT-SIZE:5px"></strong>');
   
   email_st.keyup(function(){
      var s = $(this).next('strong');
      if (email_st.val().length == 0) { // 입력 값이 없을 때
         s.text('');
      }// strong 요소에 포함된 문자 지움
      else if( re_mail.test(email_st.val()) != true ){ // 유효하지 않은 문자 입력 시
         s.text('이메일형식에 일치하지 않습니다.');
      
      }else if( re_mail.test(email_st.val()) == true ){
         
      }
   });
   // #uid 인풋에서 onkeyup 이벤트가 발생하면
   uid.keyup( function() {
      var s = $(this).next('strong'); // strong 요소를 변수에 할당
      if (uid.val().length == 0) { // 입력 값이 없을 때
         s.text(''); // strong 요소에 포함된 문자 지움
      } else if (uid.val().length < 3) { // 입력 값이 3보다 작을 때
         s.text('※Caution!,3개보다 긴 비밀번호가 필요합니다.'); // strong 요소에 문자 출력
      } else if (uid.val().length > 16) { // 입력 값이 16보다 클 때
         s.text('※Caution! 너무 깁니다.'); // strong 요소에 문자 출력
      } else if ( re_id.test(uid.val()) != true ) { // 유효하지 않은 문자 입력 시
         s.text('유효한 문자를 입력해 주세요.'); // strong 요소에 문자 출력
      } else { // 입력 값이 3 이상 16 이하일 때
         s.text('correct!'); // strong 요소에 문자 출력
      }
   });
   
   // #upw 인풋에서 onkeyup 이벤트가 발생하면
   pwd_st.keyup( function() {
      var s = $(this).next('strong'); // strong 요소를 변수에 할당
      if (pwd_st.val().length == 0) { // 입력 값이 없을 때
         s.text(''); // strong 요소에 포함된 문자 지움
      } else if (pwd_st.val().length < 6) { // 입력 값이 6보다 작을 때
         s.text('※Caution!, 6자 이상의 비밀번호 입력하세요'); // strong 요소에 문자 출력
      } else if (pwd_st.val().length > 18) { // 입력 값이 18보다 클 때
         s.text('※Caution!, 비밀번호가 너무 깁니다.'); // strong 요소에 문자 출력
      } else { // 입력 값이 6 이상 18 이하일 때
         s.text('Correct! 적합합니다.'); // strong 요소에 문자 출력
      }
   });
   
   pwdconfirm_st.keyup( function() {
	      var s = $(this).next('strong'); // strong 요소를 변수에 할당
	      if (pwdconfirm_st.val().length == 0) { // 입력 값이 없을 때
	         s.text(''); // strong 요소에 포함된 문자 지움
	      }else if (pwdconfirm_st.val()==pwd_st.val()){
	         s.text('Correct! 위 비밀번호와 같습니다.');
	      }else{
	    	  s.text('※Caution!,위 비밀번호와 다릅니다.');
	      }
	   });
   

   //FROM2
   ///////////////////////////////////////////////////////////
   form2.submit( function() {
      if (re_id.test(uid2.val()) != true) { // 아이디 검사
         alert('[ID 입력 오류] 유효한 ID를 입력해 주세요.');
         uid2.focus();
         return false;
      } else if(re_pw.test(upw2.val()) != true) { // 비밀번호 검사
         alert('[PW 입력 오류] 유효한 PW를 입력해 주세요.');
         upw2.focus();
         return false;
      } else if(re_mail.test(mail2.val()) != true) { // 이메일 검사
         alert('[Email 입력 오류] 유효한 이메일 주소를 입력해 주세요.');
         mail2.focus();
         return false;
      } else if(re_url.test(url2.val()) != true) { // URL 검사
         alert('[Web 입력 오류] 유효한 웹 사이트 주소를 입력해 주세요.');
         url2.focus();
         return false;
      } else if(re_tel.test(tel2.val()) != true) { // 전화번호 검사
         alert('[Tel 입력 오류] 유효한 전화번호를 입력해 주세요.');
         tel2.focus();
         return false;
      }
   });
   

   $('#uid2, #pwd_te ,#pwdconfirm_te, #email_te, #phone_te').after('<font size=1></font>');
   
 
   email_te.keyup(function(){
      var s = $(this).next('font');
      if (email_te.val().length == 0) { // 입력 값이 없을 때
         s.text('');
      }// strong 요소에 포함된 문자 지움
      else if( re_mail.test(email_te.val()) != true ){ // 유효하지 않은 문자 입력 시
         s.html('<br>이메일형식에 일치하지 않습니다.');
      
      }else if( re_mail.test(email_te.val()) == true ){
         
      }
   });
   // #uid 인풋에서 onkeyup 이벤트가 발생하면
   uid2.keyup( function() {
      var s = $(this).next('font'); // strong 요소를 변수에 할당
      if (uid2.val().length == 0) { // 입력 값이 없을 때
         s.text(''); // strong 요소에 포함된 문자 지움
      } else if (uid2.val().length < 3) { // 입력 값이 3보다 작을 때
         s.text('※Please, write more longer'); // strong 요소에 문자 출력
      } else if (uid2.val().length > 16) { // 입력 값이 16보다 클 때
         s.text('※Please, write more shorter'); // strong 요소에 문자 출력
      } else if ( re_id.test(uid2.val()) != true ) { // 유효하지 않은 문자 입력 시
         s.text('유효한 문자를 입력해 주세요.'); // strong 요소에 문자 출력
      } else { // 입력 값이 3 이상 16 이하일 때
         s.text('correct!'); // strong 요소에 문자 출력
      }
   });

   pwdconfirm_te.keyup( function() {
	      var s = $(this).next('font'); // strong 요소를 변수에 할당
	      if (pwdconfirm_te.val().length == 0) { // 입력 값이 없을 때
	         s.text(''); // strong 요소에 포함된 문자 지움
	      }else if (pwdconfirm_te.val()==pwd_te.val()){
	         s.text('Correct! 위 비밀번호와 같습니다.');
	      }else{
	    	  s.text('※Caution!,위 비밀번호와 다릅니다.');
	      }
	   });


   phone_te.keyup( function() {
      
      var s = $(this).next('font');
      if (phone_te.val().length == 0) { // 입력 값이 없을 때
         s.text('');
      }// strong 요소에 포함된 문자 지움
      else if( re_tel.test(phone_te.val()) != true ){ // 유효하지 않은 문자 입력 시
         s.text('※Please, Confirm your tel number');
      
      }else if( re_tel.test(phone_te.val()) == true ){
         s.text('correct!');
      }
      
      });

});

</script>

</html>