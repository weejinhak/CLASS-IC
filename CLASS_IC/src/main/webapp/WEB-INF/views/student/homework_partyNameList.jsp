<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 학생 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sel" value="${homeworkselectlist}"></c:set>
<c:forEach var="list" items="${sel }">
<tr>
	<td>${list.assignNo }</td>
	<td>${list.cateCode }</td>
	<td>${list.assignTitle }</td>
	<td>${list.name }</td>
	<td>${list.assignDate }</td>
</tr>
</c:forEach>

<script type="text/javascript">

	$("td").click(function() {
		
		var assignNo = ${sel.assignNo }
		var cateCode = ${sel.cateCode}
		var assignTitle = ${sel.assignTitle}
		var name = ${sel.name}
		var assignDate = ${sel.assignDate}
		
		
		
		
	});
</script>