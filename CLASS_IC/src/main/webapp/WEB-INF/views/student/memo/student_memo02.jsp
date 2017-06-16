<%--
@Project : CLASS-IC
@File name : student_memo.jsp
@Author : 최은혜
@Data : 2017.06.15
@Desc : 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/resources/assets/css/memo_02.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/memo.css"
	rel="stylesheet" />
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans|Maven+Pro:500'
	rel='stylesheet' type='text/css'>

<div class="content">
	<div class="container-fluid">
		<!-- 내용물  contents  -->
		<div class="row">
			<div class="col-md-12">
				<div class="card" style="height: 900px;">
					<div class="card-header card-header-icon"
						data-background-color="purple">
						<i class="material-icons">assignment</i>
					</div>
					<div class="card-content">
						<h4 class="card-title">memo</h4>
						<div class="toolbar">
							<!--        Here you can write extra buttons/actions for the toolbar              -->
						</div>


						<div class="memo">
							<section class="list-wrap">

								<label for="search-text">Search the memo</label> <input
									type="text" id="search-text" placeholder="search"
									class="search-box"> <span class="list-count"></span>


								<ul id="list">
									<li class="in">Apple pie</li>
									
									<span class="empty-item">no results</span>
								</ul>
							</section>
						</div>

						<div>
							<section class="list-form">
								<div class="container">  
								  <form id="contact" action="" method="post">
								    <h3>memo</h3>
								    <fieldset>
								      <input placeholder="제목" type="text" tabindex="1" required autofocus>
								    </fieldset>
								      <textarea placeholder="메모 작성" tabindex="2" required></textarea>
								    </fieldset>
								    <fieldset>
								      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
								    </fieldset>
								  </form>
  
								</div>
								<!--end wtite form-->

							</section>
						</div>
					</div>
					<!-- end content-->
				</div>
				<!--  end card  -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/memo.js"></script>

</html>