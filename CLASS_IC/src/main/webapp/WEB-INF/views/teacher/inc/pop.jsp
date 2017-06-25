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
							
 
							
							<table id="datatables"
								class="table table-striped table-no-bordered table-hover"
								cellspacing="0" width="100%" style="width: 100%">
								<thead>
									<tr>
								 
										<th>글제목</th>
										<th>url</th>
										<th>날짜</th>
									 
										<th class="disabled-sorting text-right">Actions</th>
									</tr>
								</thead>
						 
								<tbody>
									<tr>
										<td>글제목 가나다 </td>
									 <td>www.naver.com</td>
										<td>2011/04/25</td>
										<td class="text-right"> <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
									 
								 	<tr>
										<td>글제목 라마바</td>
									  <td>www.naver.com</td>
										<td>2011/04/26</td>
										<td class="text-right">  <a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
										<tr>
										<td>글제목 사아자 </td>
									  <td>www.naver.com</td>
										<td>2011/04/28</td>
										<td class="text-right">
									 
												<a href="#"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>
								</tbody>
							</table>
						</div>
						
							<!-- 끝   -->
	 
			
    <!-- 링크 검색 끝-->  
	
			
	</div>
	<div class="popover-footer ">
		<button type="submit" class="btn btn-sm btn-rose">Submit</button>
		<button type="reset" class="btn btn-sm btn-default">Reset</button>
	</div>
</div>


</nav>



<script type="text/javascript">
    $(document).ready(function() {
        $('#datatables').DataTable({
            "pagingType": "full_numbers",
            "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ],
            responsive: true,
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search records",
            }

        });


        var table = $('#datatables').DataTable();

        // Edit record
        table.on('click', '.edit', function() {
            $tr = $(this).closest('tr');

            var data = table.row($tr).data();
            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
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
