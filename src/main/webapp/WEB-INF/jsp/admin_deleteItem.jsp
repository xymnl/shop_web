<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api"/>
<%@include file="fragments/header.jsp" %>
<head>
    <!-- Freshshop CSS -->
    <link rel="stylesheet" href="/resources/css/freshshop/filebox.css">
</head>
<body>
<div class="m-container">
    <aside class="myPageLeftbar">
		<ul>
        			<li><div><a href="/admin_addItem" id="admin_addItemBtn">상품 등록</a></div></li>
        			<li><div><a href="/admin_updateItem" id="admin_updateItemBtn">상품 수정</a></div></li>
        			<li><div><a href="/admin_deleteItem" id="admin_deleteItemBtn">상품 삭제</a></div></li>
        </ul>
	</aside>
    <div class="myPageBody">
        <h3 class="orderTitleDetail">상품 삭제</h3>
        		<div style="overflow-x:hidden;overflow-y:scroll; width:700px; height:500px;" class="item-list">

        		</div>
        </div>

</div>
</body>

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
	    		   $('.item-list').append('<div class="row align-items-center"><div class="col-3 col-md-2">'
                                           +'<img src="/resources'+data[j].imgUrl+'" alt="" class="shop-img"/></div>'
                                           +'<div class="col-4 col-md-5"><a href="shop-single.html" class="text-inherit"><span>'+data[j].itemName+'</span></a>'
                                           +'<div class="mt-2 small lh-1"><a href="#!" class="text-decoration-none text-inherit"><span class="me-1 align-text-bottom"></span></a>'
                                           +'<span class="fw-bold">'+itemPrice+'원</span></div></div>'
                                           +'<div class="col-3 col-md-3 col-lg-2"><div class="input-group input-spinner  ">'
                                           +'<button id="delete" class="btn btn-primary px-2" data-id="'+data[j].item_id+'">상품 삭제</button>'
                                           +'</div></div>'
                                           +'<div class="col-2 text-lg-end text-start text-md-end col-md-2">'
                                           +'</div></div><hr>'
	    		   						);
	    	   }
	       },
	       beforeSend: function (xhr) {
	           xhr.setRequestHeader("Authorization", "Bearer " + token);
	       },
	       error: function (jqXHR, textStatus, errorThrown) {
	           alert("이미지 불러오기 실패");
	       }
	   })
	   });

$(document).on('click', '#delete', function(e){
let api = '${api}';
 let token = localStorage.getItem("token");
       var num = e.target.dataset.id;
   	  $.ajax({
   		 url : api + "/user/item/delete/"+num,
   		 type:'DELETE',
   	       async: false,
   	       cache: false,
   	       contentType: 'application/text; chartset=utf-8',
   	       dataType: "text",
   	       success: function (data) {
   	    	  alert("아이템이 삭제되었습니다.");
   	       },
   	       beforeSend: function (xhr) {
   	           xhr.setRequestHeader("Authorization", "Bearer " + token);
   	       },
   	       error: function (jqXHR, textStatus, errorThrown) {
   	           alert("아이템 삭제 실패.");
   	       }
   	  }).done(function (res) {
              location.reload();
         })
});
</script>
<script>
          let nowUrl = window.location.href;
          if(nowUrl.indexOf("admin_deleteItem")){
       	   document.getElementById('admin_deleteItemBtn').classList.add("active");
          }
</script>
<%@include file="fragments/footer.jsp" %>