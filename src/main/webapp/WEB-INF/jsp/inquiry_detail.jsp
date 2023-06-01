<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>
<style>
    .jb-bold {
        font-weight: bold;
        color: #000000;
        font-size: 16px;
        vertical-align: middle;
    }
    .jb-border {
        border: 1px solid #000000;
    }
</style>
<div class="m-container">
    <div class="row">
        <div><h1 class="fw-bold">※나의문의</h1></div>
        <div class="col-lg-12 col-md-12">
            <div class="box box-success">
                <div class="box-body">
                    <table class="table table-sm table-bordered">
                            <tr class="jb-border">
                                <td class="jb-bold" align="center">문의제목</td>
                                <td><span class="span_dataset1"></span></td>
                                <td class="jb-bold" align="center">문의상태</td>
                                <td><span class="span_dataset3"></span></td>
                                <td class="jb-bold" align="center">고객</td>
                                <td><span class="span_dataset4"></span></td>
                            </tr>
                    </table>
                    <table class="table table-sm table-bordered">
                        <tr class="jb-border">
                            <td class="jb-bold" style="width:13.2%" align="center">문의내용</td>
                            <td style="height: 130px"><span class="span_dataset2"></span></td>
                        </tr>
                        <tr class="jb-border">
                            <td class="jb-bold" style="width:13.2%" align="center">답변내용</td>
                            <td style="height: 300px"><span class="span_dataset5"></span></td>
                    </table>
                    <a href="/inquiry"><button class="btn btn-primary px-1" type="button">돌아가기</button></a>
                </div>
            </div>
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