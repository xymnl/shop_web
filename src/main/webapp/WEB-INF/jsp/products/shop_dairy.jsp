<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../fragments/header.jsp"%>

<!-- Breadcrumb -->
<nav class="navigation" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">패션의류 / 잡화</li>
	</ol>
</nav>

<div class="s-container">
	<div class="shop-body">
		<div class="row shop-filter">
			<div class="d-lg-flex justify-content-between align-items-center">
				<div class="mb-3 mb-lg-0">
					<p class="mb-0"> <span class="text-dark">24 </span> Products found </p>
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
		<div class="shop-itmes">
			<div class="col-lg-3">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative ">
							<div class=" position-absolute top-0 start-0">
								<span class="badge bg-danger">Sale</span>
							</div>
							<a href="detail"> <img src="/resources/imgs/product-img-1.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="wish" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Snack & Munchies</small></a>
						</div>
						<h2 class="fs-6">
							<a href="../../pages/shop-single.html" class="text-inherit text-decoration-none">Haldiram's SevBhujia</a>
						</h2>
						<div>
							<small class="text-warning"><i class="bi bi-star-fill"></i>
								<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
								<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
							<span class="text-muted small">4.5(149)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3"> 
							<div><span class="text-dark">$18</span> <span class="text-decoration-line-through text-muted">$24</span></div>
							<div><a href="#!" class="btn btn-primary btn-sm">Add</a></div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- END : first-items -->
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
  		console.log(JSON.stringify(data));
  		
  		let nowurl = location.href.split('?');
		let category = nowurl[1];
  		if(!category.indexOf('fashion')){
  			console.log("패션이 포함되어있습니다.");
  		}else if(!category.indexOf('beauty')){
  			console.log("뷰티가 포함되어있습니다.");
  		}else if(!category.indexOf('food')){
  			console.log("음식이 포함되어있습니다.")
  		}
  	 }
 })
</script>

<%@include file="../fragments/footer.jsp"%>