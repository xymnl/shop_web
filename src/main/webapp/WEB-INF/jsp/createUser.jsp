<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    let api = "http://localhost:8090"
        $(function () {
    		$("#btn-save").on("click", function (){ //this를 바인딩하기 위해 화샬표 함수 사용
    		    let data = { //JavaScript Object
    					email: $("#email").val(),
    					name: $("#name").val(),
    					password: $("#password").val(),
    					address: $("#address").val()
    			}
    			$.ajax({
    				type: "POST", //Http method
    				async: 'true or false',
    				url: api + "/user/new", //API 주소
    				data: JSON.stringify(data), //JSON으로 변환
    				contentType: "application/json; charset=utf-8", //MIME 타입
    				dataType: "json" //응답 데이터
    			}).done(function (res) {
    				alert("회원가입이 완료되었습니다.");
    				location.href = "/";
    			}).fail(function (err) {
    				alert(JSON.stringify(err));
    			})
    		})
        });
</script>
<%@include file="fragments/header.jsp" %>
<body>
	<div class="m-container">
		<div class="row my-10">
			 <!-- col -->
			 <div class="offset-lg-1 col-lg-10 col-12 ">
			    <div class="mb-8 py-3">
			       <h1 class="h3">회원가입</h1>
			       <p class="lead mb-0">Fresh Shop의 회원이 되어 혜택을 누리세요!</p>
			    </div>
			    <!-- form -->
			    <form id="form">
			       <!-- input -->
			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="email">Email<span class="text-danger">*</span></label>
			          <input type="email" id="email" name="email" class="form-control" placeholder="Enter Your First Name" required >
			       </div>
			       <div class="col-md-12 mb-3">
			          <label class="form-label" for="name"> Name<span class="text-danger">*</span></label>
			          <input type="text" id="name" class="form-control" name="name" placeholder="Enter Your Name" required>
			       </div>
			       <div class="col-md-6 mb-3">
			          <!-- input -->
			          <label class="form-label" for="password"> password<span class="text-danger">*</span></label>
			          <input type="password" id="password" name="password" class="form-control" placeholder="password" required>
			       </div>
			       <div class="col-md-6 mb-3">
			          <!-- input -->
			          <label class="form-label" for="password_check"> password Check<span class="text-danger">*</span></label>
			          <input type="password" id=password_check name="password_check" class="form-control" placeholder="password check" required>
			       </div>
			       <div class="col-md-12 mb-3">
			          <!-- input -->
			          <label class="form-label" for="address"> Address</label>
			          <input type="text" id="address" name="address" class="form-control" placeholder="Your address" required>
			       </div>
			       <div class="col-md-12">
			          <!-- btn -->
			          <button type="button" class="btn btn-primary" id="btn-save">회원가입 완료</button>
			       </div>
			    </form>
			  </div>
			</div>
		</div>
</body>
<%@include file="fragments/footer.jsp" %>