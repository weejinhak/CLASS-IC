<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <script type="text/javascript">
	/* 페이지 로드시 출석가져옴!   */
	$(document).ready(function() {
		console.log("페이지가 시작2");

		$.ajax({
			type : 'POST',
			url : 'attendanceTable.htm',
			dataType : 'html',
			data : {
				email : sessionId,
				classcode : '151'
			},
			success : function(data) {
				var attendancelist = [];
				attendancelist = data;
				console.log(attendancelist);
				console.log(attendancelist.AttandanceDTO.attendNo)
			}
		});
	});
</script> -->


<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-icon"
						data-background-color="purple">
						<i class="material-icons">assignment</i>
					</div>
					<div class="card-content">
						<h4 class="card-title">출석출석</h4>
						<div class="toolbar">
							<!--        Here you can write extra buttons/actions for the toolbar              -->
						</div>
						<div class="material-datatables">
							<div id="datatables_wrapper"
								class="dataTables_wrapper form-inline dt-bootstrap">

								<div class="row">
									<div class="col-sm-12">
										<table id="datatables" class="table table-striped table-no-bordered table-hover dataTable dtr-inline"
											cellspacing="0" width="100%" style="width: 100%;" role="grid"
											aria-describedby="datatables_info">
											<thead>
												<tr role="row">
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 225px;">입실시간</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 225px;">퇴실시간</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 114px;">상태</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 50px;">기수</th>
													<th class="sorting" tabindex="0" aria-controls="datatables"
														rowspan="1" colspan="1" style="width: 98px;">일자</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th rowspan="1" colspan="1">입실시간</th>
													<th rowspan="1" colspan="1">퇴실시간</th>
													<th rowspan="1" colspan="1">상태</th>
													<th rowspan="1" colspan="1">기수</th>
													<th rowspan="1" colspan="1">일자</th>
												</tr>
											</tfoot>
											<tbody>

												<tr role="row" class="odd">
													<td tabindex="0" class="sorting_1">000910</td>
													<td tabindex="0" class="sorting_1">001800</td>
													<td>아아아아아</td>
													<td>33</td>
													<td>2008/11/28</td>

												</tr>
												<tr role="row" class="even">
													<td tabindex="0" class="sorting_1">001010</td>
													<td tabindex="0" class="sorting_1">001900</td>
													<td>London</td>
													<td>47</td>
													<td>2009/10/09</td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>

							</div>
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


<script type="text/javascript">
	$(document).ready(function() {
		$('#datatables').DataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
			responsive : true,
			language : {
				search : "_INPUT_",
				searchPlaceholder : "여기서 검색 조진다",
			}

		});

		var table = $('#datatables').DataTable();

		
		
	});
</script>
