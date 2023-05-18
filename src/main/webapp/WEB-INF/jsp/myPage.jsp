<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>

<div class="m-container">
	<aside class="myPageLeftbar">
		<ul>
			<li>홈</li>
			<li>주문 내역</li>
			<li>개인정보 수정</li>
		</ul>
	</aside>
	<div class="myPageBody">
		<div class="myPageTitle"><h2 class="titleText">나의 페이지</h2></div>
		<div class="myInfoBox">
			<ul>
				<li><div class="myInfoName">이름<p>email</p></div></li>
				<li>이메일</li>
				<li>주소</li>
				
			</ul>
		</div>
		<h4 class="inquiry_title"><a href="/orderList" style="color:#333">주문 내역</a></h4>
	</div>
</div>



<%@ include file="fragments/footer.jsp" %>