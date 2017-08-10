<!--
	@Project : CLASS-IC
	@File Name : attendance_check.jsp
	@Author : 최은혜
	@Date : 2017.07.29
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ----------------------------------------
	학적부 리스트 출력 영역
--------------------------------------------- -->

 <div class="card">
                                <div class="card-header card-header-text" data-background-color="orange">
                                    <h4 class="card-title">${sessionScope.classCode }기 학생부</h4>
                                </div>
                                <br> 
                                <div class="card-content table-responsive">
                                    <table class="table table-hover">
                                        <thead class="text-warning">
                                         <tr>
                                         	<th>사진</th>
                                         	<th>email</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>출석시간</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                             <c:forEach var="list" items="${studentList}">
											<tr>
											<!-- 출석이 확인되지 않으면 : opacity: 0.5 (이미지가 흐리게 나온다)-->
											<c:choose>
											<c:when test="${list.inClass == 'undefined' || list.inClass == null || list.inClass == '' || list.inClass == 'undefined'}">
											<td><img src="${pageContext.request.contextPath}/resources/upload/${list.photoSrc }"  style="width: 60px; opacity: 0.5;" class="img-circle photo"></td>
											</c:when>
											
											<c:otherwise>
											<td><img src="${pageContext.request.contextPath}/resources/upload/${list.photoSrc }"  style="width: 60px;" class="img-circle photo"></td>
											</c:otherwise>
											</c:choose>
											<td>${list.email }</td>
											<td>${list.name }</td>
											<td>${list.phone }</td>
											<td class="inClass">${list.inClass }</td>
											
											</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>









 