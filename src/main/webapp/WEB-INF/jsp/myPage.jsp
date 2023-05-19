<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>

<div class="m-container">
	<aside class="myPageLeftbar">
		<ul>
			<li>홈</li>
			<li>주문 내역</li>
			<li><a href="/updateUser">개인정보 수정</li>
		</ul>
	</aside>
	<div class="myPageBody">
		<div class="myPageTitle"><h2 class="titleText">나의 페이지</h2></div>
		<div class="myInfoBox">
			<ul>

				<li><div class="myInfoName"></div></li>
				<li><div class="myInfoBtn">개인정보수정</div></li>
				<li><div class="myInfoBtn">회원탈퇴</div></li>
				
			</ul>
		</div>

        <!-- 폐기하려면 폐기 ㄱㄱ -->
		            <li>이름</li>
                    <span class='span_dataset1'></span>
                    <li>이메일</li>
                    <span class='span_dataset2'></span>
                    <li>주소</li>
                    <span class='span_dataset3'></span>
         <!-- 폐기하려면 폐기 ㄱㄱ -->


		<div class="orderTitle"><h3 class="titleText">주문내역</h3></div>
		<div class="orderBox">
		<a href="#" class="moreBtn">더보기 +</a>
			<ul>
				<li><p class="noOrder">주문하신 내역이 없습니다.</p></li>
			</ul>
		</div>
		
	</div>
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
                            $('.span_dataset1').text(data.name);
                            $('.span_dataset2').text(data.email);
                            $('.span_dataset3').text(data.address);
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