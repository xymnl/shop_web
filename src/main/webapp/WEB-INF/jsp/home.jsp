<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp"%>
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
    	   for(let j in data){
    	   const itemPrice = data[j].price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		   $('.itme-list').append('<div class="item-box"><a href="detail/'+data[j].item_id+'">'
    		   						+ '<img class="item-img" src="/resources'+data[j].imgUrl+'" onerror=this.src="/resources/images/item/noImage.svg">'
    		   						+ '<div class="itemName" id="itemName">'+data[j].itemName+'<span class="itemPrice">'+itemPrice+'원</span></div><a><div>');
    	   }
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log("이미지 불러오기 실패");
       }
   });
});
</script>
	
<%@include file="fragments/footer.jsp"%>