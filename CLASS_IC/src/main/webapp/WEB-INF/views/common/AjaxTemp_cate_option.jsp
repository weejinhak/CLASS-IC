<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	console.log("asdfasdadf");
</script>
	<div style="display:inline-block;">
				서브 카테고리<select id ="subCate" name="subcateCode">
							<option value="null">선택하세요</option>
				            <c:forEach items="${subCateList}" var="subCateList">
							<option value="${subCateList}">${subCateList}</option>
							</c:forEach>
						</select>
	</div> 
