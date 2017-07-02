<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<c:set var="info" value="${myinfo }" />


 <img src="${info.photoSrc }" class="img-circle" id="profile" width="100" height="100">
