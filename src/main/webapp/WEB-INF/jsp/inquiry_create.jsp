<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>

<div class="m-container">
	<div class="row">
	    <div><h1 class="fw-bold">※문의하기</h1></div>
	    <div class="col-lg-12 col-md-12">
	        <div class="box box-success">
	            <div class="box-body">
                    <form method="post">
                        <div class="col-md-5 mb-3">
                            <label class="form-label">제목<span class="text-danger">*</span></label>
                            <input type="text" id="title"class="form-control" placeholder="제목을 입력하세요. (20자 이하)" required>
                        </div>
                        <div class="col-md-12 mb-3">
                             <label class="form-label">내용<span class="text-danger">*</span></label>
                             <textarea id="content" class="form-control"cols="70" rows="10" placeholder="내용을 입력하세요.. (500자 이하)"></textarea>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary" id="sub">등록하기</button>
                        </div>
                    </form>
                </div>
             </div>
         </div>
    </div>
</div>
<script>
    $(function() {
    	let api = '${api}';
let token = localStorage.getItem("token");
      $("#sub").on("click", function (){
        // 기본 이벤트 제거
        event.preventDefault();
        // 이메일과 비밀번호 입력 값 가져오기
         let data ={
            title : $("#title").val(),
            content : $("#content").val()
        }


        $.ajax({
          type: "POST",
          url: api+"/board/user/new",
          async: false,
          contentType: "application/json; charset=utf-8",
          data: JSON.stringify(data),
            success: function(data) {
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type","application/json");
                xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
            },
        }).done(function (res) {
             alert("문의가 등록 되었습니다.");
              location.href = "/inquiry";
          }).fail(function (err) {
             alert("문의 등록을 실패 하였습니다.");
          })
      })
    });
    </script>

<%@ include file="fragments/footer.jsp" %>