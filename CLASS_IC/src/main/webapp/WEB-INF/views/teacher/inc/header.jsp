<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="${pageContext.request.contextPath}/resources/assets/css/chat.css" rel="stylesheet" />
<nav class="navbar navbar-transparent navbar-absolute">
			<div class="container-fluid">

				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
					<li>[ ${sessionScope.name } ]님 강의실 입장 </li>
						<!--  선생님 통합 관리 -->
						<li><a href="#pablo" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">note_add</i>
						</a></li>
						<!--  선생님 통합 관리  끝-->


						<!--쪽지 알람  -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">notifications</i>
								<span class="notification">5</span>
								<p class="hidden-lg hidden-md">
									Notifications <b class="caret"></b>
								</p>
						</a>
							<ul class="dropdown-menu">
								

							<!-- 원하는 html 여기에 넣엉 -->



							</ul></li>
						<!--쪾찌 끝  -->

						<!--북마크  -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">book</i>

						</a>
							<ul class="dropdown-menu">
								<li><a href="#">북마크</a></li>
								<li><a href="#">북마크</a></li>
								<li><a href="#">북마크</a></li>
								<li><a href="#">북마크</a></li>
								<li><a href="#">북마크</a></li>
							</ul></li>

						<!--북마크 끝  -->


						<li><a href="#pablo" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="material-icons">brightness_low</i>
								<p class="hidden-lg hidden-md">option</p>
						</a>


							<ul class="dropdown-menu">
								<center>
									<li>

										<div class="photo">
											<img src="../../assets/img/faces/avatar.jpg" class="img-circle"
												width="100" height="100">
										</div>
									<li><br>
										<button class="btn">
											내 회원정보 수정
											<div class="ripple-container"></div>
										</button></li>
									<li><br>
									<a href="logout.htm">
										<button class="btn">
											로그아웃
											<div class="ripple-container"></div>
										</button>
										</a>
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
						<button type="submit"
							class="btn btn-white btn-round btn-just-icon">
							<i class="material-icons">search</i>
							<div class="ripple-container"></div>
						</button>
					</form>
				</div>
			</div>
		</nav>
<script src="${pageContext.request.contextPath}/resources/assets/js/chat.js"></script>
    