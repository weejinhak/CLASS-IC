<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



           <div class="col-lg-12 col-md-12" style="height: 100px"></div>
<div class="row" style="padding-left: 150px ; padding-right: 150px">
                    
                    <!--Spring-->
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="orange">
                                    <h4 class="card-title">Spring</h4>
                          			 <p class="category">New employees on 15th September, 2016</p> 
                                </div>
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <tr><th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                        </tr></thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                      <div align="center">
                                      <!-- board details view 보여주지  -->
                                      <a href="${pageContext.request.contextPath}/teacher/lectureboard.htm"><button type="button" class="btn btn-round btn-warning dropdown-toggle" data-toggle="dropdown">
                                                            Details
                                                        </button></a>
                                                        </div>
                                </div>
                            </div>
                        </div>
                        
                      <!--JAVA-->
                       <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="red">
                                    <h4 class="card-title">JAVA</h4>
                          			 <p class="category">New employees on 15th September, 2016</p> 
                                </div>
                                
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <tr><th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                        </tr></thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                      <div align="center">
                                          <button type="button" class="btn btn-round btn-danger dropdown-toggle" data-toggle="dropdown">
                                                            Details
                                                        </button>
                                                        </div>
                                </div>
                            </div>
                        </div>
                        
                     <!--Database-->
                       <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="blue">
                                    <h4 class="card-title">Database</h4>
                          			 <p class="category">New employees on 15th September, 2016</p> 
                                </div>
                            
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <tr><th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                        </tr></thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                    <div align="center">
                                          <button type="button" class="btn btn-round btn-info dropdown-toggle" data-toggle="dropdown">
                                                            Details
                                                        </button>
                                                        </div>
                                </div>
                            </div>
                            
                        </div>
                        
                     <!--배고파-->
                       <div class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-header card-header-text" data-background-color="green">
                                    <h4 class="card-title">hungry</h4>
                          			 <p class="category">New employees on 15th September, 2016</p> 
                                </div>
                              
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                            <tr><th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                        </tr></thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                      <div align="center">
                                          <button type="button" class="btn btn-round btn-success dropdown-toggle" data-toggle="dropdown">
                                                            Details
                                                        </button>
                                                        </div>
                                </div>
                            </div>
                        </div>
                        
                        <!--  board 추가 아이콘  -->
                      <div class="col-lg-6">
                                <div class="card card-pricing card-raised">
                                    <div class="content">
                                        <h6 class="category">Small Company</h6>
                                        <div class="icon icon-rose">
                                            <i class="material-icons">note_add</i>
                                        </div>
                                        <h3 class="card-title">board number : 4</h3>
                                        <p class="card-description">
                                           새로운 게시판을 생성하려면 이곳을 눌러 생성 하십시오!
                                        </p>
                                        <a href="#pablo" class="btn btn-rose btn-round">add board<div class="ripple-container"></div></a>
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
</html>