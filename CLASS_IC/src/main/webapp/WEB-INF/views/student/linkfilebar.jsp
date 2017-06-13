 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
 <!--링크,파일 검색 아이콘 -->
  <div id="kakaoConsultWrapper" style="position: fixed; text-align:center; right: 50px; bottom: 303px; z-index: 2050;">
      <button class="btn btn-primary btn-round btn-fab btn-fab-mini"   data-toggle="modal" data-target="#noticeModal" >
                               <i class="material-icons">format_list_numbered</i>
                                    <div class="ripple-container"></div></button>
      <div style="margin-top:10px;">
      
          <button class="btn btn-primary btn-round btn-fab btn-fab-mini"   data-toggle="modal" data-target="#noticeModal2" >
                                      <i class="material-icons">attach_file</i>
                                    <div class="ripple-container"></div></button>
      </div>
    </div>
    
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
							<h5 class="modal-title" id="myModalLabel">링크 검색</h5>
						</div>
						<div class="modal-body">
							<div class="instruction">
							 
								
									<div class="row">
									<div class="col-md-12">
									 
										
									<input type="text" class="form-control" placeholder="링크 검색">
									</div>
								 
								</div>
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">Never
								mind</button>
							<button type="button" class="btn btn-success btn-simple">Yes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end notice modal -->


		</div>
	</div>
 
      <div class="row">
		<div class="col-md-12 text-center">


			<!-- notice modal -->
			<div class="modal fade" id="noticeModal2" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-notice">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="modal-title" id="myModalLabel">파일 검색</h5>
						</div>
						<div class="modal-body">
							<div class="instruction">
								 
								
									<div class="row">
									<div class="col-md-12">
									 
										
									<input type="text" class="form-control" placeholder="파일 검색">
									</div>
								 
								</div>
							</div>
							 
							 
						</div>
						<div class="modal-footer text-center">
							<button type="button" class="btn btn-simple" data-dismiss="modal">Never
								mind</button>
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
 