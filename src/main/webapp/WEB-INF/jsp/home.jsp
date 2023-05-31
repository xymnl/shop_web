<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@include file="fragments/header.jsp"%>
	<div class="m-container">
		<section class="categories">
			<div class="title"><h2>Fresh Shop's Items</h2></div>
			<div class="itme-list" id="item">
			</div>
		</section>
				<div class="pagenation_box">
                   	<ul class="pagination pagination-seperated "></ul>
               	</div>
    </div>
<script>

$(document).ready(function(){
    let api = '${api}';
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
	           alert("이미지 불러오기 실패");
	       }
	   });
    $('#getValue').on("click",function(){
        $('.item-box').remove();
        $('.pagination').remove();
    	let searchQuery = $('#rounded').val();
    	let api = '${api}';
        var token = localStorage.getItem("token");
    	 $.ajax({
   	       url: api + "/user/item?searchQuery="+searchQuery,
   	       type: 'GET',
   	       async: false,
   	       cache: false,
   	       contentType: 'application/json; chartset=utf-8',
   	       success: function (data) {
   	    	   for(let j in data){
   	    	   const itemPrice = data[j].price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
   	    		   $('.item-list').append('<div class="item-box"><a href="detail/'+data[j].item_id+'">'
   	    		   						+ '<img class="item-img" src="/resources'+data[j].imgUrl+'" onerror=this.src="/resources/images/item/noImage.svg">'
   	    		   						+ '<div class="itemName" id="itemName">'+data[j].itemName+'<span class="itemPrice">'+itemPrice+'원</span></div><a><div>'
  	    		   						);
   	    		
   	    	   }
   	       },
   	       beforeSend: function (xhr) {
   	           xhr.setRequestHeader("Authorization", "Bearer " + token);
   	       },
   	       error: function (jqXHR, textStatus, errorThrown) {
   	           alert("이미지 불러오기 실패");
   	       }
   	   });
    	 $('.pagenation_box').append('<ul class="pagination pagination-seperated "></ul>');
    	 homePagination();
    })
    
    
    
   	/* === home.jsp 상품 페이지네이션 === */
	function homePagination() {
		var req_num_row = 10 // 화면에 표시할 상품 개수
		var $tr = jQuery('.item-box');	// paging 대상 class명
		var total_num_row = $tr.length;
		console.log("total_num_row 개수 : "+total_num_row);
		var num_pages = 0;
		if(total_num_row % req_num_row == 0){
			num_pages = total_num_row / req_num_row;
		}
		if(total_num_row%req_num_row >= 1) {
			num_pages = total_num_row/req_num_row;
			num_pages++;
			num_pages = Math.floor(num_pages++);
		}
		console.log("num_pages 개수 : "+num_pages);
		jQuery('.pagination').append('<li class="page-item">'
				+ '<a class="page-link" href=# aria-label="Previous"'
				+ '<span aria-hidden="true" class="mdi mdi-chevron-left"></span>'
				+ '<span class="prev">Previous</span></a></li>');
		for(var i=1; i <= num_pages; i++){
			jQuery('.pagination').append('<li class="page-item"><a class="page-link" href="#">'+i+'</a></li>');
			jQuery('.pagination li:nth-child(2)').addClass("active");
			jQuery('.pagination a').addClass("pagination-link");
		}
		jQuery('.pagination').append('<li class="page-item">'
				+ '<a class="page-link" href="#" aria-label="Next">'
				+ '<span aria-hidden="true" class="mdi mdi-chevron-right"></span>'
				+ '<span class="next">Next</span></a></li>');
		$tr.each(function(i){
			jQuery(this).hide();
			if(i+1 <= req_num_row){
				$tr.eq(i).show();
			}
		});
		
		if(num_pages == 1){
			jQuery('.pagination li:last-child').addClass("disabled");
		}
		
		jQuery('.pagination a').click('.pagination-link', function(e){
			e.preventDefault();
			$tr.hide();
			var page = jQuery(this).text();
			var temp = page - 1;
			var start = temp * req_num_row;
			var current_link = temp;
			jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");
			for( var i=0; i<req_num_row; i++){
				$tr.eq(start + i).show();
			}
			
			if(!page.indexOf("Next")){ // next 버튼 선택 시
				var num = total_num_row -1 ;
				$tr.eq(num).show();
				jQuery('.pagination li:nth-child('+(num_pages+1)+')').addClass("active");
				jQuery('.pagination li:last-child').addClass("disabled");
				jQuery('.pagination li:first-child').removeClass("disabled");
			}else if(!page.indexOf("Previous")){ // prev 버튼 선택 시
				for( var i=0; i<req_num_row; i++){
					$tr.eq(i).show(); // 첫번째 페이지에 해당하는 상품 개수만큼 보여주기
				}
				jQuery('.pagination li:nth-child(2)').addClass("active");	
				jQuery('.pagination li:first-child').addClass("disabled");
				jQuery('.pagination li:last-child').removeClass("disabled");
			}else {
				if(page == 1){ // 1번 페이지 선택 시
					jQuery('.pagination li:first-child').addClass("disabled"); // prev 비활성
					if(num_pages > 2) jQuery('.pagination li:last-child').removeClass("disabled"); // 1,2,3 ... 버튼 존재 시
					else jQuery('.pagination li:last-child').addClass("disabled"); // 1번 버튼만 존재 시
				}else if(page == num_pages){ // 마지막 페이지 선택 시
					jQuery('.pagination li:first-child').removeClass("disabled"); // prev 활성
					jQuery('.pagination li:last-child').addClass("disabled");
				}else { // 1,마지막 제외 버튼 선택 시
					jQuery('.pagination li:first-child').removeClass("disabled"); // prev 활성
					jQuery('.pagination li:last-child').removeClass("disabled"); // next 활성
				}
			}
		});
	}
	jQuery('document').ready(function() {
		homePagination();
		jQuery('.pagination li:first-child').addClass("disabled");
		$('#getValue').on("click",function(){
			$(document).off(); // 검색 버튼 눌렀을때 모든 이벤트 종료
		})
	});
});


</script>
	
<%@include file="fragments/footer.jsp"%>