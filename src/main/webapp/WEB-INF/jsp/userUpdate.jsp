<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>

<div class="h-container">
	<aside class="myPageLeftbar">
		<ul>
			<li><div><a href="/mypage" id="homeBtn">홈</a></div></li>
			<li><div><a href="/orderList" id="orderBtn">주문 내역</a></div></li>
			<li><div><a href="/updateUser" id="updateBtn">개인정보 수정</a></div></li>
		</ul>
	</aside>
	<h3 class="inquiryTitle">개인정보 수정</h3>
	<div class="userBody">
       <div class="col-md-12 mb-3">
         <label class="form-label" for="name">이름<span class="text-danger">*</span></label>
         <input type="text" id="name" class="name" placeholder="Enter Your Name" required>
       </div>

       <div class="col-md-12 mb-3">
          <label class="form-label" for="email">이메일<span class="text-danger">*</span></label>
          <input type="text" class="email" id="email" value="" class="form-control" readonly>
       </div>

       <div class="col-md-12 mb-3">
          <label class="form-label" for="address">주소<span class="text-danger">*</span></label>
          <input type="text" class="address" id="address" value="" class="form-control"></input>
       </div>

       <div class="col-md-12 mb-3">
	   		<label class="form-label" for="address">비밀번호<span class="text-danger">*</span></label>
	   		<input type="password" class="password" id="passwords" value="" class="form-control"></input>
	   </div>

       <div class="col-md-12">
          <button type="button" class="btn btn-primary" id="userinfoupdate">수정하기</button>
          <button type="button" class="btn btn-primary" id="userinfodelete">계정삭제하기</button>
       </div>
	</div>
</div>

<script>
        let api = '${api}';
        var token = localStorage.getItem("token");

        $(document).ready(function(){
                let data;
                // Ajax를 이용한 회원 조회
                $.ajax({
                    type: "GET",
                    url: api+"/user/info",
                    async: false,
                    contentType: "application/text; charset=utf-8",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function(data) {
                            $('.name').val(data.name);
                            $('.email').val(data.email);
                            $('.address').val(data.address);
                            $('.password').val(data.password);
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                }).fail(function (err) {
                    alert("회원 조회 실패.");
                })
        });

$(document).on('click', '#userinfoupdate', function(e){
    	let api = '${api}';
    	let data = { //JavaScript Object
            					name: $("#name").val(),
            					password: $("#password").val(),
            					address: $("#address").val()
            			}
        // 기본 이벤트 제거
        event.preventDefault();
         $.ajax({
                  type: "PUT",
                  url: api+"/user/modify",
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  data: JSON.stringify(data),
                  dataType: "json",
                  success: function(data) {
                        alert("개인 정보 수정 완료.");
                  },
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader("Content-type","application/json");
                      xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                  },
                }).done(function (res) {

                          location.href = "/";
                }).
                fail(function (err) { alert("개인정보수정 실패"); })
});

$(document).on('click', '#userinfodelete', function(e){
    	let api = '${api}';
        // 기본 이벤트 제거
        event.preventDefault();
         $.ajax({
                  type: "DELETE",
                  url: api+"/user/delete",
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  success: function(data) {
                        alert("계정 삭제 완료.");
                  },
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader("Content-type","application/json");
                      xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                  },
                }).done(function (res) {
                 window.localStorage.clear();
                          location.href = "/";
                }).
                fail(function (err) { alert("개인정보수정 실패"); })
});
</script>

<script>
let nowUrl = window.location.href;
if (nowUrl.indexOf("updateUser")){
	   document.getElementById('updateBtn').classList.add("active");
}
</script>
<%@ include file="fragments/footer.jsp" %>