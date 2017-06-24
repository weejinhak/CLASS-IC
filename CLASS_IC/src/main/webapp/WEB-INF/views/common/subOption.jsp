<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





			
                                     서브 카테고리 <select id="subcateCode" name="subcateCode" >
			                <c:forEach items="${SubCateList}" var="SubCateList"> / 
								<option value="${SubCateList}">${SubCateList}</option>
							</c:forEach>
					 	 </select>
			