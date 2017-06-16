<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resourcesassets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resourcesassets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Material Dashboard Pro by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resourcesassets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="${pageContext.request.contextPath}/resourcesassets/css/material-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/resourcesassets/css/demo.css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/pop.css"
	rel="stylesheet" />
<link href="//goo.gl/mTc43h" rel="stylesheet">
        

<link href="//goo.gl/mTc43h" rel="stylesheet">
        	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
</head>

<body>
<div class=pop>
        <div class="main-panel">
       
            <div class="content">
                <div class="container-fluid">
                    
                    <div class="row">
                       
                     
                        <div class="col-md-12">
                                 
                                            <button class="btn btn-raised btn-round btn-info" data-toggle="modal" data-target="#noticeModal">
                                              <i class="material-icons">link</i>
                                            </button>
                                  
                                     
                                            <!-- notice modal -->
                                            <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-notice">
                                                    <div class="modal-content">
                                                        <div class="modal-header" style="padding-bottom: 10px;">
<div class="X">
<input type="search" id="iS" onkeyup="fS()" placeholder="Search names...">

<ul id="sU">
  <li><a href="#" class="lH">A</a></li>
  <li><a href="#">Adele</a></li>
  <li><a href="#">Agnes</a></li>
  <li><a href="#">Ana</a></li>
  <li><a href="#">Angela</a></li>

  <li><a href="#" class="lH">B</a></li>
  <li><a href="#">Billy</a></li>
  <li><a href="#">Bob</a></li>
  <li><a href="#">Burro</a></li>
  <li><a href="#">Bruno</a></li>

  <li><a href="#" class="lH">C</a></li>
  <li><a href="#">Calvin</a></li>
  <li><a href="#">Christina</a></li>
  <li><a href="#">Cindy</a></li>
  <li><a href="#">Curry</a></li>

  <li><a href="#" class="lH">D</a></li>
  <li><a href="#">Daril</a></li>
  <li><a href="#">Denver</a></li>
  <li><a href="#">Dewil</a></li>
  <li><a href="#">Dude</a></li>
</ul>

</div>




                                             </div>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end notice modal -->
                            
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resourcesassets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resourcesassets/js/material.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resourcesassets/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="${pageContext.request.contextPath}/resourcesassets/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/sweetalert2.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resourcesassets/js/demo.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/pop.js"></script>
</html>