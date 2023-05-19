<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>



			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="name">이름<span class="text-danger">*</span></label>
                      <input type="text" id="names" class="names" placeholder="Enter Your Name" required>
                   </div>

			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="email">이메일<span class="text-danger">*</span></label>
			          <input type="text" class="emails" id="emails" value="" class="form-control" readonly>
			       </div>

			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="address">주소<span class="text-danger">*</span></label>
			          <input type="text" class="addresss" id="addresss" value="" class="form-control"></input>
			       </div>

			       <div class="col-md-12 mb-3">
                   		<label class="form-label" for="address">비밀번호<span class="text-danger">*</span></label>
                   		<input type="password" class="passwords" id="passwords" value="" class="form-control"></input>
                   	</div>

			       <div class="col-md-12">
			          <button type="button" class="btn btn-primary" id="userinfoupdate">수정하기</button>
			          <button type="button" class="btn btn-primary" id="userinfodelete">계정삭제하기</button>
			       </div>

<script>
        let api = "http://localhost:8090";
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
                    console.log(data);
                            $('.names').val(data.name);
                            $('.emails').val(data.email);
                            $('.addresss').val(data.address);
                            $('.passwords').val(data.password);
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                }).fail(function (err) {
                    alert(JSON.stringify(err));
                })
        });

$(document).on('click', '#userinfoupdate', function(e){
    	let api = "http://localhost:8090";
    	let data = { //JavaScript Object
            					name: $("#names").val(),
            					password: $("#passwords").val(),
            					address: $("#addresss").val()
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
                        console.log('개인정보수정완료');
                  },
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader("Content-type","application/json");
                      xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                  },
                }).done(function (res) {
                alert("개인정보수정완료");
                          location.href = "/";
                }).
                fail(function (err) { alert("개인정보수정 실패"); })
});

$(document).on('click', '#userinfodelete', function(e){
    	let api = "http://localhost:8090";
        // 기본 이벤트 제거
        event.preventDefault();
         $.ajax({
                  type: "DELETE",
                  url: api+"/user/delete",
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  success: function(data) {
                        console.log('계정삭제완료');
                  },
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader("Content-type","application/json");
                      xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                  },
                }).done(function (res) {
                alert("계정삭제완료");
                window.localStorage.clear();
                          location.href = "/";
                }).
                fail(function (err) { alert("개인정보수정 실패"); })
});
</script>
<%@ include file="fragments/footer.jsp" %>