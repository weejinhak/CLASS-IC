<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">
	<div class="container-fluid">
		<!-- 내용물  contents  -->
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="orange">
						<i class="material-icons">mood</i>
					</div>
					<div class="card-content">
						<p class="category">남은 수업일수</p>
						<h3 class="card-title">D-137</h3>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons text-danger">warning</i> <a
								href="#pablo">Get More Space...</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="rose">
						<i class="material-icons">done</i>
					</div>
					<div class="card-content">
						<p class="category">오늘 출석자</p>
						<h3 class="card-title">15/30</h3>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">local_offer</i> Tracked from Google
							Analytics
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="green">
						<i class="material-icons">public</i>
					</div>
					<div class="card-content">
						<p class="category">현재 이산화탄소 농도</p>
						<h3 class="card-title">$34,245</h3>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">date_range</i> Last 24 Hours
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card card-stats">
					<div class="card-header" data-background-color="blue">
						<i class="fa fa-clock-o"></i>
					</div>


					<div id="clock" class="light">
						<div class="display">
							<div class="date"></div>
							<div class="digits"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div class="row">
			<div class="col-md-6">
				<div class="card card-chart">
					<div class="card-header" data-background-color="rose"
						data-header-animation="true">
						<div class="ct-chart" id="websiteViewsChart"></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title="Refresh">
								<i class="material-icons">refresh</i>
							</button>
							<button type="button" class="btn btn-default btn-simple"
								rel="tooltip" data-placement="bottom" title="Change Date">
								<i class="material-icons">edit</i>
							</button>
						</div>
						<h4 class="card-title">Website Views</h4>
						<p class="category">Last Campaign Performance</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card card-chart">
					<div class="card-header" data-background-color="blue"
						data-header-animation="true">
						<div class="ct-chart" id="completedTasksChart"></div>
					</div>
					<div class="card-content">
						<div class="card-actions">
							<button type="button"
								class="btn btn-danger btn-simple fix-broken-card">
								<i class="material-icons">build</i> Fix Header!
							</button>
							<button type="button" class="btn btn-info btn-simple"
								rel="tooltip" data-placement="bottom" title="Refresh">
								<i class="material-icons">refresh</i>
							</button>
							<button type="button" class="btn btn-default btn-simple"
								rel="tooltip" data-placement="bottom" title="Change Date">
								<i class="material-icons">edit</i>
							</button>
						</div>
						<h4 class="card-title">Completed Tasks</h4>
						<p class="category">Last Campaign Performance</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> campaign sent 2 days
							ago
						</div>
					</div>
				</div>
			</div>
			<textarea>Hello~ My name is so hyeon! </textarea>
			<div id="create">+</div>
		</div>
	</div>
</div>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
 --><script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.initVectorMap();
    });
</script>

