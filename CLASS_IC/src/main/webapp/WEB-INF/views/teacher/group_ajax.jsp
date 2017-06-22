<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:forEach var="setting" items="${settinglist}">
	${setting.groupCode}<br/>
	${setting.groupName }<br/>
	${setting.bindNum }<br/>
	</c:forEach>
	
	<c:forEach var="i" begin="0" end="${setting.groupNum}">
	<div class="tier tier${i} }" ><p>${i }조</p></div>
	</c:forEach> --%>
<c:forEach var="setting" items="${settinglist}">
<c:forEach var="i" begin="0" end="${member_count2}">
	<div class="${setting.groupTable}"><p>${setting.groupTable}조</p>
		<div class="alternative" id="student_${var.index}">
		<img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img_g"/>
		 ${slist.name }
		 <input type="hidden" name="email" id="email_${var.index}" value="${slist.email }"/>
		</div>
	
	</div>
	</c:forEach>
</c:forEach>