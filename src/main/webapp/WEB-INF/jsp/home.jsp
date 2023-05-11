<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp"%>
	<div class="m-container">	
		<section class="categories">
			<div class="title"><h2>Fresh Shop's Items</h2></div>
			
			<div class="itme-list">
				<!-- <div class="item-body">
					<img class="item-img" src="/resources/imgs/product-img-1.jpg">
					<div class="itemName">상품명</div>
				</div>
				<div class="item-body">
					<img class="item-img" src="/resources/imgs/product-img-1.jpg">
					<div class="itemName">상품명</div>
				</div> -->
			</div>
		</section>
		
	</div>
	
<script>
$(document).ready(function(){
 let api = "http://localhost:8090";
   $.ajax({
       url: api + "/user/item",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
    	   console.log("data : "+JSON.stringify(data));
    	   for(var i in data){
    		   var name = [data[i].item_name];
    	   }
    	   for(var j=0; j<data.length; j++){
    		   $('.itme-list').append('<div class="item-body"><img class="item-img" src="/resources/imgs/product-img-1.jpg"><div class="itemName">'+data[j].item_name+'</div></div>');
    	   } 
    	   
    	   $.ajax({
    		   
    	   });
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   })
});
</script>
	
<%@include file="fragments/footer.jsp"%>