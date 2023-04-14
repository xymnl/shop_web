<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="/css/flexslider.css">
  <link rel="icon" href="/imgs/favicon-logo.svg" sizes="32x32" type="image/png">
<!--   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
  <script src="/js/jquery-1.12.4.min.js"></script>
  <script src="/js/slide.js"></script>
  <script src="/js/jquery.flexslider.js"></script>
  <script src="/js/jquery.touchSwipe.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script>
	  $(document).ready(function() {
		  $('.flexslider').flexslider({
		    animation: 'slide',
		    controlNav: true,
		    directionNav: false,
		    touch: true,
		    start: function(slider){
		      $('body').removeClass('loading');
		    }
		  });

		  $("#test").swipe({
		    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
		      if (direction === 'left') {
		        $('.flexslider').flexslider('next');
		      } else if (direction === 'right') {
		        $('.flexslider').flexslider('prev');
		      }
		    },
		    threshold: 50,
		    fingers: 'all'
		  });
		});
	</script>
</head>
<body>
  <div class="py-4 pt-lg-3 pb-lg-0">
    <div class="container">
      <div class="row w-100 align-items-center gx-lg-2 gx-0">
        <div class="col-xxl-2 col-lg-3">
          <a class="navbar-brand d-none d-lg-block shoplg" href="#">
            <img src="${pageContext.request.contextPath}/imgs/logo.png" alt="Shop Logo">
            Fresh Shop
          </a>
        </div>
        <div class="col-xxl-6 col-lg-5 d-none d-lg-block">
          <form action="#">
            <div class="input-group ">
              <input class="form-control rounded" type="search" placeholder="Search for products">
              <span class="input-group-append">
                <button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                  </svg>
                </button>
              </span>
            </div>
          </form> <!--end: search-form -->
        </div>
        <div class="col-md-2 col-xxl-3 d-none d-lg-block">
          <!-- Button trigger modal -->
			<button type="button" class="btn  btn-outline-gray-400 text-muted" data-bs-toggle="modal" data-bs-target="#locationModal">
	            <i class="feather-icon icon-map-pin me-2"></i>Location
	        </button>

			<!-- Modal -->
			<div class="modal fade" id="locationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="#locationModal" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="mb-1" id="locationModal">Choose your Delivery Location</h1>
			        <p class="mb-0 small">Enter your address and we will specify the offer you area.</p>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">

			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Understood</button>
			      </div>
			    </div>
			  </div>
			</div> <!-- END: Modal -->
        </div>
        <div class="col-md-2 col-xxl-1 text-end d-none d-lg-block">
          <div class="list-inline">
            <div class="list-inline-item">
              <a onClick="location.reload();" class="text-muted position-relative heartbtn">
                <i class="bi bi-heart"></i>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                  5
                  <span class="visually-hidden">unread messages</span>
                </span>
              </a></div>
            <div class="list-inline-item person">
              <a href="#!" class="text-muted" data-bs-toggle="modal" data-bs-target="#userModal">
                <i class="bi bi-person"></i>
              </a>
              	<div class="modal fade" tabindex="-1" role="dialog" id="userModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content rounded-4 shadow">
							<div class="modal-header p-5 pb-4 border-bottom-0">
								<h1 class="fw-bold mb-0 fs-2">Sign up for free</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body p-5 pt-0">
								<form class="">
									<div class="form-floating mb-3">
										<input type="email" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com">
										<label for="floatingInput">Email address</label>
									</div>
									<div class="form-floating mb-3">
										<input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password">
										<label for="floatingPassword">Password</label>
									</div>
									<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Sign up</button>
									<small class="text-body-secondary">By clicking Sign up, you agree to the terms of use.</small>
									<hr class="my-4">
									<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
									<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit">
									<svg class="bi me-1" width="16" height="16"><use xlink:href="#twitter"></use></svg>
									Sign up with Twitter </button>
									<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="submit">
									<svg class="bi me-1" width="16" height="16"><use xlink:href="#facebook"></use></svg>
									Sign up with Facebook </button>
									<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit">
									<svg class="bi me-1" width="16" height="16"><use xlink:href="#github"></use></svg>
									Sign up with GitHub </button>
								</form>
							</div>
						</div>
					</div>
				</div>
              <!-- end: usermodal -->
             </div>
            <div class="list-inline-item">
              <a class="text-muted position-relative " data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" href="#offcanvasExample" role="button" aria-controls="offcanvasRight">
   				<i class="bi bi-cart3"></i>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                  1
                  <span class="visually-hidden">unread messages</span>
                </span>
              </a>
              <div class="offcanvas offcanvas-end hidden" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" aria-modal="true" role="dialog">
				  <div class="offcanvas-header border-bottom">
				    <div class="text-start">
				      <h5 id="offcanvasRightLabel" class="mb-0 fs-4">Shop Cart</h5>
				      <small>Location in 382480</small>
				    </div>
				    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				  </div>
				  <div class="offcanvas-body">

				    <div class="">
				      <!-- alert -->
				      <div class="alert alert-danger p-2" role="alert">
				        You’ve got FREE delivery. Start <a href="#!" class="alert-link">checkout now!</a>
				      </div>
				      <ul class="list-group list-group-flush">
				        <!-- list group -->
				        <li class="list-group-item py-3 ps-0 border-top">
				          <!-- row -->
				          <div class="row align-items-center">
				            <div class="col-3 col-md-2">
				              <!-- img --> <img src="./assets/images/products/product-img-1.jpg" alt="Ecommerce" class="img-fluid"></div>
				            <div class="col-4 col-md-6 col-lg-5">
				              <!-- title -->
				              <a href="./pages/shop-single.html" class="text-inherit">
				                <h6 class="mb-0">Haldiram's Sev Bhujia</h6>
				              </a>
				              <span><small class="text-muted">.98 / lb</small></span>
				              <!-- text -->
				              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">
				                      <polyline points="3 6 5 6 21 6"></polyline>
				                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
				                      </path>
				                      <line x1="10" y1="11" x2="10" y2="17"></line>
				                      <line x1="14" y1="11" x2="14" y2="17"></line>
				                    </svg></span><span class="text-muted">Remove</span></a></div>
				            </div>
				            <!-- input group -->
				            <div class="col-3 col-md-3 col-lg-3">
				              <!-- input -->
				              <!-- input -->
				              <div class="input-group input-spinner  ">
				                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
				                <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
				                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
				              </div>

				            </div>
				            <!-- price -->
				            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
				              <span class="fw-bold">$5.00</span>

				            </div>
				          </div>

				        </li>
				        <!-- list group -->
				        <li class="list-group-item py-3 ps-0">
				          <!-- row -->
				          <div class="row align-items-center">
				            <div class="col-3 col-md-2">
				              <!-- img --> <img src="./assets/images/products/product-img-2.jpg" alt="Ecommerce" class="img-fluid"></div>
				            <div class="col-4 col-md-6 col-lg-5">
				              <!-- title -->
				              <a href="./pages/shop-single.html" class="text-inherit">
				                <h6 class="mb-0">NutriChoice Digestive </h6>
				              </a>
				              <span><small class="text-muted">250g</small></span>
				              <!-- text -->
				              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">
				                      <polyline points="3 6 5 6 21 6"></polyline>
				                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
				                      </path>
				                      <line x1="10" y1="11" x2="10" y2="17"></line>
				                      <line x1="14" y1="11" x2="14" y2="17"></line>
				                    </svg></span><span class="text-muted">Remove</span></a></div>
				            </div>
				            <!-- input group -->
				            <div class="col-3 col-md-3 col-lg-3">
				              <!-- input -->
				              <!-- input -->
				              <div class="input-group input-spinner  ">
				                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
				                <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
				                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
				              </div>
				            </div>
				            <!-- price -->
				            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
				              <span class="fw-bold text-danger">$20.00</span>
				              <div class="text-decoration-line-through text-muted small">$26.00</div>
				            </div>
				          </div>

				        </li>
				        <!-- list group -->
				        <li class="list-group-item py-3 ps-0">
				          <!-- row -->
				          <div class="row align-items-center">
				            <div class="col-3 col-md-2">
				              <!-- img --> <img src="./assets/images/products/product-img-3.jpg" alt="Ecommerce" class="img-fluid"></div>
				            <div class="col-4 col-md-6 col-lg-5">
				              <!-- title -->
				              <a href="./pages/shop-single.html" class="text-inherit">
				                <h6 class="mb-0">Cadbury 5 Star Chocolate</h6>
				              </a>
				              <span><small class="text-muted">1 kg</small></span>
				              <!-- text -->
				              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">
				                      <polyline points="3 6 5 6 21 6"></polyline>
				                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
				                      </path>
				                      <line x1="10" y1="11" x2="10" y2="17"></line>
				                      <line x1="14" y1="11" x2="14" y2="17"></line>
				                    </svg></span><span class="text-muted">Remove</span></a></div>
				            </div>
				            <!-- input group -->
				            <div class="col-3 col-md-3 col-lg-3">
				              <!-- input -->
				              <!-- input -->
				              <div class="input-group input-spinner  ">
				                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
				                <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
				                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
				              </div>
				            </div>
				            <!-- price -->
				            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
				              <span class="fw-bold">$15.00</span>
				              <div class="text-decoration-line-through text-muted small">$20.00</div>
				            </div>
				          </div>

				        </li>
				        <!-- list group -->
				        <li class="list-group-item py-3 ps-0">
				          <!-- row -->
				          <div class="row align-items-center">
				            <div class="col-3 col-md-2">
				              <!-- img --> <img src="./assets/images/products/product-img-4.jpg" alt="Ecommerce" class="img-fluid"></div>
				            <div class="col-4 col-md-6 col-lg-5">
				              <!-- title -->
				              <a href="./pages/shop-single.html" class="text-inherit">
				                <h6 class="mb-0">Onion Flavour Potato</h6>
				              </a>
				              <span><small class="text-muted">250g</small></span>
				              <!-- text -->
				              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">
				                      <polyline points="3 6 5 6 21 6"></polyline>
				                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
				                      </path>
				                      <line x1="10" y1="11" x2="10" y2="17"></line>
				                      <line x1="14" y1="11" x2="14" y2="17"></line>
				                    </svg></span><span class="text-muted">Remove</span></a></div>
				            </div>
				            <!-- input group -->
				            <div class="col-3 col-md-3 col-lg-3">
				              <!-- input -->
				              <!-- input -->
				              <div class="input-group input-spinner  ">
				                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
				                <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
				                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
				              </div>
				            </div>
				            <!-- price -->
				            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
				              <span class="fw-bold">$15.00</span>
				              <div class="text-decoration-line-through text-muted small">$20.00</div>
				            </div>
				          </div>

				        </li>
				        <!-- list group -->
				        <li class="list-group-item py-3 ps-0 border-bottom">
				          <!-- row -->
				          <div class="row align-items-center">
				            <div class="col-3 col-md-2">
				              <!-- img --> <img src="./assets/images/products/product-img-5.jpg" alt="Ecommerce" class="img-fluid"></div>
				            <div class="col-4 col-md-6 col-lg-5">
				              <!-- title -->
				              <a href="./pages/shop-single.html" class="text-inherit">
				                <h6 class="mb-0">Salted Instant Popcorn </h6>
				              </a>
				              <span><small class="text-muted">100g</small></span>
				              <!-- text -->
				              <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">
				                      <polyline points="3 6 5 6 21 6"></polyline>
				                      <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
				                      </path>
				                      <line x1="10" y1="11" x2="10" y2="17"></line>
				                      <line x1="14" y1="11" x2="14" y2="17"></line>
				                    </svg></span><span class="text-muted">Remove</span></a></div>
				            </div>
				            <!-- input group -->
				            <div class="col-3 col-md-3 col-lg-3">
				              <!-- input -->
				              <!-- input -->
				              <div class="input-group input-spinner  ">
				                <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
				                <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
				                <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
				              </div>
				            </div>
				            <!-- price -->
				            <div class="col-2 text-lg-end text-start text-md-end col-md-2">
				              <span class="fw-bold">$15.00</span>
				              <div class="text-decoration-line-through text-muted small">$25.00</div>
				            </div>
				          </div>

				        </li>

				      </ul>
				      <!-- btn -->
				      <div class="d-flex justify-content-between mt-4">
				        <a href="#!" class="btn btn-primary">Continue Shopping</a>
				        <a href="#!" class="btn btn-dark">Update Cart</a>
				      </div>
				    </div>
				  </div>
				</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <nav class="navbar navbar-expand-lg navbar-light navbar-default py-0 py-lg-4">
	<div class="container px-0 px-md-3">
		<div class="dropdown me-3 d-none d-lg-block">
			<button class="btn btn-primary px-6 " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
			<span class="me-1">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid">
			<rect x="3" y="3" width="7" height="7"></rect>
			<rect x="14" y="3" width="7" height="7"></rect>
			<rect x="14" y="14" width="7" height="7"></rect>
			<rect x="3" y="14" width="7" height="7"></rect>
			</svg></span> All Departments </button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Dairy, Bread &amp; Eggs</a></li>
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Snacks &amp; Munchies</a></li>
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Fruits &amp; Vegetables</a></li>
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Cold Drinks &amp; Juices</a></li>
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Breakfast &amp; Instant Food</a></li>
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Bakery &amp; Biscuits</a></li>
				<li><a class="dropdown-item" href="./pages/shop-grid.html">Chicken, Meat &amp; Fish</a></li>
			</ul>
		</div>
		<div class="offcanvas offcanvas-start p-4 p-lg-0" id="navbar-default">
			<div class="d-flex justify-content-between align-items-center mb-2 d-block d-lg-none">
				<a href="./index.html"><img src="./assets/images/logo/freshcart-logo.svg" alt="eCommerce HTML Template"></a>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="d-block d-lg-none my-4">
				<form action="#">
					<div class="input-group ">
						<input class="form-control rounded" type="search" placeholder="Search for products">
						<span class="input-group-append">
						<button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
						<circle cx="11" cy="11" r="8"></circle>
						<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
						</svg>
						</button>
						</span>
					</div>
				</form>
				<div class="mt-2">
					<button type="button" class="btn btn-outline-gray-400 text-muted w-100 " data-bs-toggle="modal" data-bs-target="#locationModal">
					<i class="feather-icon icon-map-pin me-2"></i>Pick Location </button>
				</div>
			</div>
			<div class="d-block d-lg-none mb-4">
				<a class="btn btn-primary w-100 d-flex justify-content-center align-items-center" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				<span class="me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid">
				<rect x="3" y="3" width="7" height="7"></rect>
				<rect x="14" y="3" width="7" height="7"></rect>
				<rect x="14" y="14" width="7" height="7"></rect>
				<rect x="3" y="14" width="7" height="7"></rect>
				</svg></span> All Departments </a>
				<div class="collapse mt-2" id="collapseExample">
					<div class="card card-body">
						<ul class="mb-0 list-unstyled">
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Dairy, Bread &amp; Eggs</a></li>
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Snacks &amp; Munchies</a></li>
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Fruits &amp; Vegetables</a></li>
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Cold Drinks &amp; Juices</a></li>
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Breakfast &amp; Instant Food</a></li>
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Bakery &amp; Biscuits</a></li>
							<li><a class="dropdown-item" href="./pages/shop-grid.html">Chicken, Meat &amp; Fish</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="d-none d-lg-block">
				<ul class="navbar-nav align-items-center ">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Home </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="./index.html">Home 1</a></li>
						<li><a class="dropdown-item" href="./pages/index-2.html">Home 2</a></li>
						<li><a class="dropdown-item" href="./pages/index-3.html">Home 3</a></li>
						<li><a class="dropdown-item" href="./pages/index-4.html">Home 4 <span class="badge bg-light-info text-dark-info ms-1">New</span></a></li>
					</ul>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Shop </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="./pages/shop-grid.html">Shop Grid - Filter</a></li>
						<li><a class="dropdown-item" href="./pages/shop-grid-3-column.html">Shop Grid - 3 column</a>
						</li>
						<li><a class="dropdown-item" href="./pages/shop-list.html">Shop List - Filter</a></li>
						<li><a class="dropdown-item" href="./pages/shop-filter.html">Shop - Filter</a></li>
						<li><a class="dropdown-item" href="./pages/shop-fullwidth.html">Shop Wide</a></li>
						<li><a class="dropdown-item" href="./pages/shop-single.html">Shop Single</a></li>
						<li><a class="dropdown-item" href="./pages/shop-single-2.html">Shop Single v2<span class="badge bg-light-info text-dark-info ms-1">New</span></a></li>
						<li><a class="dropdown-item" href="./pages/shop-wishlist.html">Shop Wishlist</a></li>
						<li><a class="dropdown-item" href="./pages/shop-cart.html">Shop Cart</a></li>
						<li><a class="dropdown-item" href="./pages/shop-checkout.html">Shop Checkout</a></li>
					</ul>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Stores </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="./pages/store-list.html">Store List</a></li>
						<li><a class="dropdown-item" href="./pages/store-grid.html">Store Grid</a></li>
						<li><a class="dropdown-item" href="./pages/store-single.html">Store Single</a></li>
					</ul>
					</li>
					<li class="nav-item dropdown dropdown-fullwidth">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Mega menu </a>
					<div class=" dropdown-menu pb-0">
						<div class="row p-2 p-lg-4">
							<div class="col-lg-3 col-6 mb-4 mb-lg-0">
								<h6 class="text-primary ps-3">Dairy, Bread &amp; Eggs</h6>
								<a class="dropdown-item" href="./pages/shop-grid.html">Butter</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Milk Drinks</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Curd &amp; Yogurt</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Eggs</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Buns &amp; Bakery</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Cheese</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Condensed Milk</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Dairy Products</a>
							</div>
							<div class="col-lg-3 col-6 mb-4 mb-lg-0">
								<h6 class="text-primary ps-3">Breakfast &amp; Instant Food</h6>
								<a class="dropdown-item" href="./pages/shop-grid.html">Breakfast Cereal</a>
								<a class="dropdown-item" href="./pages/shop-grid.html"> Noodles, Pasta &amp; Soup</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Frozen Veg Snacks</a>
								<a class="dropdown-item" href="./pages/shop-grid.html"> Frozen Non-Veg Snacks</a>
								<a class="dropdown-item" href="./pages/shop-grid.html"> Vermicelli</a>
								<a class="dropdown-item" href="./pages/shop-grid.html"> Instant Mixes</a>
								<a class="dropdown-item" href="./pages/shop-grid.html"> Batter</a>
								<a class="dropdown-item" href="./pages/shop-grid.html"> Fruit and Juices</a>
							</div>
							<div class="col-lg-3 col-12 mb-4 mb-lg-0">
								<h6 class="text-primary ps-3">Cold Drinks &amp; Juices</h6>
								<a class="dropdown-item" href="./pages/shop-grid.html">Soft Drinks</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Fruit Juices</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Coldpress</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Water &amp; Ice Cubes</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Soda &amp; Mixers</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Health Drinks</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Herbal Drinks</a>
								<a class="dropdown-item" href="./pages/shop-grid.html">Milk Drinks</a>
							</div>
							<div class="col-lg-3 col-12 mb-4 mb-lg-0">
								<div class="card border-0">
									<img src="./assets/images/banner/menu-banner.jpg" alt="eCommerce HTML Template" class="img-fluid">
									<div class="position-absolute ps-6 mt-8">
										<h5 class=" mb-0 ">Dont miss this <br>
										offer today.</h5>
										<a href="#" class="btn btn-primary btn-sm mt-3">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Pages </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="./pages/blog.html">Blog</a></li>
						<li><a class="dropdown-item" href="./pages/blog-single.html">Blog Single</a></li>
						<li><a class="dropdown-item" href="./pages/blog-category.html">Blog Category</a></li>
						<li><a class="dropdown-item" href="./pages/about.html">About us</a></li>
						<li><a class="dropdown-item" href="./pages/404error.html">404 Error</a></li>
						<li><a class="dropdown-item" href="./pages/contact.html">Contact</a></li>
					</ul>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					Account </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="./pages/signin.html">Sign in</a></li>
						<li><a class="dropdown-item" href="./pages/signup.html">Signup</a></li>
						<li><a class="dropdown-item" href="./pages/forgot-password.html">Forgot Password</a></li>
						<li class="dropdown-submenu dropend">
						<a class="dropdown-item dropdown-list-group-item dropdown-toggle" href="#">
						My Account </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="./pages/account-orders.html">Orders</a></li>
							<li><a class="dropdown-item" href="./pages/account-settings.html">Settings</a></li>
							<li><a class="dropdown-item" href="./pages/account-address.html">Address</a></li>
							<li><a class="dropdown-item" href="./pages/account-payment-method.html">Payment Method</a>
							</li>
							<li><a class="dropdown-item" href="./pages/account-notification.html">Notification</a></li>
						</ul>
						</li>
					</ul>
					</li>
					<li class="nav-item ">
					<a class="nav-link" href="./dashboard/index.html">
					Dashboard </a>
					</li>
					<li class="nav-item dropdown dropdown-flyout">
					<a class="nav-link" href="#" id="navbarDropdownDocs" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Docs </a>
					<div class="dropdown-menu dropdown-menu-lg" aria-labelledby="navbarDropdownDocs">
						<a class="dropdown-item align-items-start" href="./docs/index.html">
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-file-text text-primary" viewbox="0 0 16 16">
							<path d="M5 4a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1H5z"></path>
							<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"></path>
							</svg>
						</div>
						<div class="ms-3 lh-1">
							<h6 class="mb-1">Documentations</h6>
							<p class="mb-0 small">
								 Browse the all documentation
							</p>
						</div>
						</a>
						<a class="dropdown-item align-items-start" href="./docs/changelog.html">
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-layers text-primary" viewbox="0 0 16 16">
							<path d="M8.235 1.559a.5.5 0 0 0-.47 0l-7.5 4a.5.5 0 0 0 0 .882L3.188 8 .264 9.559a.5.5 0 0 0 0 .882l7.5 4a.5.5 0 0 0 .47 0l7.5-4a.5.5 0 0 0 0-.882L12.813 8l2.922-1.559a.5.5 0 0 0 0-.882l-7.5-4zm3.515 7.008L14.438 10 8 13.433 1.562 10 4.25 8.567l3.515 1.874a.5.5 0 0 0 .47 0l3.515-1.874zM8 9.433 1.562 6 8 2.567 14.438 6 8 9.433z"></path>
							</svg>
						</div>
						<div class="ms-3 lh-1">
							<h6 class="mb-1">
							Changelog <span class="text-primary ms-1">v1.1.0</span>
							</h6>
							<p class="mb-0 small">
								See what's new
							</p>
						</div>
						</a>
					</div>
					</li>
				</ul>
			</div>
			<div class="d-block d-lg-none h-100" data-simplebar="init">
				<div class="simplebar-wrapper" style="margin: 0px;">
					<div class="simplebar-height-auto-observer-wrapper">
						<div class="simplebar-height-auto-observer">
						</div>
					</div>
					<div class="simplebar-mask">
						<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
							<div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: auto; overflow: hidden;">
								<div class="simplebar-content" style="padding: 0px;">
									<ul class="navbar-nav ">
										<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Home </a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="./index.html">Home 1</a></li>
											<li><a class="dropdown-item" href="./pages/index-2.html">Home 2</a></li>
											<li><a class="dropdown-item" href="./pages/index-3.html">Home 3</a></li>
											<li><a class="dropdown-item" href="./pages/index-4.html">Home 4 <span class="badge bg-light-info text-dark-info ms-1">New</span></a></li>
										</ul>
										</li>
										<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Shop </a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="./pages/shop-grid.html">Shop Grid - Filter</a></li>
											<li><a class="dropdown-item" href="./pages/shop-grid-3-column.html">Shop Grid - 3 column</a>
											</li>
											<li><a class="dropdown-item" href="./pages/shop-list.html">Shop List - Filter</a></li>
											<li><a class="dropdown-item" href="./pages/shop-filter.html">Shop - Filter</a></li>
											<li><a class="dropdown-item" href="./pages/shop-fullwidth.html">Shop Wide</a></li>
											<li><a class="dropdown-item" href="./pages/shop-single.html">Shop Single</a></li>
											<li><a class="dropdown-item" href="./pages/shop-single-2.html">Shop Single v2<span class="badge bg-light-info text-dark-info ms-1">New</span></a></li>
											<li><a class="dropdown-item" href="./pages/shop-wishlist.html">Shop Wishlist</a></li>
											<li><a class="dropdown-item" href="./pages/shop-cart.html">Shop Cart</a></li>
											<li><a class="dropdown-item" href="./pages/shop-checkout.html">Shop Checkout</a></li>
										</ul>
										</li>
										<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Stores </a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="./pages/store-list.html">Store List</a></li>
											<li><a class="dropdown-item" href="./pages/store-grid.html">Store Grid</a></li>
											<li><a class="dropdown-item" href="./pages/store-single.html">Store Single</a></li>
										</ul>
										</li>
										<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Mega Menu </a>
										<ul class="dropdown-menu">
											<li class="dropdown-submenu ">
											<a class="dropdown-item dropdown-list-group-item dropdown-toggle" href="#">
											Dairy, Bread &amp; Eggs </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Milk Drinks</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Curd &amp; Yogurt</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Eggs</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Buns &amp; Bakery</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Cheese</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Condensed Milk</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Dairy Products</a></li>
											</ul>
											</li>
											<li class="dropdown-submenu ">
											<a class="dropdown-item dropdown-list-group-item dropdown-toggle" href="#">
											Vegetables &amp; Fruits </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Vegetables</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Fruits</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Exotics &amp; Premium</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Fresh Sprouts</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Frozen Veg</a></li>
											</ul>
											</li>
											<li class="dropdown-submenu ">
											<a class="dropdown-item dropdown-list-group-item dropdown-toggle" href="#">
											Cold Drinks &amp; Juices </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Soft Drinks</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Fruit Juices</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Coldpress</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Soda &amp; Mixers</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Milk Drinks</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Health Drinks</a></li>
												<li><a class="dropdown-item" href="./pages/shop-grid.html">Herbal Drinks</a></li>
											</ul>
											</li>
										</ul>
										</li>
										<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Pages </a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="./pages/blog.html">Blog</a></li>
											<li><a class="dropdown-item" href="./pages/blog-single.html">Blog Single</a></li>
											<li><a class="dropdown-item" href="./pages/blog-category.html">Blog Category</a></li>
											<li><a class="dropdown-item" href="./pages/about.html">About us</a></li>
											<li><a class="dropdown-item" href="./pages/404error.html">404 Error</a></li>
											<li><a class="dropdown-item" href="./pages/contact.html">Contact</a></li>
										</ul>
										</li>
										<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Account </a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="./pages/signin.html">Sign in</a></li>
											<li><a class="dropdown-item" href="./pages/signup.html">Signup</a></li>
											<li><a class="dropdown-item" href="./pages/forgot-password.html">Forgot Password</a></li>
											<li class="dropdown-submenu dropend">
											<a class="dropdown-item dropdown-list-group-item dropdown-toggle" href="#">
											My Account </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="./pages/account-orders.html">Orders</a></li>
												<li><a class="dropdown-item" href="./pages/account-settings.html">Settings</a></li>
												<li><a class="dropdown-item" href="./pages/account-address.html">Address</a></li>
												<li><a class="dropdown-item" href="./pages/account-payment-method.html">Payment Method</a>
												</li>
												<li><a class="dropdown-item" href="./pages/account-notification.html">Notification</a></li>
											</ul>
											</li>
										</ul>
										</li>
										<li class="nav-item ">
										<a class="nav-link" href="./dashboard/index.html">
										Dashboard </a>
										</li>
										<li class="nav-item dropdown dropdown-flyout">
										<a class="nav-link" href="#" id="navbarDropdownDocs2" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Docs </a>
										<div class="dropdown-menu dropdown-menu-lg" aria-labelledby="navbarDropdownDocs2">
											<a class="dropdown-item align-items-start" href="./docs/index.html">
											<div>
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-file-text text-primary" viewbox="0 0 16 16">
												<path d="M5 4a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1H5z"></path>
												<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"></path>
												</svg>
											</div>
											<div class="ms-3 lh-1">
												<h6 class="mb-1">Documentations</h6>
												<p class="mb-0 small">
													 Browse the all documentation
												</p>
											</div>
											</a>
											<a class="dropdown-item align-items-start" href="./docs/changelog.html">
											<div>
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-layers text-primary" viewbox="0 0 16 16">
												<path d="M8.235 1.559a.5.5 0 0 0-.47 0l-7.5 4a.5.5 0 0 0 0 .882L3.188 8 .264 9.559a.5.5 0 0 0 0 .882l7.5 4a.5.5 0 0 0 .47 0l7.5-4a.5.5 0 0 0 0-.882L12.813 8l2.922-1.559a.5.5 0 0 0 0-.882l-7.5-4zm3.515 7.008L14.438 10 8 13.433 1.562 10 4.25 8.567l3.515 1.874a.5.5 0 0 0 .47 0l3.515-1.874zM8 9.433 1.562 6 8 2.567 14.438 6 8 9.433z"></path>
												</svg>
											</div>
											<div class="ms-3 lh-1">
												<h6 class="mb-1">
												Changelog <span class="text-primary ms-1">v1.1.0</span>
												</h6>
												<p class="mb-0 small">
													See what's new
												</p>
											</div>
											</a>
										</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
						<div class="simplebar-placeholder" style="width: 0px; height: 0px;">
						</div>
					</div>
					<div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
						<div class="simplebar-scrollbar" style="width: 0px; display: none;">
						</div>
					</div>
					<div class="simplebar-track simplebar-vertical" style="visibility: hidden;">
						<div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="section">
	  <div class="flexslider">
	    <ul class="slides" id="test">
	      <li class="fs-slide">
	        <div class="fs-item-bg fs-bg-1"></div>
	        <div class="fs-slideContents"></div>
	      </li>
	      <li class="fs-slide">
	        <div class="fs-item-bg fs-bg-2"></div>
	        <div class="fs-slideContents"></div>
	      </li>
	    </ul>
	  </div>
	</div>

</body>
</html>