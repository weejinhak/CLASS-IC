<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="setting" items="${settinglist}">
	${setting.groupCode}<br/>
	${setting.groupName }<br/>
	${setting.bindNum }<br/>
	</c:forEach>
	
	<c:forEach var="i" begin="0" end="${setting.groupNum}">
	<div class="tier tier${i} }" ><p>${i }조</p></div>
	</c:forEach>
