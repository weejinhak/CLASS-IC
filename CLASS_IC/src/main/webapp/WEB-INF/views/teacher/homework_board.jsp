<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



<!-- 강사 -->
    <div class="content">
       <div class="container-fluid">
          <!-- 내용물  contents  -->
          <div class="row">
               <div class="card">
               <!-- 과제카테고리 / 조  추가-->
               <div class="col-sm-10 col-md-offset-3">
               <!-- 셀렉트 박스(메인 카테고리 선택) -->
                   <div class="col-sm-3">
                        <select  id="selectCateList01" class="form-control selectCateList" title="메인 카테고리 선택해주세요"  >
                                      <option disabled="disabled" selected="selected">카테고리 선택</option>
                             </select>
                         </div>
                         <div class="col-sm-3">
                     <!-- input 박스(조 카테고리 추가) -->
                             <input type="text" class="form-control" placeholder="조를 입력해주세요" id="partyName"> 
                         </div>  
                         <div class="col-sm-3" align="right">
                         <button type="button" class="btn btn-danger btn-round" id="addCateBtn">조 추가</a></button>
                         </div>
                                    
                         </div><!-- end 과제카테고리 / 조  추가-->
               </div>
               
               <div class="card">
               <div class="col-lg-8">
               <!-- 셀렉트 박스(메인 카테고리 선택) -->
                   <div class="col-sm-3">
                                <select id="selectCateList02" class="form-control selectCateList"   title="메인 카테고리 선택" >
                                   <option disabled="disabled" selected="selected">카테고리 선택</option>
                                </select>
                         </div>
                        
                         <div class="col-sm-3">
                    <!--  셀렉트 박스(조 카테고리 선택) -->
                                <select id="selectTeamList" class="form-control" title="조 선택" >
                                   <option disabled="disabled" selected="selected" id="op1">조 선택</option>
                                </select>
                         </div>  
                         </div>
                         
                               <div class="col-sm-12"> 

                           <div id="selectdatatable">
                           </div>
                                                               
                                        <button type="button" class="btn btn-info btn-round" id="noticeBtn" style="float: right;">
                                          글쓰기</a>
                                       </button>
                                </div>
                      </div>
                </div>
                  <!-- 표끝 -->


         </div>

      </div>

      
<script type="text/javascript">
$().ready(function() {
      
      showMainCate();
      selectAllList();
      
      $("#addCateBtn").click(function() {
         addHomework();
      });
      
      $("#selectCateList02").change(function(){
         showTeamList();
      });
      
      $('#selectTeamList').change(function(){
         selectCateCodeList();
      });
      
      
      
      $("#noticeBtn").click(function() {
         location.href="homeworkNoticePage.htm";
      });
         
         function showMainCate() {
            
            var email = "<%=(String)session.getAttribute("email")%>";
               
                  console.log(email)
                  
                  $.ajax({
                     
                     type : "post",
                     url:"selectCate.htm",
                     data : {"email" : email},
                     dataType : 'Json',
                     success : function(data) {
                           
                        $.each(data, function(){
                           $(".selectCateList").append("<option value='"+this.cateCode+"'>" + this.cateCode + "</option> ");
                        });
                        
                        }, 
                        
                        error:function(request, status, error){
                             //console.log(error);
                             alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
                        }
                        
                });
      } //end showMainCate
      
      
      function addHomework() {
         
         var email = "<%=(String)session.getAttribute("email")%>";
         var classCode = "<%=(String)session.getAttribute("classCode")%>";
         
         console.log(email)
         
         var cateCode = $("#selectCateList01 option:selected").val();
         var partyName = $("#partyName").val();
         
         $.ajax({
            
            type : "post",
            url:"addHomework.htm",
            data : {"cateCode": cateCode, "partyName":partyName,"email":email,"classCode":classCode},
            dataType: 'text',
            success : function(data) {
               
                  alert("성공");
                  
                  $("#partyName").val("");
               }, 
               
               error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
               }
            
         });
         
      }//end addHomework
      
      function showTeamList() {
         
         var email = "<%=(String)session.getAttribute("email")%>";
         var classCode = "<%=(String)session.getAttribute("classCode")%>";
         var cateCode = $("#selectCateList02").val();
            
         console.log("showTeamList cateCode : "+cateCode)
         console.log(classCode)
         console.log(email)
               
               $.ajax({
                  
                  type : "post",
                  url:"selectTeam.htm",
                  data : {"email" : email, "classCode": classCode , "cateCode":cateCode},
                  dataType : 'Json',
                  success : function(data) {
                     
                      $("#selectTeamList").empty();
                     
                     $.each(data, function(){
                        $("#selectTeamList").append("<option value='"+this.partyName+"'>" + this.partyName + "</option> ");
                                   console.log("partyName: "+this.partyName)
                                  
                     });
                     
                     selectCateCodeList();
                     
                     }, 
                     
                     error:function(request, status, error){
                          //console.log(error);
                          alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
                     }
                     
             });
      } //end showTeamList
      
      //과제게시판 전체 정렬
      function selectAllList() {
         
         var email = "<%=(String)session.getAttribute("email")%>";
         var classCode = "<%=(String)session.getAttribute("classCode")%>";
         
         $.ajax({
            
            type : "post",
            url:"selectAllList.htm",
            data : {"email" : email, "classCode": classCode },
            dataType : 'html',
            success : function(data) {
               
               
               $('#selectdatatable').html(data);    
               alert(data);
               
               }, 
               
               error:function(request, status, error){
                    //console.log(error);
                    alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
               }
            
         });
         
      }
      
      //partyName별 출력
        /*서브카테고리가 변경이 되면 Ajax를 태움 : 2017.06.29 위진학   */ 
        function selectCateCodeList() {

            var email = "<%=(String)session.getAttribute("email")%>";
            var classCode = "<%=(String)session.getAttribute("classCode")%>";
            
         
                 var partyName=$('#selectTeamList').val();
                

                 $.ajax({
                    type : "post",
                    url:'homeworkSelectList.htm',
                    data:{
                     
                       email:email,
                       classCode:classCode,
                       partyName:partyName
                    },
                    dataType:'text',
                    success:function(data){
                     $('#selectdatatable').empty();
                     $('#selectdatatable').html(data);    
                     
                     console.log(data)
                    }
                 });
      }
      
      
   }); 
</script>




