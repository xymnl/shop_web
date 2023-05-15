/* ===== Google tag (gtag.js) ===== */
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'G-M8S4MT3EYG');

$(document).ready(function(){
	/* ===== Login JS ===== */ 
	let api = "http://localhost:8090";
	var token = sessionStorage.getItem("Authorization");
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
			   console.log('Success!')
			   localStorage.setItem('token', data.token);
		   },
		   beforeSend: function (xhr) {
			   xhr.setRequestHeader("Content-type","application/json");
			   xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
	       },
	   }).done(function (res) {
			   alert("로그인이 완료되었습니다.");
			   var email = data.email;            
			   location.href = "/";
			   $(".enter_email").html("내 정보");
	   		}).fail(function (err) {
	   			alert(JSON.stringify(err));
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
                console.log(data)
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization","Bearer " + token);
            },
        }).done(function (res) {
            var email = res.email;
            var name = res.name;

            if(res != null){
           	 $('.mypageLink').remove();
           	 $('.mypageButton').append('<span class="msg">'+res.email+'</span>');
    	     $('#logout_btn').append('<a href="/" class="logout"><i class="bi bi-box-arrow-right"></i></a>');
            }

            if(email.includes('admin')){
            	$('#inquiry').append('<a href="/admin_inquiry">문의 관리</a>');
            	$('.inquiry_box').append('<h2 class="inquiry_title">문의 내역입니다.</h2>');
            }else {
            	$('#inquiry').append('<a href="/inquiry">문의</a>');
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
});