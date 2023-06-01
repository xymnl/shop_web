<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>


<h2 class="inquiry_title">상세문의</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover dt-responsive">
        <thead>
          <tr>
            <th>문의제목</th>
            <th>문의내용</th>
            <th>문의상태</th>
            <th>고객</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><span class='span_dataset1'></span></td>
            <td><span class='span_dataset2'></span></td>
            <td><span class='span_dataset3'></span></td>
            <td><span class='span_dataset4'></span></td>
          </tr>
        </tbody>
      </table>
      <table border="1">
          <th>답변내용</th>
          <tr><td><span class='span_dataset5'></span></td></tr>
        </table>
      <div class="delete_btn">등록한 문의 삭제</div>
    </div>
  </div>
</div>

<script>
/* inquiry.jsp */
$(document).ready(function(){
 let api = '${api}';
 let token = localStorage.getItem("token");
   $.ajax({
       url: api + "/board/user/my-board/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       dataType: "json",
       success: function (data) {
        console.log("detail : "+data);
        $('.span_dataset1').text(data.title);
        $('.span_dataset2').text(data.content);
        $('.span_dataset3').text(data.questionStatus);
        $('.span_dataset4').text(data.name);
        $('.span_dataset5').text(data.answer);
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           alert("문의 내용을 불러오지 못하였습니다.");
       }
   })
   $('.delete_btn').on("click",function() {
	  $.ajax({
		 url : api + "/board/user/my-board/${idx}",
		 type:'DELETE',
	       async: false,
	       cache: false,
	       contentType: 'application/text; chartset=utf-8',
	       dataType: "text",
	       success: function (data) {
	       },
	       beforeSend: function (xhr) {
	           xhr.setRequestHeader("Authorization", "Bearer " + token);
	       },
	       error: function (jqXHR, textStatus, errorThrown) {
	           alert("문의 삭제를 실패하였습니다.");
	       }
	  }).done(function (res) {
          alert("문의가 삭제되었습니다.");
          location.href = "/inquiry";
      });
   });
});
</script>
<%@ include file="fragments/footer.jsp" %>