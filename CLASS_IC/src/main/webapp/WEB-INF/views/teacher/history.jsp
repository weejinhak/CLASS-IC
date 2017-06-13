<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">
	<div class="container-fluid">
		<!-- 내용물  contents  -->

		<br> <br> <br>
		<div class="col-md-10 col-sm-10"></div>
		<div class="col-md-1 col-sm-1">
			<button class="btn btn-primary" data-toggle="modal"
				data-target="#noticeModal">
				<span class="btn-label"> <i class="material-icons">check</i>
				</span> add history
			</button>



		</div>

		<div class="col-md-12">
			<div class="card card-plain">
				<div class="card-content">
					<ul class="timeline">
						<li class="timeline-inverted">
							<div class="timeline-badge danger">
								<i class="material-icons">card_travel</i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<span class="label label-danger">Some Title</span>
								</div>
								<div class="timeline-body">
									<p>Wifey made the best Father's Day meal ever. So thankful
										so happy so blessed. Thank you for making my family We just
										had fun with the “future” theme !!! It was a fun night all
										together ... The always rude Kanye Show at 2am Sold Out Famous
										viewing @ Figueroa and 12th in downtown.</p>
									<hr>
									<div class="dropdown pull-left">
										<button type="button"
											class="btn btn-round btn-danger dropdown-toggle"
											data-toggle="dropdown">
											<i class="material-icons">build</i> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li><a href="#action">수정</a></li>
											<li><a href="#action">삭제</a></li>

										</ul>
									</div>
								</div>

							</div>
						</li>
						<li>
							<div class="timeline-badge success">
								<i class="material-icons">extension</i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<span class="label label-success">Another One</span>
								</div>
								<div class="timeline-body">
									<p>Thank God for the support of my wife and real friends. I
										also wanted to point out that it’s the first album to go
										number 1 off of streaming!!! I love you Ellen and also my
										number one design rule of anything I do from shoes to music to
										homes is that Kim has to like it....</p>
									<hr>
									<div class="dropdown pull-left">
										<button type="button"
											class="btn btn-round btn-success dropdown-toggle"
											data-toggle="dropdown">
											<i class="material-icons">build</i> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li><a href="#action">수정</a></li>
											<li><a href="#action">삭제</a></li>

										</ul>
									</div>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-badge info">
								<i class="material-icons">fingerprint</i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<span class="label label-info">Another Title</span>
								</div>
								<div class="timeline-body">
									<p>Called I Miss the Old Kanye That’s all it was Kanye And
										I love you like Kanye loves Kanye Famous viewing @ Figueroa
										and 12th in downtown LA 11:10PM</p>
									<p>What if Kanye made a song about Kanye Royère doesn't
										make a Polar bear bed but the Polar bear couch is my favorite
										piece of furniture we own It wasn’t any Kanyes Set on his
										goals Kanye</p>
									<hr>
									<div class="dropdown pull-left">
										<button type="button"
											class="btn btn-round btn-info dropdown-toggle"
											data-toggle="dropdown">
											<i class="material-icons">build</i> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li><a href="#action">수정</a></li>
											<li><a href="#action">삭제</a></li>

										</ul>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-badge warning">
								<i class="material-icons">flight_land</i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<span class="label label-warning">Another One</span>
								</div>
								<div class="timeline-body">
									<p>Tune into Big Boy's 92.3 I'm about to play the first
										single from Cruel Winter Tune into Big Boy's 92.3 I'm about to
										play the first single from Cruel Winter also to Kim’s hair and
										makeup Lorraine jewelry and the whole style squad at Balmain
										and the Yeezy team. Thank you Anna for the invite thank you to
										the whole Vogue team</p>
									<hr>
									<div class="dropdown pull-left">
										<button type="button"
											class="btn btn-round btn-warning dropdown-toggle"
											data-toggle="dropdown">
											<i class="material-icons">build</i> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu dropdown-menu-right" role="menu">
											<li><a href="#action">수정</a></li>
											<li><a href="#action">삭제</a></li>

										</ul>
									</div>
								</div>
							</div>
						</li>
					</ul>
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
								<h5 class="modal-title" id="myModalLabel">히스토리 추가</h5>
							</div>
							<div class="modal-body">

								<div class="row">
									<div class="form-group">
										<div class="col-sm-12">

											<input type="text" class="form-control" placeholder="과정명">
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">


											<fieldset>
												<div class="form-group">

													<div class="col-sm-12">
														<textarea class="form-control" placeholder="히스토리 내용 입력"
															rows="3"></textarea>
													</div>
												</div>
											</fieldset>
										</div>

									</div>
								</div>


							</div>
							<div class="modal-footer text-center">
								<button type="button" class="btn btn-simple"
									data-dismiss="modal">Never mind</button>
								<button type="button" class="btn btn-success btn-simple">Yes</button>
							</div>
						</div>
					</div>
				</div>
				<!-- end notice modal -->
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>