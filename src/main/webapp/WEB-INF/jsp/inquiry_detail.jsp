<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


<h2 class="inquiry_title">상세문의</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover dt-responsive">
        <thead>
          <tr>
            <th>title</th>
            <th>content</th>
            <th>questionStatus</th>
            <th>name</th>
          </tr>
        </thead>
        <tbody>

          <tr>
            <td><c:out value="${myboard.title}"></c:out></a></td>
            <td><c:out value="${myboard.content}"></c:out></td>
            <td><c:out value="${myboard.questionStatus}"></c:out></td>
            <td><c:out value="${myboard.name}"></c:out></td>
          </tr>


        </tbody>
      </table>

    </div>
  </div>
</div>

<script>
/* inquiry.jsp */
$(document).ready(function(){
 let api = "http://localhost:8090";
   $.ajax({
       url: api + "/board/user/my-board/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   })
});
</script>
<%@ include file="fragments/footer.jsp" %>