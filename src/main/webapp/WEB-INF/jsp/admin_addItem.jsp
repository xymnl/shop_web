<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    let api = '${api}';
    let token = localStorage.getItem("token");
   /* $("#btnSubmit").click(function (event) {
    	//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
    	event.preventDefault();
        // Get form
        var file = $('#fileUploadForm')[0];
        // Create an FormData object
        var data = new FormData();
        // disabled the submit button
        $("#btnSubmit").prop("disabled", true);

        $.ajax({
        	type: "POST",
            enctype: 'multipart/form-data',
            url: api + "/user/item/new",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
            	alert("complete");
            	$("#btnSubmit").prop("disabled", false);
            },
            error: function (e) {
            	 $("#btnSubmit").prop("disabled", false);
                alert("fail");
             }
    	});
    });*/

	$(function () {
		$('#edit-table').on("click", function () {
			var itemImgFileList = $('#itemImgFileList')[0].files[0];
			var formData = new FormData();
			formData.append('itemImgFileList', itemImgFileList);

			var data = {
				itemName: $('#itemName').val(),
				price: $('#price').val(),
				stockNumber: $('#stockNumber').val(),
				itemDetail: $('#itemDetail').val()
			};
			formData.append("itemDto", new Blob([JSON.stringify(data)], {type: "application/json"}));

			$.ajax({
				url: api + "/user/item/new",
				method: "post",
				data: formData,
				contentType: false,
				processData: false,
				cache: false,
				enctype: 'multipart/form-data',
				dataType: "json",

			}).done(function (res) {
				alert("상품등록이 완료되었습니다.");
			}).fail(function (err) {
				alert("상품등록 실패.");
			});
		});
	});

</script>
<%@include file="fragments/header.jsp" %>
<body>
	<div class="m-container">
		<div class="row my-10">
			 <!-- col -->
			 <div class="offset-lg-1 col-lg-10 col-12 ">
			    <div class="mb-8 py-3">
			       <h1 class="h3">어드민 상품등록</h1>
			       <p class="lead mb-0">어드민 상품 등록하기</p>
			    </div>
			    <!-- form -->
			    <form method="post" enctype="multipart/form-data" id="data">
			       <!-- input -->
			       <div class="col-md-12 mb-3">
			          <label class="form-label">상품이름<span class="text-danger">*</span></label>
			          <input type="text" id="itemName" name="itemName" placeholder="상품이름을 입력하세요." required >
			       </div>
			       <div class="col-md-12 mb-3">
			          <label class="form-label">상품가격<span class="text-danger">*</span></label>
			          <input type="number" id="price" name="price" placeholder="상품가격을 입력하세요." required>
			       </div>
			       <div class="col-md-6 mb-3">
			          <!-- input -->
			          <label class="form-label">재고수량<span class="text-danger">*</span></label>
			          <input type="number" id="stockNumber" name="stockNumber" placeholder="재고수량을 입력하세요." required>
			       </div>
			       <div class="col-md-6 mb-3">
			          <!-- input -->
			          <label class="form-label">상품상세설명<span class="text-danger">*</span></label>
			          <input type="text" id="itemDetail" name="itemDetail" placeholder="상품을 설명해주세요." required>
			       </div>
				   <div class="col-md-6 mb-3">
					<input type="file" id="itemImgFileList" name="itemImgFileList"/>
				   </div>
					   <div class="col-md-12">
			          <!-- btn -->
			          <button type="button" class="btn btn-primary" id="edit-table">등록하기</button>
			       </div>
			    </form>
			  </div>
			</div>
		</div>
</body>
<%@include file="fragments/footer.jsp" %>
