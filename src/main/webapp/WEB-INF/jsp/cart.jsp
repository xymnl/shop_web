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
              <p class="mb-0">Shopping in 382480</p>
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
              <li class="list-group-item py-3 py-lg-0 px-0 border-top">
                <!-- row -->
                <div class="row align-items-center">
                  <div class="col-3 col-md-2">
                    <!-- img --> <img src="../assets/images/products/product-img-1.jpg" alt="Ecommerce" class="img-fluid"></div>
                  <div class="col-4 col-md-5">
                    <!-- title -->
                    <a href="shop-single.html" class="text-inherit"><h6 id="name"></h6></a>
                    <span><small class="text-muted">.98 / lb</small></span>
                    <!-- text -->
                    <div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">
                          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                            </path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                          </svg></span><span class="text-muted">Remove</span></a></div>
                  </div>
                  <!-- input group -->
                  <div class="col-3 col-md-3 col-lg-2">
                       <!-- input -->
                  <div class="input-group input-spinner  ">
                    <input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">
                    <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input   ">
                    <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                  </div>


                  </div>
                  <!-- price -->
                  <div class="col-2 text-lg-end text-start text-md-end col-md-2">
                    <span class="fw-bold">$5.00</span>
                  </div>
                </div>
              </li>

              <!-- list group -->
              <li class="cartlist">

              </li>


        <!-- sidebar -->
        <div class="col-12 col-lg-4 col-md-5">
          <!-- card -->
          <div class="mb-5 card mt-6">
            <div class="card-body p-6">
              <!-- heading -->
              <h2 class="h5 mb-4">Summary</h2>
              <div class="card mb-2">
                <!-- list group -->
                <ul class="list-group list-group-flush">
                  <!-- list group item -->
                  <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="me-auto">
                      <div>Item Subtotal</div>

                    </div>
                    <span>$70.00</span>
                  </li>

                  <!-- list group item -->
                  <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="me-auto">
                      <div>Service Fee</div>

                    </div>
                    <span>$3.00</span>
                  </li>
                  <!-- list group item -->
                  <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="me-auto">
                      <div class="fw-bold">Subtotal</div>

                    </div>
                    <span class="fw-bold">$67.00</span>
                  </li>
                </ul>

              </div>
              <div class="d-grid mb-1 mt-4">
                <!-- btn -->
                <button class="btn btn-primary btn-lg d-flex justify-content-between align-items-center" type="submit">
                  Go to Checkout <span class="fw-bold">$67.00</span></button>
              </div>
              <!-- text -->
              <p><small>By placing your order, you agree to be bound by the Freshcart <a href="#!">Terms of Service</a>
                  and <a href="#!">Privacy Policy.</a> </small></p>

              <!-- heading -->
              <div class="mt-8">
                <h2 class="h5 mb-3">Add Promo or Gift Card</h2>
                <form>
                  <div class="mb-2">
                    <!-- input -->
                    <label for="giftcard" class="form-label sr-only">Email address</label>
                    <input type="text" class="form-control" id="giftcard" placeholder="Promo or Gift Card">

                  </div>
                  <!-- btn -->
                  <div class="d-grid"><button type="submit" class="btn btn-outline-dark mb-1">Redeem</button></div>
                  <p class="text-muted mb-0"> <small>Terms &amp; Conditions apply</small></p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


<script>
/* inquiry.jsp */
$(document).ready(function(){
 let api = "http://localhost:8090";
   $.ajax({
       url: api + "/cart/list",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/text; charset=utf-8',
       dataType: "json",
       success: function (data) {
        console.log("detail : "+data.itemNm+data.count+data.price);
       for(var j=0; j<data.length; j++){
       var allprice = data[j].count * data[j].price;
       $('.cartlist').append('<div class="row align-items-center"><div class="col-3 col-md-2"><img src="../assets/images/products/product-img-2.jpg" alt="Ecommerce" class="img-fluid"></div>'
                          +'<div class="col-4 col-md-5">'
                          +'<a href="shop-single.html" class="text-inherit"><span>'+data[j].itemNm+'</span></a>'
                          +      '<div class="mt-2 small lh-1"> <a href="#!" class="text-decoration-none text-inherit"> <span class="me-1 align-text-bottom">'
                          +        '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 text-success">'
                          +          '<polyline points="3 6 5 6 21 6"></polyline>'
                          +          '<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">'
                          +          '</path>'
                          +          '<line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line>'
                          +        '</svg></span><span class="text-muted/'+data[j].cartItemId+'>Remove</span></a></div>'
                          +'</div>'
                          +'<div class="col-3 col-md-3 col-lg-2">'
                          +'<div class="input-group input-spinner  ">'
                          +  '<input type="button" value="-" class="button-minus  btn  btn-sm " data-field="quantity">'
                          +  '<input type="number" step="1" max="10" value="'+data[j].count+'"class="quantity-field form-control-sm form-input   ">'
                          +  '<input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">'
                          +'</div></div>'
                          +'<div class="col-2 text-lg-end text-start text-md-end col-md-2">'
                          +  '<span class="fw-bold">'+allprice+'원</span>'
                          +'</div></div>'
                          );
       }


       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   })

   $('.text-muted/'+num).on("click",function() {
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
   	           console.log(jqXHR.status + textStatus + errorThrown);
   	       }
   	  }).done(function (res) {
             alert("카트가 삭제되었습니다.");
             location.href = "/cart";
         })
         });
});
</script>
<%@ include file="fragments/footer.jsp"%>