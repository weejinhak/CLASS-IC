<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="list" items="${homeworkselectlist}">
	<tr>
		<td>
			<div class="text-center" style="margin-top: -12px;">
				<div class="checkbox" id="">
					<label class="text-center"> <input type="checkbox"
						name="multy[]" value="${homelist.assignNo}"> <span
						class="checkbox-material"></span>
					</label>
				</div>
			</div>
		</td>

		<td>${list.assignNo }</td>
		<td>${list.cateCode }</td>
		<td>${list.assignTitle }</td>
		<td>${list.name }</td>
		<td>${list.assignDate }</td>

		<td class="text-center"><a
			href="totalboardEdit.htm?lectureNo=${homelist.assignNo}"
			class="btn btn-simple btn-info btn-icon edit"><i
				class="material-icons">edit</i></a> <a
			class="btn btn-simple btn-danger btn-icon remove"><i
				class="material-icons" onclick="deletex()">close</i></a> <input
			type="hidden" id="lectureNum" name="lectureNum"
			value="${homelist.assignNo}"></td>

	</tr>
</c:forEach>


   <script type="text/javascript">
/* 데이터 테이블 */
$(function() {
	
	/* $('#datatables').DataTable(
            {
               "pagingType" : "full_numbers",
               "lengthMenu" : [ [ 10, 25, 50, -1 ],
                     [ 10, 25, 50, "All" ] ],
               responsive : true,
               language : {
                  search : "_INPUT_",
                  searchPlaceholder : "Search records",
               }

            });

      var table = $('#datatables').DataTable(); */
	
});
             
   </script>
   
    
    
    