<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>

	<h2 class="inquiry_title">문의 작성 페이지</h2>

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
        console.log("title"+$("#email").val());


        // Ajax를 이용한 로그인 처리
        $.ajax({
          type: "POST",
          url: api+"/board/user/new",
          async: false,
          contentType: "application/json; charset=utf-8",
          data: JSON.stringify(data),
            success: function(data) {
                console.log('Success!')

            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type","application/json");
                xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
            },
        }).done(function (res) {
             alert("문의가 등록되었습니다.");
              location.href = "/inquiry";
          }).fail(function (err) {
             alert(JSON.stringify(err));
          })
      })
    });
    </script>




<%@ include file="fragments/footer.jsp" %>