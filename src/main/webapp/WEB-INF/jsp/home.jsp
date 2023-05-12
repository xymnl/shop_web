<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp"%>
	<div class="m-container">	
		<section class="categories">
			<div class="title"><h2>Fresh Shop's Items</h2></div>
			
			<div class="itme-list" id="item">
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
    	   console.log("home 에서 출력하는 data "+JSON.stringify(data));
    	   for(var j=0; j<data.length; j++){
    		    /*$('.itme-list').append('<div id="item-body" onclick="myFunction(this)"><img class="item-img" src="/resources/imgs/product-img-1.jpg"><div class="itemName" id="itemName">'+data[j].item_name+'<span id="itemId'+j+'">'+data[j].item_id+'</span></div></div>');*/
    		   $('.itme-list').append('<a href="detail/'+data[j].item_id+'"><div id="item-body" onclick="myFunction(this)"><img class="item-img" src="/resources/imgs/product-img-1.jpg"><div class="itemName" id="itemName">'+data[j].item_name+'</div></div><a>');
    	   }
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   });
   
   $.ajax({
       url: api + "/user/item/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
    	   		console.log("상품상세 data : "+data);
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