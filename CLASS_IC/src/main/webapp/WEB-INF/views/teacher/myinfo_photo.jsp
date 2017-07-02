<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="info" value="${myphoto }" />


 <img src="${info.photoSrc }" class="img-circle" id="profile" width="100" height="100">
