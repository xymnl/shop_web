<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp"%>
<section class="mb-lg-14 mb-8 mt-8">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-12">
          <!-- card -->
          <div class="card py-1 border-0 mb-8">
            <div>
              <h1 class="fw-bold">Shop Cart</h1>
            </div>
          </div>
        </div>
      </div>
      <!-- row -->
      <div class="row">
        <div class="col-lg-8 col-md-7">
          <div class="py-3">
            <!-- alert -->
            <div class="alert alert-danger p-2" role="alert">
              You’ve got FREE delivery. Start <a href="#!" class="alert-link">checkout now!</a>
            </div>
            <ul class="list-group list-group-flush">
              <!-- list group -->
              <li class="orderlist">
              </li>
            </ul>
            </div>
          </div>
        </div>
      </div>
  </section>


<script>
$(document).ready(function(){
 let api = "http://localhost:8090";
  let token = localStorage.getItem("token");
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
       console.log(data[j].orderItemDtoList[0].count);
       console.log(data[j].orderItemDtoList[0]);
       console.log(data);
       console.log(allprice);
       $('.orderlist').append('<div class="row align-items-center"><div class="col-3 col-md-2">'
                             +'<img src="/resources/images/item/'+data[j].orderItemDtoList[0].imgUrl+'" alt="" class="shop-img"/>'
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
       }},
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
})
});

$(document).on('click', '#rem', function(e){
let api = "http://localhost:8090";
 let token = localStorage.getItem("token");
       var num = e.target.dataset.id;
       console.log(num);
   	  $.ajax({
   		 url : api + "/order/cancel/"+num,
   		 type:'POST',
   	       async: false,
   	       cache: false,
   	       contentType: 'application/text; chartset=utf-8',
   	       dataType: "text",
   	       success: function (data) {
   	    	  alert("주문이 취소되었습니다.");
   	       },
   	       beforeSend: function (xhr) {
   	           xhr.setRequestHeader("Authorization", "Bearer " + token);
   	       },
   	       error: function (jqXHR, textStatus, errorThrown) {
   	           console.log(jqXHR.status + textStatus + errorThrown);
   	       }
   	  }).done(function (res) {
              location.reload();
         })
});
</script>
<%@ include file="fragments/footer.jsp"%>