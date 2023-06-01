<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<section class="mb-lg-14 mb-8 mt-8">
    <div class="m-container">
      <div class="row">
            <div><h1 class="fw-bold">Shop Cart</h1></div>
      </div>
      <div class="row">
        <div class="col-lg-8 col-md-7">
          <div class="py-3 listBox">
            <ul class="list-group list-group-flush">
              <li class="cartlist">
              </li>
            </ul>
          </div>
        </div>
        
        <!-- sidebar -->
        <div class="col-12 col-lg-4 col-md-5">
          <!-- card -->
          <div class="mb-5 card mt-6">
            <div class="card-body p-6">
              <!-- heading -->
              <h2 class="h5 mb-4">Summary</h2>
              <div class="card mb-2">
                <br>
                <!-- list group -->
                <ul class="list-groups list-group-flush">
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<script>
$(document).ready(function(){
 let api = '${api}';
  let token = localStorage.getItem("token");
   $.ajax({
       url: api + "/cart/list",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/text; charset=utf-8',
       dataType: "json",
       success: function (data) {
       var totalprice=0;
       for(var j=0; j<data.length; j++){
       var allprice = data[j].count * data[j].price;

       totalprice += allprice;

       $('.cartlist').append('<div class="row align-items-center listBoxItem"><div class="col-3 col-md-2">'
                             +'<img src="/resources/images/item/'+data[j].imgName+'" alt="" class="shop-img"/>'
                             +'</div>'
                             +'<div class="col-4 col-md-5"><a href="shop-single.html" class="text-inherit"><h3>'+data[j].itemNm+'  </h3></a>'
                             +'<button id="order" class="btn btn-primary px-3" data-id="'+data[j].cartItemId+'">주문하기</button><span>  </span><button id="rem" class="btn btn-primary px-3" data-id="'+data[j].cartItemId+'">Remove</button>'
                             +'<div class="mt-2 small lh-1"><a href="#!" class="text-decoration-none text-inherit"><span class="me-1 align-text-bottom"></span></a>'
                             +'</div>'
                             +'<div class="input-group input-spinner  ">'
                             +'<input type="button" value="-" id="minus'+data[j].cartItemId+'" data-price="'+data[j].price+'" data-count="'+data[j].count+'" data-id="'+data[j].cartItemId+'" class="button-minus  btn  btn-sm " data-field="quantity"/>'
                             +'<input type="number" min="1" id="count'+data[j].cartItemId+'" data-id="count'+data[j].cartItemId+'" value="'+data[j].count+'"class="quantity-field form-control-sm form-input" readonly/>'
                             +'<input type="button" value="+" id="plus'+data[j].cartItemId+'" data-price="'+data[j].price+'" data-count="'+data[j].count+'" data-id="'+data[j].cartItemId+'" class="button-plus btn btn-sm " data-field="quantity"/>'
                             +'&nbsp&nbsp&nbsp<span id="pricenum'+data[j].cartItemId+'" class="fw-bold">'+allprice+'원</span></div></div></div><hr>'
       );

       $('.list-groups').append('<li class="list-group-item d-flex justify-content-between align-items-start">'
                               +'<div class="me-auto"><div>'+data[j].itemNm+'</div></div>'
                               +'<span id="small'+data[j].cartItemId+'" value="'+allprice+'">'+allprice+'</span><span> 원</span>&nbsp&nbsp</li><hr>'
       );
       }

       $('.list-groups').append('<li class="list-group-item d-flex justify-content-between align-items-start">'
                                      +'<div class="me-auto"><div class="fw-bold">Total</div></div>'
                                      +'<span class="fw-bold" id="small" data-total="'+totalprice+'" value="'+totalprice+'">'+totalprice+'</span><span> 원</span>&nbsp&nbsp</li>'
                                 );
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           alert("로그인이 필요합니다.");
           location.href = "/";
       }
   })
   let fir = document.getElementById('small');
    var totalss=fir.dataset.total;
    var tt=Number(totalss);
   $('.button-plus').click(function(e){
   	    var n = $('.button-plus').index(this);
   	    var num = $(".form-input:eq("+n+")").val();
   	    num = $(".form-input:eq("+n+")").val(num*1+1);

   	            var num2 = e.target.dataset.id;
          	    var price1 = e.target.dataset.price;
          	    var prices = $("#count"+num2).val() * price1;

                if(($("#count"+num2).val()) > 1){
                   	    	$("#minus"+num2).attr("disabled", false);
                   	    }
          	    $('#pricenum'+num2).text(prices+"원");
          	    $('#small'+num2).text(prices);
          	    tt+=Number(price1);
          	    $('#small').text(tt);
   	 });

   	$('.button-minus').click(function(e){
   	var num = e.target.dataset.id;
   	    if(($("#count"+num).val()) < 3){
   	    	$("#minus"+num).attr("disabled", true);
   	    }
   	    let n2 = $('.button-minus').index(this);
   	  	let num2 = $(".form-input:eq("+n2+")").val();
   	    num2 = $(".form-input:eq("+n2+")").val(num2*1-1);


   	    var price1 = e.target.dataset.price;
   	    var prices = $("#count"+num).val() * price1;
   	      $('#pricenum'+num).text(prices+"원");
   	      $('#small'+num).text(prices);

   	      tt-=Number(price1);
          $('#small').text(tt);
   	});
});


$(document).on('click', '#rem', function(e){
let api = '${api}';
 let token = localStorage.getItem("token");
       var num = e.target.dataset.id;
   	  $.ajax({
   		 url : api + "/cart/list/"+num,
   		 type:'DELETE',
   	       async: false,
   	       cache: false,
   	       contentType: 'application/text; chartset=utf-8',
   	       dataType: "text",
   	       success: function (data) {
   	    	  alert("선택하신 장바구니가 삭제되었습니다.");
   	       },
   	       beforeSend: function (xhr) {
   	           xhr.setRequestHeader("Authorization", "Bearer " + token);
   	       },
   	       error: function (jqXHR, textStatus, errorThrown) {
   	           alert("장바구니 삭제 실패.");
   	       }
   	  }).done(function (res) {
              location.reload();
         })
});


$(document).on('click', '#order', function(e){
    	let api = '${api}';
    	var num = e.target.dataset.id;
        event.preventDefault();
        var counts= $("#count"+num).val()
         $.ajax({
                  type: "PATCH",
                  url: api+"/cart/list/"+num+"?count="+counts,
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  success: function(data) {
                        console.log('patch Success! : '+counts);
                         $.ajax({
                              type: "POST",
                              url: api+"/cart/list/cart-to-order/"+num,
                              async: false,
                              contentType: "application/json; charset=utf-8",
                              success: function(data) { console.log('cart to order Success!') },
                              beforeSend: function (xhr) {
                                  xhr.setRequestHeader("Content-type","application/json");
                                  xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                              },
                            }).done(function (res) {
                                  alert("주문하셨습니다.");
                                  location.reload();
                            }).fail(function (err) { alert("주문 실패"); })
                  },
                  beforeSend: function (xhr) {
                      xhr.setRequestHeader("Content-type","application/json");
                      xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                  },
                }).done(function (res) {
                   }).fail(function (err) { alert("주문 실패"); })
});
</script>
<%@ include file="fragments/footer.jsp"%>