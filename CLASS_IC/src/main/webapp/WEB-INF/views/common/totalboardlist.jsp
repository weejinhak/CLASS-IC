<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.class_ic.vo.*"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
console.log('jsp까지 들어옴');
</script>
	<table id="datatables"
							class="table table-striped table-no-bordered table-hover"
							cellspacing="0" width="100%" style="width: 100%">
							<thead>
								<tr>
									<th class="text-center">check</th>
									<th class="text-center">글번호</th>
									<th class="text-center">category</th>
									<th class="text-center">sub category</th>
									<th class="text-center">제목</th>
									<th class="text-center">작성날짜</th>
									<th class="text-center">Actions</th>
								</tr>
							</thead>
						

				<tbody>
						<!-- 여기부터 포문  -->
								<c:forEach var="LectureBoardDTO" items="${bvo}">
									<tr>
										<td>
											<div class="text-center" style="margin-top: -12px;">
												<div class="checkbox" id="" style="float: inherit;">
													<label class="text-center"> <input type="checkbox"
														name="multy[]" value="${LectureBoardDTO.lectureNo}">
														<span class="checkbox-material"></span>
													</label>
												</div>
											</div>
										</td>


										<td class="text-center" id="lectureNo">${LectureBoardDTO.lectureNo}</td>
										<td class="text-center">${LectureBoardDTO.cateCode}</td>
										<td class="text-center">${LectureBoardDTO.subcateCode}</td>

																			 
                                        <td class="text-center"> <a href="totalBoard_contentview.htm?lectureNo=${LectureBoardDTO.lectureNo}"
                                 class="btn btn-simple btn-info btn-icon edit">${LectureBoardDTO.lectureTitle}</a>  </td> 
                                 

										<td class="text-center">${LectureBoardDTO.lectureDate}</td>
										<td class="text-center"><a
											href="totalboardEdit.htm?lectureNo=${LectureBoardDTO.lectureNo}"
											class="btn btn-simple btn-info btn-icon edit"><i
												class="material-icons">edit</i></a> <a
											href="totalBoard_delete.htm?lectureNo=${LectureBoardDTO.lectureNo}"
											class="btn btn-simple btn-danger btn-icon remove"><i
												class="material-icons">close</i></a></td>
									</tr>

								</c:forEach> 


						</table>

						<script type="text/javascript">
					    
						$(document).ready(
								function() {
									
									alert("aa");
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