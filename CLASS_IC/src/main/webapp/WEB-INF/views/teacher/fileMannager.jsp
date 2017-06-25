<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<div align="center">
		<h3>
			<i class="material-icons">assignment</i>교사 통합 관리 페이지
		</h3>
	</div>
	<div class="container-fluid">

		<div class="row">

			<div class="col-md-12">

				<div class="card">
					<div class="card-header card-header-icon"
						data-background-color="purple">
						<i class="material-icons">assignment</i>
					</div>
					
					
					
					<!-- content 시작  -->
					<div class="card-content">
						<h4 class="card-title">integrated management system</h4>
						<div class="toolbar">
							<!--        Here you can write extra buttons/actions for the toolbar              -->
						</div>
						
						<!-- 시작   -->
						<div class="material-datatables">

							<!-- 카테고리 select start -->
							<div class="dataTables_length" id="datatables_length">
								<label class="form-group">카테고리 선택<select
									name="datatables_length" aria-controls="datatables"
									class="form-control input-sm"><option value="10">Web</option>
										<option value="25">Spring</option>
										<option value="50">Java</option>
										<option value="-1">Detabases</option></select> 
								</label>
							</div>
							<!-- 카테고리 select end -->
							
	<!-- 						검색창
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
							
							검색창 끝 -->
							
							<table id="datatables"
								class="table table-striped table-no-bordered table-hover"
								cellspacing="0" width="100%" style="width: 100%">
								<thead>
									<tr>
										<th>글번호</th>
										<th>글내용</th>
										<th>글종류</th>
										<th>작성날짜</th>
										<th class="disabled-sorting text-right">Actions</th>
									</tr>
								</thead>
							<!-- 	<tfoot>
									<tr>
										<th>글번호</th>
										<th>글내용</th>
										<th>글종류</th>
										<th>작성날짜</th>
										<th class="text-right">Actions</th>
									</tr>
								</tfoot> -->
								<tbody>
									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>2011/04/25</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Garrett Winters</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>2011/07/25</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Ashton Cox</td>
										<td>Junior Technical Author</td>
										<td>San Francisco</td>
										<td>2009/01/12</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Cedric Kelly</td>
										<td>Senior Javascript Developer</td>
										<td>Edinburgh</td>
										<td>2012/03/29</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Airi Satou</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>2008/11/28</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Sonya Frost</td>
										<td>Software Engineer</td>
										<td>Edinburgh</td>
										<td>2008/12/13</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Jena Gaines</td>
										<td>Office Manager</td>
										<td>London</td>
										<td>2008/12/19</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Quinn Flynn</td>
										<td>Support Lead</td>
										<td>Edinburgh</td>
										<td>2013/03/03</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Charde Marshall</td>
										<td>Regional Director</td>
										<td>San Francisco</td>
										<td>2008/10/16</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Michael Silva</td>
										<td>Marketing Designer</td>
										<td>London</td>
										<td>2012/11/27</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Paul Byrd</td>
										<td>Chief Financial Officer (CFO)</td>
										<td>New York</td>
										<td>2010/06/09</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Jennifer Chang</td>
										<td>Regional Director</td>
										<td>Singapore</td>
										<td>2010/11/14</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Howard Hatfield</td>
										<td>Office Manager</td>
										<td>San Francisco</td>
										<td>2008/12/16</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Hope Fuentes</td>
										<td>Secretary</td>
										<td>San Francisco</td>
										<td>2010/02/12</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Vivian Harrell</td>
										<td>Financial Controller</td>
										<td>San Francisco</td>
										<td>2009/02/14</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									<tr>
										<td>Timothy Mooney</td>
										<td>Office Manager</td>
										<td>London</td>
										<td>2008/12/11</td>
										<td class="text-right"><a href="#"
											class="btn btn-simple btn-info btn-icon like"><i
												class="material-icons">favorite</i></a> <a href="#"
											class="btn btn-simple btn-warning btn-icon edit"><i
												class="material-icons">mode_edit</i></a> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
								</tbody>
							</table>
						</div>
						
							<!-- 끝   -->
						<!--end material-datatables -->
					</div>
					<!-- end content-->
				</div>
				<!--  end card  -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</div>



<script type="text/javascript">
	$(document).ready(
			function() {
				$('#datatables').DataTable(
						{
							"pagingType" : "full_numbers",
							"lengthMenu" : [ [ 10, 25, 50, -1 ],
									[ 10, 25, 50, "All" ] ],
							responsive : true,
							language : {
								search : "_INPUT_",
								searchPlaceholder : "Search records",
							}

						});

				var table = $('#datatables').DataTable();

				// Edit record
				table.on('click', '.edit', function() {
					$tr = $(this).closest('tr');

					var data = table.row($tr).data();
					alert('You press on Row: ' + data[0] + ' ' + data[1] + ' '
							+ data[2] + '\'s row.');
				});

				// Delete a record
				table.on('click', '.remove', function(e) {
					$tr = $(this).closest('tr');
					table.row($tr).remove().draw();
					e.preventDefault();
				});

				//Like record
				table.on('click', '.like', function() {
					alert('You clicked on Like button');
				});

				$('.card .material-datatables label').addClass('form-group');
			});
</script>

