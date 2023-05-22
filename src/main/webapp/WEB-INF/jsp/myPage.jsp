<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>

<div class="m-container">
	<aside class="myPageLeftbar">
		<ul>
			<li>홈</li>
			<li>주문 내역</li>
			<li><a href="/updateUser">개인정보 수정</a></li>
		</ul>
	</aside>
	<div class="myPageBody">
		<div class="myPageTitle"><h2 class="titleText">나의 페이지</h2></div>
		<div class="myInfoBox">
			<ul>

				<li><div class="myInfoName"></div></li>
				<li><div class="myInfoBtn"><a href="/updateUser">개인정보수정</a></div></li>
				<li><div class="myInfodelete">회원탈퇴</div></li>
				
			</ul>
		</div>

        <!-- 폐기하려면 폐기 ㄱㄱ -->
		            <li>이름</li>
                    <span class='span_dataset1'></span>
                    <li>이메일</li>
                    <span class='span_dataset2'></span>
                    <li>주소</li>
                    <span class='span_dataset3'></span>
         <!-- 폐기하려면 폐기 ㄱㄱ -->


		<div class="orderTitle"><h3 class="titleText">주문내역</h3>
		</div>
		<div class="orderBox">
		<a href="#" class="moreBtn">더보기 +</a>

		</div>
		
	</div>
</div>





<script>
        let api = "http://localhost:8090";
        var token = localStorage.getItem("token");

        $(document).ready(function(){

                let data;

                // Ajax를 이용한 회원 조회
                $.ajax({
                    type: "GET",
                    url: api+"/user/info",
                    async: false,
                    contentType: "application/text; charset=utf-8",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function(data) {
                            $('.span_dataset1').text(data.name);
                            $('.span_dataset2').text(data.email);
                            $('.span_dataset3').text(data.address);

                            $.ajax({
                                   url: api + "/order",
                                   type: 'GET',
                                   async: false,
                                   cache: false,
                                   contentType: 'application/text; charset=utf-8',
                                   dataType: "json",
                                   success: function (data) {
                                   for(var j=0; j<data.length; j++){
                                   var allprice=data[j].orderItemDtoList[0].count * data[j].orderItemDtoList[0].orderPrice;
                                   if(data != null){
                                   console.log(data);
                                   $('.orderBox').append('<div class="row align-items-center"><div class="col-3 col-md-2">'
                                                         +'<img src="/resources'+data[j].orderItemDtoList[0].imgUrl+'" alt="" class="shop-img"/>'
                                                         +'</div>'
                                                         +'<div class="col-4 col-md-5"><a href="shop-single.html" class="text-inherit"><span>'+data[j].orderDate+'</span></a></div>'
                                                         +'<div class="mt-2 small lh-1"><a href="#!" class="text-decoration-none text-inherit"><span class="me-1 align-text-bottom"></span></a>'
                                                         +'<button id="rem" data-id="'+data[j].orderId+'">Cancel</button>'
                                                         +'</div>'
                                                         +'<div class="col-3 col-md-3 col-lg-2"><div class="input-group input-spinner  ">'
                                                         +'<input type="number" value="'+data[j].orderItemDtoList[0].count+'"class="quantity-field form-control-sm form-input"/>'
                                                         +'</div></div>'
                                                         +'<div class="col-2 text-lg-end text-start text-md-end col-md-2">'
                                                         +'<span>'+data[j].orderStatus+'</span><span class="fw-bold">'+allprice+'원</span></div></div>'
                                   );
                                   }else{
                                   $('.orderBox').append('<ul><li><p class="noOrder">주문하신 내역이 없습니다.</p></li></ul>');
                                   }
                                   }},
                                   beforeSend: function (xhr) {
                                       xhr.setRequestHeader("Authorization", "Bearer " + token);
                                   },
                                   error: function (jqXHR, textStatus, errorThrown) {
                                       console.log(jqXHR.status + textStatus + errorThrown);
                                   }
                            })

                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                }).fail(function (err) {
                    alert(JSON.stringify(err));
                })
        });

$(document).on('click', '.myInfodelete', function(e){
    	let api = "http://localhost:8090";
        // 기본 이벤트 제거
        event.preventDefault();
         $.ajax({
                  type: "DELETE",
                  url: api+"/user/delete",
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  success: function(data) {
                        console.log('계정삭제완료');
                  },
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader("Content-type","application/json");
                      xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                  },
                }).done(function (res) {
                alert("계정삭제완료");
                window.localStorage.clear();
                          location.href = "/";
                }).
                fail(function (err) { alert("개인정보수정 실패"); })
});
</script>

<%@ include file="fragments/footer.jsp" %>