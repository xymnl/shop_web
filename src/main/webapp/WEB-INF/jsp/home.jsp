<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp"%>
	<div class="m-container">	
		<section class="lazy slider main-banner">
	    	<div class="main-banner-img">
		      <img src="/resources/imgs/main-bn-1.jpg" alt="슬라이드 이미지1" loading="lazy">
		    </div>
		    <div class="main-banner-img">
		      <img src="/resources/imgs/right.jpg" alt="슬라이드 이미지2" loading="lazy">
		    </div>
		</section>
		
		<section class="categories">
			<div class="title"><h3>Featured Categories</h2></div>
			<div class="center slider">
				<a href="/shop" class="categories-box"><i class="bi bi-apple"></i><div>Dairy, Bread&Eggs</div></a>
				<a href="/shop" class="categories-box"><i class="bi bi-apple"></i><div>Snacks & Muchines</div></a>
				<a href="/shop" class="categories-box"><i class="bi bi-apple"></i><div>Fruits & Vegetables</div></a>
			</div>
		</section>
		
	</div>
<%@include file="fragments/footer.jsp"%>