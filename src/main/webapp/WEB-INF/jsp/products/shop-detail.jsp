<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>


<div class="s-container">
	
	<!-- Breadcrumb -->
	<nav class="navigation2" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="test">Home</a></li>
			<li class="breadcrumb-item active"><a href="shop">shop</a></li>
			<li aria-current="page" class="breadcrumb-item active"><p class="titleName"></p></li>
		</ol>
	</nav>
	<div class="row">
		<div class="col-md-6">
			<!-- img slide -->
			<div id="customize_wrapper">
				<div class="customize" id="customize">
					<div class="title-img">
						<img src="/resources/imgs/product-single-img-1.jpg" alt="" class="shop-img">
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6 shop-container">
			<div class="ps-lg-10 mt-6 mt-md-0">
				<h1 class="mb-1 itemName"></h1>
				<div class="fs-4">
					<span class="fw-bold text-dark itemPrice"><!-- 상품 가격 --></span>원 
					<span class="text-decoration-line-through text-muted">30000</span>원
					<span><small class="fs-6 ms-2 text-danger">26% Off</small></span>
				</div>
				<hr class="my-6">
				<div>
					<div class="input-group input-spinner">
						<input type="button" value="-" class="button-minus btn btn-sm" data-field="quantity"> 
						<input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input"> 
						<input type="button" value="+" class="button-plus btn btn-sm" data-field="quantity">
					</div>
				</div>
				<div class="mt-3 row justify-content-start g-2 align-items-center">
					<div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
						<button type="button" class="btn btn-primary">
							<i class="feather-icon icon-shopping-bag me-2"></i>Add to cart
						</button>
					</div>
				</div>
				<hr class="my-6">
				<div>
					<table class="table table-borderless">
						<tbody>
							<tr>
								<td>Product Code:</td>
								<td>FBB00255</td>
							</tr>
							<tr>
								<td>Availability:</td>
								<td>In Stock</td>
							</tr>
							<tr>
								<td>Type:</td>
								<td>Fruits</td>
							</tr>
							<tr>
								<td>Shipping:</td>
								<td><small>01 day shipping.<span class="text-muted">(Free pickup today)</span></small></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="row product-bar">
		  <ul class="product-details">
		    <li class="product-detail">product detail</li>
		    <li class="product-information">information</li>
		  </ul>
		  <div class="product-detail-txt">
		    <h5>Nutrient Value & Benefits</h5>
		    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi, tellus iaculis urna bibendum in lacus, integer. Id imperdiet vitae varius sed magnis eu nisi nunc sit. Vel, varius habitant ornare ac rhoncus. Consequat risus facilisis ante ipsum netus risus adipiscing sagittis sed. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
		    <h6>Storage Tips</h6>
		    <p>Nisi, tellus iaculis urna bibendum in lacus, integer. Id imperdiet vitae varius sed magnis eu nisi nunc sit. Vel, varius habitant ornare ac rhoncus. Consequat risus facilisis ante ipsum netus risus adipiscing sagittis sed.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
		    <h6>Unit</h6>
		    <p>3 units</p>
		    <h6>Seller</h6>
		    <p>DMart Pvt. LTD</p>
		    <h6>Disclaimer</h6>
		    <p>Image shown is a representation and may slightly vary from the actual product. Every effort is made to maintain accuracy of all information displayed.</p>
		  </div>
		  <div class="information" style="display:none">
		  
		  	 	<h4>상품 정보</h4>
		  
		  </div>
		</div>
		
	</div> <!-- END : row -->
		
</div> <!--  END : m-container -->

<script>
$(document).ready(function(){
	 let api = "http://localhost:8090";
	 $.ajax({
       url: api + "/user/item/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
  	   		console.log("상품상세 data : "+JSON.stringify(data));
  	   		$('.itemName').append(data.itemName);
  	   		$('.itemPrice').append(data.price);
  	   		
      },
      beforeSend: function (xhr) {
          xhr.setRequestHeader("Authorization", "Bearer " + token);
      },
      error: function (jqXHR, textStatus, errorThrown) {
          console.log(jqXHR.status + textStatus + errorThrown);
      }
	});
 });
</script>
<script>
$(document).ready(function() {
	$('.product-detail').addClass('active');
	$('.product-detail').click(function() {
	    $('.product-detail-txt').show();
	    $('.information').hide();
	    $('.product-detail-txt').toggleClass('active');
	    $(this).addClass('active');
	    $('.product-information').removeClass('active');
	    
	  });
	  
	  $('.product-information').click(function() {
	    $('.information').show();
	    $('.product-detail-txt').hide();
	    $(this).addClass('active');
	    $('.product-detail').removeClass('active');
	  });
});
</script>



<%@ include file="../fragments/footer.jsp"%>