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
	
<%@include file="fragments/footer.jsp"%>