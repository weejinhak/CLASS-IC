<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	var wsocket;
	var msg;
	var sessionId="<%=(String)session.getAttribute("email")%>";
	
	function connect() {

		alert(sessionId);
		console.log(sessionId);
		/* alert("소켓연결!"); */
		wsocket = new WebSocket("ws://192.168.0.155:8090/class_ic/chat-ws.htm?email="+sessionId);
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
				"sendmessage" : sendmessage	,
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
				<!--QR코드  -->

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


					<ul class="dropdown-menu">
						<center>
							<li>

								<div class="photo">
									<img src="../../assets/img/faces/avatar.jpg" class="img-circle"
										width="100" height="100">
								</div>
							<li><br>
								<button class="btn">
									내 회원정보 수정
									<div class="ripple-container"></div>
								</button></li>
							<li><br> <a href="logout.htm">
									<button class="btn">
										로그아웃
										<div class="ripple-container"></div>
									</button>
							</a></li>
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
