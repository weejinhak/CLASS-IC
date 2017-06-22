<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
		이름, 사진 (email 로 member table하고 join 해서 select 해오면 될 것 같고 
		조 이름 (grouptTable count 만큼 for문 돌리면 될 것 같고) 그 {i}값 으로 class 명 주면 될 것 같고 
		order를 어떻게 할 것인가의 문제
	
	1)	div alter class의 index = order
		
	2) div groupTable 이름에 따라서 append <div alter>
		추가) 조장 체크 

  -->
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

<!-- container-fluid 이후는 새로 페이지 구성해버리자! -->
       <select id="groupCode">
      	 <c:forEach var="i" begin="1" end="10">
      	 <option value="${i }">${i }회차</option>
      	 </c:forEach>
      	 </select>
		<!-- 몇 명으로 나눌 것인가, 이것은 member 총 인원수 / 1부터 총인원수 나눈 수를 select 값으로 뿌린다  -->
      	 <select id="bindNum">   	
      	<c:forEach var="i" begin="1" end="${member_count2}" >
      	 <option value="${i }">${i }명씩</option>
      	 </c:forEach>
      	 </select>
      	 <input type="button" id="group_submit_btn"  value="그룹 나누기" class="btn btn-rose"/>
      	 
      	 <input type="button" id="save" value="Save" class="btn btn-primary">
<div id="wrapper">
	<div id="scale">
	</div>
	<!--조 나누기  -->
<div class="canvas">
	<!-- 학생 리스트가 있는 칸 -->
	<!-- 학생 리스트  -->
	<p>학생리스트</p>
	<div class="head" style="overflow:auto; ">

	<c:forEach var="slist" items="${member_list2}">
		
		<div class="alternative" id="student_${var.index}">
		<img src="${pageContext.request.contextPath}/resources/assets/img/${slist.photoSrc}.jpg" class="photo_img_g"/>
		 ${slist.name }
		 <input type="hidden" name="email" id="email_${var.index}" value="${slist.email }"/>
		</div>
		
		
		</c:forEach>
	</div>
</div>
	<c:set var="count" value="${member_count2}" />
	<div id="groupTable">
	<!-- 여기에 조별 테이블  -->
	</div>
	

	
	<!-- 조 선택  -->
	<div id="groupMap">
	<c:forEach var="i" begin="0" end="${member_count2}">
	<div class="tier tier${i} ui-sortable"><p>${i }조</p></div>
	</c:forEach>
	</div>
	</div>
	
	