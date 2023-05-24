<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


<h2 class="inquiry_title">검색 상품 결과</h2>
<div class="m-container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-hover dt-responsive">
                <thead>
                    <tr>
                        <th>상품번호</th>
                        <th>상품이름</th>
                        <th>상품가격</th>
                        <th>상품수량</th>
                        <th>주문상세</th>
                        <th>판매상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items = "${list}" var="list">
                        <tr>
                            <td><a href="../detail/${list.item_id}"><c:out value="${list.item_id}"></c:out></a></td>
                            <td><a href="../detail/${list.item_id}"><c:out value="${list.item_name}"></c:out></a></td>
                            <td><a href="../detail/${list.item_id}"><c:out value="${list.price}"></c:out></a></td>
                            <td><a href="../detail/${list.item_id}"><c:out value="${list.stock_number}"></c:out></a></td>
                            <td><a href="../detail/${list.item_id}"><c:out value="${list.item_detail}"></c:out></a></td>
                            <td><a href="../detail/${list.item_id}"><c:out value="${list.item_sell_status}"></c:out></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

	<div class="m-container">
		<section class="categories">
			<div class="title"><h2>Fresh Shop's Items</h2></div>
			<div class="itme-list" id="item">
			</div>
		</section>
	</div>

<script>
$(document).ready(function(){
 let api = "http://localhost:8090";
 var token = localStorage.getItem("token");
   $.ajax({
       url: api + "/user/item",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
    	   console.log("데이터 불러오기 " + JSON.stringify(data));
    	   for(let j in data){
    		   $('.itme-list').append('<a href="detail/'+data[j].item_id+'" class="item-box">'
    		   						+ '<img class="item-img" src="/resources'+data[j].imgUrl+'" onerror=this.src="/resources/images/item/noImage.svg">'
    		   						+ '<div class="itemName" id="itemName">'+data[j].itemName+'</div><a>');
    	   }
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   });
});
</script>

<%@ include file="fragments/footer.jsp" %>