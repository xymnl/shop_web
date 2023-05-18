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
				<li><div class="myInfoName"></div></li>
				<li><div class="myInfoBtn">개인정보수정</div></li>
				<li><div class="myInfoBtn">회원탈퇴</div></li>
				
			</ul>
		</div>
		<div class="orderTitle"><h3 class="titleText">주문내역</h3></div>
		<div class="orderBox">
		<a href="#" class="moreBtn">더보기 +</a>
			<ul>
				<li><p class="noOrder">주문하신 내역이 없습니다.</p></li>
			</ul>
		</div>
		
	</div>
</div>



<%@ include file="fragments/footer.jsp" %>