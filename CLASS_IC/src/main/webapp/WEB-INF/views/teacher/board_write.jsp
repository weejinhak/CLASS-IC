<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
.fileDrop {
  width: 25%;
  height: 175px;
  border: 4px dotted;
  background-color: silver;
  margin: auto;
  
}
</style>
	
	
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="col-md-12">
                            <div class="card">
                                <form method="post" action="boardWriteOk.htm" class="form-horizontal">
                                    <div class="card-header card-header-text" data-background-color="rose">
                                        <h4 class="card-title">글 입력하기</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="row">
                                            <label class="col-sm-2 label-on-left">제목 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input name ="lectureTitle" type="text" class="form-control" value="" style="width: 90%">
                                                    <span class="help-block">글의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                            <div class="row">
                                            <label class="col-sm-2 label-on-left">내용 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <textarea name="lectureContent" cols="50" style="width: 90%; height: 300px; color: gray"></textarea>

                                                    <span class="help-block">과제의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        	<br>
                                            <div class="form-group">
												<div class="fileDrop"><h5 align="center"><br><br>Drag and Drop your file!</h5></div>
											</div>

                                       
                                       <div class="td-actions text-center">
                                                        <button type="button" rel="tooltip" class="btn btn-info btn-round" data-original-title="" title="">
                                                            <i class="material-icons">list</i>
                                                        </button>
                                                        <button type="submit" rel="tooltip" class="btn btn-success btn-round" data-original-title="" title="">
                                                            <i class="material-icons">edit</i>
                                                        </button>
                                                        <button type="button" rel="tooltip" class="btn btn-danger btn-round" data-original-title="" title="">
                                                            <i class="material-icons">close</i>
                                                        </button>
                                                        </form>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                        </div>
                                 
                                    </div>
                           
                            </div>
      	 </div>
</div>