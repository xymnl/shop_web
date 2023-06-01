<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../fragments/header.jsp"%>

<!-- Breadcrumb -->
<nav class="navigation" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item currentPage active" aria-current="page"></li>
	</ol>
</nav>

<div class="s-container">
	<div class="shop-body">
		<div class="row shop-filter">
			<div class="d-lg-flex justify-content-between align-items-center">
				<div class="mb-3 mb-lg-0">
					<p class="mb-0"> <span class="text-dark itemCount"> </span> Products found </p>
				</div>
				<div class="d-md-flex justify-content-between align-items-center">
					<div class="d-flex align-items-center justify-content-between">
						<div class="">
							<a href="#" class="text-muted me-3"><i class="bi bi-list-ul"></i></a>
							<a href="#" class=" me-3 active"><i class="bi bi-grid"></i></a> 
							<a href="#" class="me-3 text-muted"><i class="bi bi-grid-3x3-gap"></i></a>
						</div>
						<div class="ms-2 d-lg-none"></div>
						<div class="d-flex mt-2 mt-lg-0">
							<div class="me-2 flex-grow-1">
								<select class="form-select" aria-label="Default select example">
									<option selected>Show: 50</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
								</select>
							</div>
							<div>
								<select class="form-select" aria-label="Default select example">
									<option selected>Sort by: Featured</option>
									<option value="Low to High">Price: Low to High</option>
									<option value="High to Low">Price: High to Low</option>
									<option value="Release Date">Release Date</option>
									<option value="Avg. Rating">Avg. Rating</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- END : shop-filter -->
		<div class="shop-itmes" id="shopItem">
			
		</div> 
	</div><!-- END : shop-body -->
</div><!-- END : s-container -->

<script>
let api = "http://localhost:8090";
$.ajax({
	type:"GET",
	url:api+"/user/item",
	async:false,
	cache:false,
	contentType:'application/json; charset=utf-8',
	success:function(data){
  		let nowurl = location.href.split('?');
		let category = nowurl[1];
  		if(!category.indexOf('fashion')){
  			$('.currentPage').html('패션의류 / 잡화 ');
  		}else if(!category.indexOf('beauty')){
  			$('.currentPage').html('뷰티');
  		}else if(!category.indexOf('food')){
  			$('.currentPage').html('식품');
  		}else {
  			$('.currentPage').html('패션의류 / 잡화 ');
  		}
  		let num = 0;
  		for(let j in data){
   	   		const itemPrice = data[j].price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	    		   $('.shop-itmes').append('<div class="item-box"><a href="detail/'+data[j].item_id+'">'
		   						+ '<img class="item-img" src="/resources'+data[j].imgUrl+'" onerror=this.src="/resources/images/item/noImage.svg">'
   		   						+ '<div class="itemName" id="itemName">'+data[j].itemName+'<span class="itemPrice">'+itemPrice+'원</span></div><a><div>'
  		   						);
	    	num++;
   	   }
		$('.itemCount').append(num+' ');
  	 }
 })
</script>

<%@include file="../fragments/footer.jsp"%>