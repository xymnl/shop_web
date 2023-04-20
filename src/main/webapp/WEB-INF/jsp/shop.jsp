<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp" %>
	
	  <!-- Breadcrumb -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="test">Home</a></li>
	      <li class="breadcrumb-item active" aria-current="page">shop</li>
	 	</ol>
	</nav>
	
	<div class="row">
		<div class="offset-lg-1 col-lg-3 col-12">
		 <div class="mb-8 mt-8">
		    <h5 class="mb-3">Categories</h5>
		    <!-- nav -->
		    <ul class="nav nav-category" id="categoryCollapseMenu">
		       <li class="nav-item border-bottom w-100 collapsed" data-bs-toggle="collapse"
		          data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne">
		          <a href="#"
		             class="nav-link">Dairy, Bread & Eggs <i class="feather-icon icon-chevron-right"></i></a>
		          <!-- accordion collapse -->
		          <div id="categoryFlushOne" class="accordion-collapse collapse"
		             data-bs-parent="#categoryCollapseMenu">
		             <div>
		                <!-- nav -->
		                <ul class="nav flex-column ms-3">
		                   <!-- nav item -->
		                   <li class="nav-item"><a href="#!" class="nav-link">Milk</a></li>
		                   <!-- nav item -->
		                   <li class="nav-item"><a href="#!" class="nav-link">Milk Drinks</a></li>
		                </ul>
		             </div>
		          </div>
		       </li>
		       <!-- nav item -->
		       <li class="nav-item border-bottom w-100 collapsed" data-bs-toggle="collapse"
		          data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
		          <a href="#"
		             class="nav-link">
		          Snacks &
		          Munchies <i class="feather-icon icon-chevron-right"></i>
		          </a>
		          <!-- collapse -->
		          <div id="flush-collapseTwo" class="accordion-collapse collapse"
		             data-bs-parent="#categoryCollapseMenu">
		             <div>
		                <ul class="nav flex-column ms-3">
		                   <!-- nav item -->
		                   <li class="nav-item"><a href="#!" class="nav-link">Chips & Crisps</a></li>
		                   <!-- nav item -->
		                   <li class="nav-item"><a href="#!" class="nav-link">Nachos</a></li>
		                </ul>
		             </div>
		          </div>
		       </li>
		       <li class="nav-item border-bottom w-100 collapsed" data-bs-toggle="collapse"
		          data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
		          <a
		             href="#" class="nav-link">Fruits & Vegetables <i class="feather-icon icon-chevron-right"></i></a>
		          <!-- collapse -->
		          <div id="flush-collapseThree" class="accordion-collapse collapse"
		             data-bs-parent="#categoryCollapseMenu">
		             <div>
		                <ul class="nav flex-column ms-3">
		                   <!-- nav item -->
		                   <li class="nav-item">
		                      <a class="nav-link active" aria-current="page" href="#!">Fresh Vegetables</a>
		                   </li>
		                   <!-- nav item -->
		                   <li class="nav-item">
		                      <a class="nav-link" href="#!">Herbs & Seasonings</a>
		                   </li>
		                </ul>
		             </div>
		          </div>
		       </li>
		    </ul>
		 </div>
		 <div class="mb-8">
		    <h5 class="mb-3">Stores</h5>
		    <div class="my-4">
		       <!-- input -->
		       <input type="search" class="form-control" placeholder="Search by store">
		    </div>
		    <!-- form check -->
		    <div class="form-check mb-2">
		       <!-- input -->
		       <input class="form-check-input" type="checkbox" value="" id="eGrocery" checked>
		       <label class="form-check-label" for="eGrocery">
		       E-Grocery
		       </label>
		    </div>
		    <!-- form check -->
		    <div class="form-check mb-2">
		       <!-- input -->
		       <input class="form-check-input" type="checkbox" value="" id="DealShare">
		       <label class="form-check-label" for="DealShare">
		       DealShare
		       </label>
		    </div>
		    <!-- form check -->
		    <div class="form-check mb-2">
		       <!-- input -->
		       <input class="form-check-input" type="checkbox" value="" id="Dmart">
		       <label class="form-check-label" for="Dmart">
		       DMart
		       </label>
		    </div>
		 </div>
		 <div class="mb-8">
		    <!-- price -->
		    <h5 class="mb-3">Price</h5>
		    <div>
		       <!-- range -->
		       <div id="priceRange" class="mb-3"></div>
		       <small class="text-muted">Price:</small> <span id="priceRange-value" class="small"></span>
		    </div>
		 </div>
		 <!-- rating -->
		 <div class="mb-8">
		    <h5 class="mb-3">Rating</h5>
		    <div>
		       <!-- form check -->
		       <div class="form-check mb-2">
		          <!-- input -->
		          <input class="form-check-input" type="checkbox" value="" id="ratingFive">
		          <label class="form-check-label" for="ratingFive">
		          <i class="bi bi-star-fill text-warning"></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          </label>
		       </div>
		       <!-- form check -->
		       <div class="form-check mb-2">
		          <!-- input -->
		          <input class="form-check-input" type="checkbox" value="" id="ratingFour" checked>
		          <label class="form-check-label" for="ratingFour">
		          <i class="bi bi-star-fill text-warning"></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star text-warning"></i>
		          </label>
		       </div>
		       <!-- form check -->
		       <div class="form-check mb-2">
		          <!-- input -->
		          <input class="form-check-input" type="checkbox" value="" id="ratingThree">
		          <label class="form-check-label" for="ratingThree">
		          <i class="bi bi-star-fill text-warning"></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star-fill text-warning "></i>
		          <i class="bi bi-star text-warning"></i>
		          <i class="bi bi-star text-warning"></i>
		          </label>
		       </div>
		       <!-- form check -->
		       <div class="form-check mb-2">
		          <!-- input -->
		          <input class="form-check-input" type="checkbox" value="" id="ratingTwo">
		          <label class="form-check-label" for="ratingTwo">
		          <i class="bi bi-star-fill text-warning"></i>
		          <i class="bi bi-star-fill text-warning"></i>
		          <i class="bi bi-star text-warning"></i>
		          <i class="bi bi-star text-warning"></i>
		          <i class="bi bi-star text-warning"></i>
		          </label>
		       </div>
		       <!-- form check -->
		       <div class="form-check mb-2">
		          <!-- input -->
		          <input class="form-check-input" type="checkbox" value="" id="ratingOne">
		          <label class="form-check-label" for="ratingOne">
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
		    <!-- Banner Design -->
		    <!-- Banner Content -->
		    <div class="position-absolute p-5 py-8">
		       <h3 class="mb-0">Fresh Fruits </h3>
		       <p>Get Upto 25% Off</p>
		       <a href="#" class="btn btn-dark">Shop Now<i class="feather-icon icon-arrow-right ms-1"></i></a>
		    </div>
		    <!-- Banner Content -->
		    <!-- Banner Image -->
		    <!-- img --><img src="../../assets/images/banner/assortment-citrus-fruits.png" alt=""
		       class="img-fluid rounded ">
		    <!-- Banner Image -->
		   </div>
		 </div>
		</div>
		
		<div class="title">Snacks & Munchies </div>
		

<%@include file="fragments/footer.jsp" %>