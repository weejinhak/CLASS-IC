<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>CLASS-IC</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- common header -->
<jsp:include page="inc/common_header.jsp"></jsp:include>

</head>

<body>
    <div class="wrapper wrapper-full-page">
    
        <div class="full-page login-page" filter-color="black" data-image="../../assets/img/login.jpeg">
            <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
           
            <div class="content">
               

	<div class="col-xs-3"></div>
	<div class="col-xs-6"><button class="btn btn-success" data-toggle="modal" data-target="#noticeModal">
                                        <span class="btn-label">
                                            <i class="material-icons">check</i>
                                        새로운 기수 만들기
                                    </button>
		<div class="row">

			<div class="col-md-4">
				<div class="card card-chart" data-count="3">
					<div class="card-header" data-background-color="blue"
						data-header-animation="true" >
						<div align="center">
						<h3 class="card-title" >
							<br>KOSTA 151 기
						</h3></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title=""
								data-original-title="go!" >
								<i class="material-icons">input</i>
							</button>
						
						</div>
						
						<br>
						<p class="category">
							환영 합니다.
						</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card card-chart" data-count="4">
					<div class="card-header" data-background-color="rose"
						data-header-animation="true">
						
						<div align="center">
						<h3 class="card-title" >
							<br>KOSTA 152기
						</h3></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title=""
								data-original-title="go!">
								<i class="material-icons">input</i>
							</button>
						</div>
					
						<br>
						<p class="category">
							환영 합니다.
						</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card card-chart" data-count="4">
					<div class="card-header" data-background-color="red"
						data-header-animation="true">
						
						<div align="center">
						<h3 class="card-title" >
							<br>통합 관리
							<br>페이지
						</h3></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title=""
								data-original-title="go!">
								<i class="material-icons">input</i>
							</button>
						</div>
					
						<br>
						<p class="category">
							 통합 관리 페이지로 이동.
						</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<div class="col-xs-3"></div>

</div>
</div>
</div>

         	<!-- 모달  -->
	<div class="row">
		<div class="col-md-12 text-center">


			<!-- notice modal -->
			<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">과정 추가</h5>
						</div>
						<div class="modal-body">
							<div class="instruction">
								<div class="row">
									<div class="col-md-12"> 
										
									<div class="form-group">
                                        <label class="label-control">과정 시작일</label>
                                        <input type="text" class="form-control datepicker" >
                                    <span class="material-input"></span></div>
									</div>
								 
								</div>
										<div class="row">
									<div class="col-md-12"> 
										
									<div class="form-group">
                                        <label class="label-control">과정 최종일</label>
                                        <input type="text" class="form-control datepicker" >
                                    <span class="material-input"></span></div>
									
									</div>
								 
								</div>
								
									<div class="row">
									<div class="col-md-12">
									 
										
									<input type="text" class="form-control" placeholder="과정 이름">
									</div>
								 
								</div>
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">Never
								mind</button>
							<button type="button" class="btn btn-success btn-simple">Yes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end notice modal -->
                  </div>
                  </div>
</body>
<!-- common footer -->
<jsp:include page="inc/common_footer.jsp"></jsp:include>
<script type="text/javascript">

    $().ready(function() {
        demo.checkFullPageBackgroundImage();
        demo.initFormExtendedDatetimepickers();
        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
</html>