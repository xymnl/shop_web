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
        <div><h1 class="fw-bold">※답변하기</h1></div>
        <div class="col-lg-12 col-md-12">
            <div class="box box-success">
                <form method="post">
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
                                <td style="height: 130px"><span class="span_dataset5"></span></td>
                            </tr>
                            <tr class="jb-border">
                                <td class="jb-bold" style="width:13.2%" align="center">답변달기</td>
                                <td style="height: 200px">
                                    <textarea id="content" class="form-control"cols="70" rows="10" placeholder="내용을 입력하세요.. (500자 이하)"></textarea>
                                </td>
                            </tr>
                        </table>
                        <a href="/admin_inquiry"><button class="btn btn-primary px-1" type="button">돌아가기</button></a>
                        <a href="/admin_inquiry"><button class="btn btn-primary px-1" type="submit" id="sub">답변하기</button></a>
                    </div>
                </form>
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
       url: api + "/board/admin/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/text; charset=utf-8',
       dataType: "json",
       success: function (data) {
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
           alert("일반회원은 접근할 수 없습니다.");
           location.href = "/";
       }
   })
});
</script>
<script>
$(function() {
    	let api = '${api}';

      $("#sub").on("click", function (){
        // 기본 이벤트 제거
        event.preventDefault();
        // 이메일과 비밀번호 입력 값 가져오기
         let dataa ={
            "answer" : $("#content").val()
        }

        // Ajax를 이용한 로그인 처리
        $.ajax({
          type: "POST",
          url: api+"/board/admin/${idx}/answer?answer="+dataa.answer,
          async: false,
          contentType: "application/json; charset=utf-8",
          data : dataa,
          dataType: "text",
            success: function(data) {
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type","application/json");
                xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
            },
        }).done(function (res) {
              alert("답변이 등록되었습니다.");
              location.href = "/admin_inquiry_detail/${idx}"
          }).fail(function (err) {
             alert("답변 등록 실패");
          })
      })
    });
</script>
<%@ include file="fragments/footer.jsp" %>