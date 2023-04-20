<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FreshCart - eCommerce HTML Template</title>
	<link rel="icon" href="/resources/imgs/favicon-logo.svg" sizes="32x32" type="image/png">

	<!-- BootStrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css"> <!-- 부트스트랩 아이콘  -->

	<!-- Freshshop CSS -->
	<link rel="stylesheet" href="/resources/css/freshshop/header.css">
	<link rel="stylesheet" href="/resources/css/freshshop/home.css">
	<link rel="stylesheet" href="/resources/css/freshshop/modals.css">
	<link rel="stylesheet" href="/resources/css/freshshop/slick.css">
	<link rel="stylesheet" href="/resources/css/freshshop/slick-theme.css">

	<!-- js -->
	<script src="/resources/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/slick.js"></script>

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-M8S4MT3EYG"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-M8S4MT3EYG');
    </script>

	<!-- slick slide -->
	<script type="text/javascript">
    $(document).on('ready', function() {
      $(".lazy").slick({
        dots:true,
        lazyLoad: 'ondemand', // ondemand progressive anticipated
        infinite: true,
        autoplay : true,
        arrows:false
      });
      $(".center").slick({
          infinite: true,
          slidesToShow: 5,
          slidesToScroll: 1,
          autoplay : true,
          arrows:false
        });
    });
</script>
</head>
<body>
	<header>
		<div class="border-bottom">
           <div class="py-4 pt-lg-3 pb-lg-0">
             <div class="container">
               <div class="row w-100 align-items-center gx-lg-2 gx-0">
                 <div class="col-xxl-2 col-lg-3"> <!-- 로고 이미지 / 선택 시 메인 페이지 이동 -->
                   <a class="navbar-brand d-none d-lg-block logo" href="#"><img src="/resources/imgs/logo.png" alt="로고 이미지">Fresh Shop</a>
                 </div>
                 <div class="col-xxl-6 col-lg-5 d-none d-lg-block"> <!-- 제품 검색 영역 -->
                   <form action="#">
                     <div class="input-group">
                       <input class="form-control rounded" type="search" placeholder="Search for products">
                       <span class="input-group-append">
                         <button class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end" type="button">
                         	<i class="bi bi-search"></i>
                         </button>
                       </span>
                     </div>
                   </form>
                 </div>
                 <div class="col-md-4 col-xxl-4 text-end d-none d-lg-block"> <!-- 위시 버튼;하트 -->
                   <div class="list-inline">
                     <div class="list-inline-item">
                       <a href="../../pages/shop-wishlist.html" class="text-muted position-relative">
						<i class="bi bi-heart"></i>
                         <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                           5 <span class="visually-hidden">unread messages</span>
                         </span>
                       </a>
                      </div>
                     <div class="list-inline-item"> <!-- 마이페이지 버튼 -->
                     <!-- 비로그인 상태에서 마이페이지 버튼 선택 -->
                       <a href="#!" class="text-muted" data-bs-toggle="modal" data-bs-target="#userModal"><i class="bi bi-person"></i></a>
                       <!-- 로그인 모달 -->
                       <div class="modal fade" tabindex="-1" role="dialog" id="userModal">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content rounded-4 shadow">
						      <div class="modal-header p-5 pb-4 border-bottom-0">
						        <h1 class="fw-bold mb-0 fs-2">로그인</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body p-5 pt-0">
						        <form class="">
						          <div class="form-floating mb-3">
						            <input type="email" class="form-control rounded-3" id="floatingInput" placeholder="input@email.com" required>
						            <label for="floatingInput">이메일을 입력하세요.</label>
						          </div>
						          <div class="form-floating mb-3">
						            <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password" required>
						            <label for="floatingPassword">비밀번호를 입력하세요.</label>
						          </div>
						          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">로그인</button>
						          <small class="text-body-secondary">계정이 없으신가요?</small><br>
						          <small class="text-body-secondary">Fresh Shop의 회원이 되어 혜택을 누리세요! <a href="/createUser">회원가입</a></small>
						          <hr class="my-4">
						          <h2 class="fs-5 fw-bold mb-3">소셜 로그인</h2>
						          <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="submit"></i>Sign up with Google</button>
						          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="submit">Sign up with Naver</button>
						        </form>
						      </div>
						    </div>
						  </div>
						</div> <!-- END : userModal -->
                     </div>
                     <div class="list-inline-item"> <!-- 장바구니 버튼 -->
                       <a class="text-muted position-relative " data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                         href="#offcanvasExample" role="button" aria-controls="offcanvasRight">
                         <i class="bi bi-cart3"></i>
                         <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                           1<span class="visually-hidden">unread messages</span>
                         </span>
                       </a>
                     </div>
                   </div>
                 </div>
               </div>
             </div>
           </div> <!-- END : py-4 pt-lg-3 pb-lg-0 -->
         <nav class="navbar navbar-expand-lg navbar-light navbar-default py-0 py-lg-4">
           <div class="container px-0 px-md-3">
             <div class="dropdown me-3 d-none d-lg-block"> <!-- 모든 카테고리 버튼 -->
               <button class="btn btn-primary px-6 " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                 <span class="me-1"><i class="bi bi-grid"></i></span> 모든 카테고리
               </button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                 <li><a class="dropdown-item" href="shop">Dairy, Bread & Eggs</a></li>
                 <li><a class="dropdown-item" href="#">Snacks & Munchies</a></li>
                 <li><a class="dropdown-item" href="#">Fruits & Vegetables</a></li>
               </ul>
             </div> <!-- END : 모든 카테고리 버튼 -->
             <div class="offcanvas offcanvas-start p-4 p-lg-0" id="navbar-default"> <!-- 오프캔버스??? 뭘 눌러야 나오는지 모르겠음... -->
               <div class="d-none d-lg-block"> <!-- 간단한 네비게이션 영역 -->
                 <ul class="navbar-nav align-items-center ">
                   <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                       Shop
                     </a>
                     <ul class="dropdown-menu">
                       <li><a class="dropdown-item" href="#">Shop Grid - Filter</a></li>
                       <li><a class="dropdown-item" href="#">Shop Grid - 3 column</a></li>
                       <li><a class="dropdown-item" href="#">Shop List - Filter</a></li>
                       <li><a class="dropdown-item" href="#">Shop - Filter</a></li>
                     </ul>
                   </li>
                   <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Stores</a>
                     <ul class="dropdown-menu">
                       <li><a class="dropdown-item" href="#">Store List</a></li>
                       <li><a class="dropdown-item" href="#">Store Grid</a></li>
                       <li><a class="dropdown-item" href="#">Store Single</a></li>
                     </ul>
                   </li>
                   <li class="nav-item"> <!-- 관리자 로그인 시 노출 -->
                     <a class="nav-link" href="#">Dashboard</a>
                   </li>
                 </ul>
               </div> <!-- END : 간단한 네비게이션 영역 -->
             </div> <!-- END : 오프캔버스 -->
           </div>
         </nav>
       </div>
	</header>
