<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="fragments/header.jsp" %>

<div class="h-container">
<aside class="myPageLeftbar">
		<ul>
			<li><div><a href="/mypage" id="homeBtn">홈</a></div></li>
			<li><div><a href="/orderList" id="orderBtn">주문 내역</a></div></li>
			<li><div><a href="/updateUser" id="updateBtn">개인정보 수정</a></div></li>
		</ul>
	</aside>
	<div class="myPageBody">
		<h3 class="orderTitleDetail">주문내역</h3>
		<div style="overflow-x:hidden;overflow-y:scroll; width:700px; height:500px;" class="orderListBoxDetail">

		</div>
	</div>

</div>

<script>
let api = '${api}';
let token = localStorage.getItem("token");
let nowUrl = window.location.href;
if(nowUrl.indexOf("orderList")){
	   document.getElementById('orderBtn').classList.add("active");
}
$(document).ready(function(){
    let data;
    $.ajax({
        type: "GET",
        url: api+"/user/info",
        async: false,
        contentType: "application/text; charset=utf-8",
        data: JSON.stringify(data),
        dataType: "json",
        success: function(data) {
            $.ajax({
                url: api + "/order",
                type: 'GET',
                async: false,
                cache: false,
                contentType: 'application/text; charset=utf-8',
                dataType: "json",
                success: function (data) {
                    if(data > ""){
                    	for(var j=0; j<data.length; j++){
                    		var allprice=data[j].orderItemDtoList[0].count * data[j].orderItemDtoList[0].orderPrice;
                    		console.log("order데이터 : "+data);
		                    $('.orderListBoxDetail').append('<div class="row align-items-center"><div class="col-3 col-md-2">'
                                    +'<img src="/resources'+data[j].orderItemDtoList[0].imgUrl+'" alt="" class="shop-img"/>'
                                    +'</div>'
                                    +'<div class="col-4 col-md-5"><a href="shop-single.html" class="text-inherit"><span>'+data[j].orderDate+'</span></a>'
                                    +'<div class="mt-2 small lh-1"><a href="#!" class="text-decoration-none text-inherit"><span class="me-1 align-text-bottom"></span></a>'
                                    +'<span>'+data[j].orderItemDtoList[0].count+'</span><span>&nbsp개</span>'
                                    +'&nbsp&nbsp<span class="fw-bold">'+allprice+'원</span></div></div>'
                                    +'<div class="col-3 col-md-3 col-lg-2"><div class="input-group input-spinner  ">'
                                    +'<button id="rem" data-id="'+data[j].orderId+'">주문취소하기</button>'
                                    +'</div></div>'
                                    +'<div class="col-2 text-lg-end text-start text-md-end col-md-2">'
                                    +'<span>'+data[j].orderStatus+'&nbsp&nbsp</span></div></div><hr>'
		                    );
                    	}
                    }else {
                    	$('.orderListBoxDetail').append('<ul><li><p class="noOrder">주문하신 내역이 없습니다.</p></li></ul>');
                    }
                },
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
</script>

<%@ include file="fragments/footer.jsp" %>