<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
 
 
 <nav>
<div align="right">

	<button id="linkbtn" class="btn btn-just-icon btn-round btn-dribbble  "
		data-toggle="popover-x" data-target="#myPopover30a"
		data-placement="left left-top">
		<i class="material-icons">label_outline</i>
	</button>

</div>

<!--popover-->
<div id="myPopover30a" class="popover popover-rose ">

	<h3 class="popover-title">
		<span class="close pull-right" data-dismiss="popover-x">&times;</span>Title
	</h3>
	<div class="popover-content">
	<!-- 링크 검색-->  
	
	
	<h4 class="card-title">integrated management system</h4>
						<div class="toolbar">
							<!--        Here you can write extra buttons/actions for the toolbar              -->
						</div>
						
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
								<tfoot>
									<tr>
										<th>글번호</th>
										<th>글내용</th>
										<th>글종류</th>
										<th>작성날짜</th>
										<th class="text-right">Actions</th>
									</tr>
								</tfoot>
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
						
			
    <!-- 링크 검색 끝-->  
	
			
	</div>
	<div class="popover-footer ">
		<button type="submit" class="btn btn-sm btn-rose">Submit</button>
		<button type="reset" class="btn btn-sm btn-default">Reset</button>
	</div>
</div>


</nav>


