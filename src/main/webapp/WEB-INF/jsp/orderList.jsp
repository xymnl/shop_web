<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>

<div class="h-container">
<aside class="myPageLeftbar">
		<ul>
			<li><div><a href="/mypage" id="homeBtn">홈</a></div></li>
			<li><div><a href="/orderList" id="orderBtn">주문 내역</a></div></li>
			<li><div><a href="/updateUser" id="updateBtn">개인정보 수정</a></div></li>
		</ul>
	</aside>
	<div class="myPageBody">
		<h3 class="inquiryTitle">~님의 주문 내역</h3>
	</div>
 
</div>

<script>
let nowUrl = window.location.href;
if(nowUrl.indexOf("orderList")){
	   document.getElementById('orderBtn').classList.add("active");
}
</script>

<%@ include file="fragments/footer.jsp" %>