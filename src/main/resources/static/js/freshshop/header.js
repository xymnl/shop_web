

/* ===== Google tag (gtag.js) ===== */
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'G-M8S4MT3EYG');

$(document).ready(function(){
	/* ===== Login JS ===== */ 
	let api = "http://localhost:8090";
	//let api = "http://3.34.134.70:8080/hong";
	var token = sessionStorage.getItem("Authorization");
	
	document.getElementById("myInfo").style.display= "none";
	document.getElementById("inquiry").style.display= "none";
	document.getElementById("admin_addItem").style.display= "none";
	$('.badge').append(0);

	// 로그인 폼 submit 이벤트 처리
	$("#login-btn").on("click", function (){
		event.preventDefault();
		let data ={
			email : $("#email").val(),
			password : $("#password").val()
	   }
	   // Ajax를 이용한 로그인 처리
	   $.ajax({
		   type: "POST",
		   url: api+"/user/login",
		   async: false,
		   contentType: "application/json; charset=utf-8",
		   data: JSON.stringify(data),
		   dataType: "json",
		   success: function(data) {
			   localStorage.setItem('token', data.token);
		   },
		   beforeSend: function (xhr) {
			   xhr.setRequestHeader("Content-type","application/json");
			   xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
	       },
	   }).done(function (res) {
			   alert("로그인이 완료되었습니다.");
			   location.href = "/";
	   		}).fail(function (err) {
	   			alert("아이디 또는 비밀번호가 틀립니다.");
	   		})
	 });
	var token = localStorage.getItem("token");
    let data;
    // Ajax를 이용한 회원 조회
    if(token != null){
    	$.ajax({
            type: "GET",
            url: api+"/user/info",
            async: false,
            contentType: "application/text; charset=utf-8",
            data: JSON.stringify(data),
            dataType: "json",
            success: function(data) {
                /* ===== 장바구니 담겨 있는 리스트 개수 ====== */
            	$.ajax({
                   url: api + "/cart/list",
                   type: 'GET',
                   async: false,
                   cache: false,
                   contentType: 'application/text; charset=utf-8',
                   dataType: "json",
                   success: function (data) {
                	   let count = 0;
                	   for(let i in data){
                		   count++;
                	   }
                	   $('.badge').empty();
                	   $('.badge').append(count);
                   },
                   beforeSend: function (xhr) {
                       xhr.setRequestHeader("Authorization", "Bearer " + token);
                   },
                   error: function (jqXHR, textStatus, errorThrown) {
                       alert("로그인이 필요합니다.");
                       location.href = "/";
                   }
                });
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization","Bearer " + token);
            },
        }).done(function (res) {
            var email = res.email;
            var name = res.name;
            
    		document.getElementById("myInfo").style.display= "";
    		document.getElementById("inquiry").style.display= "";
			document.getElementById("admin_addItem").style.display= "";

            if(res != null){
           	 $('.mypageLink').remove();
           	 $('.mypageButton').append('<a href="/" class="logout">로그아웃</a>');
           	 $('.mypageButton').append('<a href="/" class="logoutM"><i class="bi bi-box-arrow-right"></i></a>');
    	     $('#myInfo').append('<a href="/mypage" class="myinfoBtn">내 정보 </a>');
    	     $('#myInfo').append('<a href="/mypage" class="myinfoBtnM"><i class="bi bi-person-exclamation"></i></a>');
    	     $('.myInfoName').append(name+'<p class="myInfoemail">'+email+'</p>');
            }
            
            if(email.includes('admin')){
				$('#admin_addItem').append('<a href="/admin_addItem" class="admin_Item">상품 관리</a>');
				$('#admin_addItem').append('<a href="/admin_addItem" class="admin_ItemM"><img src="/resources/images/product.png" alt="상품관리"></a>');
            	$('#inquiry').append('<a href="/admin_inquiry" class="inquryBtn">문의 관리</a>');
            	$('#inquiry').append('<a href="/admin_inquiry" class="inquryBtnM"><img src="/resources/images/inquiry.png" alt="문의관리"></a>');
            	$('.inquiry_box').append('<h2 class="inquiry_title">문의 내역입니다.</h2>');
            }else {
            	$('#inquiry').append('<a href="/inquiry" class="inquryBtn">문의</a>');
            	$('.inquiry_box').append('<h2 class="inquiry_title">'+name+'님의 문의 내역</h2>');
            }
        }).fail(function (err) {
            	/* alert(JSON.stringify(err)); */
            	alert('로그인이 필요합니다.');
   	    	})
   		}
	    
    /* ===== Logout ===== */
    $('.logout').on("click",function() {
   	 window.localStorage.clear();
   	 console.log(token);
    });
    
    /* ===== 모든 카테고리 버튼 ===== */
    let categoryBtn = document.getElementById('allCategories');
    let categorybox = document.getElementById('categoryBox');
    $(categoryBtn).on("click",function(){
		$(categorybox).toggleClass("show");
    });
    
    /* ===== 카테고리 별 버튼  ===== */
    $('#fashion').on("click",function(){
   	 	location.href="http://localhost:8091/shop_dairy?"+this.id;
     });
    $('#beauty').on("click",function(){
   	 	location.href="http://localhost:8091/shop_dairy?"+this.id;
     });
    $('#food').on("click",function(){
   	 	location.href="http://localhost:8091/shop_dairy?"+this.id;
     });
    
});
