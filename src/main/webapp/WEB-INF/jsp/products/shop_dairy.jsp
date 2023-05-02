<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../fragments/header.jsp"%>

<!-- Breadcrumb -->
<nav class="navigation" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="test">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">shop</li>
	</ol>
</nav>

<div class="s-container">
	<aside class="leftbar">
		<div class="row">
			<div class="mb-8">
				<h5 class="mb-3">Categories</h5>
				<ul class="nav nav-category" id="categoryCollapseMenu">
					<li class="nav-item border-bottom w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne">
					<a href="#" class="nav-link">Dairy, Bread & Eggs <i class="feather-icon icon-chevron-right"></i></a> 
					<!-- accordion collapse -->
<!-- 						<div id="categoryFlushOne" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
							<div>
								<ul class="nav flex-column ms-3">
									<li class="nav-item"><a href="#!" class="nav-link">Milk</a></li>
									<li class="nav-item"><a href="#!" class="nav-link">Milk Drinks</a></li>
								</ul>
							</div>
						</div> -->
					</li>
					<li class="nav-item border-bottom w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
						<a href="#" class="nav-link"> Snacks & Munchies <i class="feather-icon icon-chevron-right"></i></a> 
						<!-- collapse -->
<!-- 						<div id="flush-collapseTwo" class="accordion-collapse collapse"
							data-bs-parent="#categoryCollapseMenu">
							<div>
								<ul class="nav flex-column ms-3">
									<li class="nav-item"><a href="#!" class="nav-link">Chips & Crisps</a></li>
									<li class="nav-item"><a href="#!" class="nav-link">Nachos</a></li>
								</ul>
							</div>
						</div> -->
					</li>
					<li class="nav-item border-bottom w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						<a href="#" class="nav-link">Fruits & Vegetables <i class="feather-icon icon-chevron-right"></i></a> 
						<!-- collapse -->
<!-- 						<div id="flush-collapseThree" class="accordion-collapse collapse"
							data-bs-parent="#categoryCollapseMenu">
							<div>
								<ul class="nav flex-column ms-3">
									<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Fresh Vegetables</a></li>
									<li class="nav-item"><a class="nav-link" href="#!">Herbs & Seasonings</a></li>
								</ul>
							</div>
						</div> -->
					</li>
				</ul>
			</div>
			<div class="mb-8">
				<h5 class="mb-3">Stores</h5>
				<div class="my-4">
					<input type="search" class="form-control" placeholder="Search by store">
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="checkbox" value="" id="eGrocery" checked> <label class="form-check-label" for="eGrocery"> E-Grocery </label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="checkbox" value="" id="DealShare"> <label class="form-check-label" for="DealShare"> DealShare </label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="checkbox" value="" id="Dmart">
					<label class="form-check-label" for="Dmart"> DMart </label>
				</div>
			</div>
			<div class="mb-8">
				<h5 class="mb-3">Price</h5>
				<div>
					<div id="priceRange" class="mb-3"></div>
					<small class="text-muted">Price:</small> <span id="priceRange-value" class="small"></span>
				</div>
			</div>
			<div class="mb-8">
				<h5 class="mb-3">Rating</h5>
				<div>
					<div class="form-check mb-2">
						<input class="form-check-input" type="checkbox" value="" id="ratingFive"> <label class="form-check-label" for="ratingFive"> 
							<i class="bi bi-star-fill text-warning"></i>
							<i class="bi bi-star-fill text-warning "></i> 
							<i class="bi bi-star-fill text-warning "></i> 
							<i class="bi bi-star-fill text-warning "></i> 
							<i class="bi bi-star-fill text-warning "></i>
						</label>
					</div>
					<div class="form-check mb-2">
						<input class="form-check-input" type="checkbox" value="" id="ratingFour" checked> <label class="form-check-label" for="ratingFour"> 
							<i class="bi bi-star-fill text-warning"></i>
							<i class="bi bi-star-fill text-warning "></i> 
							<i class="bi bi-star-fill text-warning "></i> 
							<i class="bi bi-star-fill text-warning "></i> 
							<i class="bi bi-star text-warning"></i>
						</label>
					</div>
					<div class="form-check mb-2">
						<input class="form-check-input" type="checkbox" value="" id="ratingThree"> <label class="form-check-label" for="ratingThree"> 
							<i class="bi bi-star-fill text-warning"></i> 
							<i class="bi bi-star-fill text-warning"></i> 
							<i class="bi bi-star-fill text-warning"></i> 
							<i class="bi bi-star text-warning"></i> 
							<i class="bi bi-star text-warning"></i>
						</label>
					</div>
					<div class="form-check mb-2">
						<input class="form-check-input" type="checkbox" value=""id="ratingTwo"> <label class="form-check-label"for="ratingTwo"> 
							<i class="bi bi-star-fill text-warning"></i>
							<i class="bi bi-star-fill text-warning"></i> 
							<i class="bi bi-star text-warning"></i> 
							<i class="bi bi-star text-warning"></i> 
							<i class="bi bi-star text-warning"></i>
						</label>
					</div>
					<div class="form-check mb-2">
						<input class="form-check-input" type="checkbox" value="" id="ratingOne"> <label class="form-check-label" for="ratingOne"> 
							<i class="bi bi-star-fill text-warning"></i>
							<i class="bi bi-star text-warning"></i>
							<i class="bi bi-star text-warning"></i> 
							<i class="bi bi-star text-warning"></i> 
							<i class="bi bi-star text-warning"></i>
						</label>
					</div>
				</div>
			</div>
			<div class="mb-8 position-relative">
				<div class="position-absolute p-5 py-8">
					<h3 class="mb-0">Fresh Fruits</h3>
					<p>Get Upto 25% Off</p>
					<a href="#" class="btn btn-dark">Shop Now<i class="feather-icon icon-arrow-right ms-1"></i></a>
				</div>
				<img src="resources/imgs/assortment-citrus-fruits.png" alt="" class="img-fluid rounded ">
			</div>
		</div>
	</aside>
	<div class="shop-body">
		<div class="shop-title">
			<h2>Snacks&Munchies</h2>
		</div>
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

<%@include file="../fragments/footer.jsp"%>