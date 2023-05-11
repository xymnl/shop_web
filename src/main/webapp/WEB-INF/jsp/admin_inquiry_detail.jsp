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
            <td><span class='span_dataset1'></span></td>
            <td><span class='span_dataset2'></span></td>
            <td><span class='span_dataset3'></span></td>
            <td><span class='span_dataset4'></span></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  
<h2 class="inquiry_title">문의 답변하기</h2>
<form method="post">
    <table style="width:600px; margin:auto">
        <tr>
            <td width="70">제목</td>
            <td><input type="text" id="title" placeholder="제목을 입력하세요. (20자 이하)"/></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea id="content" cols="70" rows="10"></textarea></td>
        </tr>
    </table>
    <div style="width:835px; text-align:right; margin-top:10px">
        <button type="submit" id="sub">등록</button>
    </div>
</form>
  
</div>

<script>
/* inquiry.jsp */
$(document).ready(function(){
 let api = "http://localhost:8090";
   $.ajax({
       url: api + "/board/admin/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/text; chartset=utf-8',
       dataType: "text",
       success: function (data) {
        console.log("detail : "+data);
        $('.span_dataset1').text(data.title);
        $('.span_dataset2').text(data.content);
        $('.span_dataset3').text(data.questionStatus);
        $('.span_dataset4').text(data.name);
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