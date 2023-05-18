<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


			       <!-- input -->
			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="name">이름<span class="text-danger">*</span></label>
                      <input type="text" id="names" class="names" placeholder="Enter Your Name" required>
                   </div>
			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="email">이메일<span class="text-danger">*</span></label>
			          <input type="email" class="emails" id="emails" class="form-control" placeholder="Enter Your First Name" required >
			       </div>

			       <div class="col-md-12 mb-3">
			          <!-- input -->
			          <label class="form-label" for="address">주소<span class="text-danger">*</span></label>
			          <input type="text" class="addresss" id="addresss" value="" class="form-control"></input>
			       </div>
			       <div class="col-md-12">
			          <!-- btn -->
			          <button type="button" class="btn btn-primary" id="userinfoupdate">수정하기</button>
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
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                }).fail(function (err) {
                    alert(JSON.stringify(err));
                })
        });


</script>
<%@ include file="fragments/footer.jsp" %>