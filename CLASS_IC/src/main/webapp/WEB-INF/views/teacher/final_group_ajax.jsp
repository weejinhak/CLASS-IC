<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="group" items="${grouplist }">
	<div>
	<p>${group.groupName }</p>
	<ul id="box${group.groupName }">
<c:forEach var="member" items="${memberlist}">
	<c:if test="${group.groupName == member.groupName}">
		<li id="${member.email }">${member.name }</li>
	</c:if>
</c:forEach>
</ul>
	</div>
</c:forEach>
