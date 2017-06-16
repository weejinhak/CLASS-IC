
/*
@Project : CLASS-IC
@File name : student_memo.js
@Author : 최은혜
@Data : 2017.06.15
@Desc :
*/
$(document).ready(function() {
  $(".ul").on("click", ".li", function() {
    $(this).toggleClass("completed");
  });

  $(".ul").on("click", ".span", function() {
    $(this).parent().fadeOut(500, function() {
      $(this).remove();
    });
    event.stopPropagation();
  });

  $(".in").keypress(function(event) {
    if (event.which === 13) {
      var todoText = $(this).val();
      if(todoText != ""){
    	  $(this).val("");
      $(".ul").append("<li class='li'><span class='span'><i class='fa fa-trash'></i></span> " + todoText + "</li>");
      	}else{
      		alert("다시 입력해 주세요.");
      	}
      }
  });

  $(".fa-plus").click(function() {
    $(".fa-plus").toggleClass("fa-minus");
    $(".in").slideToggle(350, "linear");
  });
});