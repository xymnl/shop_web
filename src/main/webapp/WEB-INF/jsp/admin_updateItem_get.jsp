<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api"/>
<%@include file="fragments/header.jsp" %>

<script>
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
        $('#item-save').on("click", function () {
            //var itemImgFileList = $('#itemImgFileList')[0].files[0];

            var formData = new FormData();
            // input class 값
            var fileInput = $('.files');
            // fileInput 개수를 구한다.
            for (var i = 0; i < fileInput.length; i++) {
                if (fileInput[i].files.length > 0) {
                    for (var j = 0; j < fileInput[i].files.length; j++) {
                        console.log(" fileInput[i].files[j] :::" + fileInput[i].files[j]);

                        // formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.
                        formData.append('itemImgFileList', $('.files')[i].files[j]);
                    }
                }
            }


            // 'key'라는 이름으로 위에서 담은 data를 formData에 append한다. type은 json
            //formData.append('key', new Blob([ JSON.stringify(data) ], {type : "application/json"}));


            /*
            formData.append('itemImgFileList', itemImgFileList);*/

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
                location.href="/admin_addItem"
            }).fail(function (err) {
                alert("상품등록 실패.");
            });
        });
    });

$(document).ready(function(){
   $.ajax({
       url: api + "/user/item/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       dataType: "json",
       success: function (data) {
        console.log("detail : "+JSON.stringify(data));
       $('#itemName').val(data.itemName);
       $('#price').val(data.price);
       $('#stockNumber').val(data.stockNumber);
       $('#itemDetail').val(data.itemDetail);
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           alert("문의 내용을 불러오지 못하였습니다.");
       }
   })
   });
</script>

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

    <div class="row my-10">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">

            <div class="col-md-12 mb-3">
                <label class="form-label" for="itemName">상품판매 상태</label>
                <select id="itemSellStatus" class="form-control">
                    <option value="SELL">판매중</option>
                    <option value="SOLD_OUT">품절</option>
                </select>
            </div>
            <!-- 상품 이름-->
            <div class="col-md-12 mb-3">
                <label class="form-label" for="itemName">상품 이름<span class="text-danger">*</span></label>
                <input type="text" value="" id="itemName" name="itemName" class="form-control" />
            </div>
            <!-- 상품 가격-->
            <div class="col-md-12 mb-3">
                <label class="form-label" for="price">상품 가격<span class="text-danger">*</span></label>
                <input type="number" id="price" name="price" class="form-control" required>
            </div>
            <!-- 상품 수량 -->
            <div class="col-md-12 mb-3">
                <label class="form-label" for="stockNumber">상품 수량<span class="text-danger">*</span></label>
                <input type="number" id="stockNumber" name="stockNumber" class="form-control" required>
            </div>
            <!-- 상품 상세-->
            <div class="col-md-12 mb-3">
                <label class="form-label" for="itemDetail">상품 상세<span class="text-danger">*</span></label>
                <input type="text" id="itemDetail" name="itemDetail" class="form-control" required>
            </div>
            <!-- 상품 이미지 -->
            <div class="col-md-12 mb-3">

                <%--<label class="form-label" for="itemImgFileList">상품 이미지<span class="text-danger">*</span></label>
                <input type="file" id="itemImgFileList" name="itemImgFileList" class="form-control" required>--%>

				<input type="file" id="file1" class="files" name="itemImgFileList"/><br>

                <input type="file" id="file2" class="files" name="itemImgFileList"/><br>

                <input type="file" id="file3" class="files" name="itemImgFileList"/><br>

				<input type="file" id="file4" class="files" name="itemImgFileList"/><br>

				<input type="file" id="file5" class="files" name="itemImgFileList"/><br>
            </div>
            <div class="col-md-12">
                <!-- btn -->
                <button type="button" class="btn btn-primary" id="item-save">등록하기</button>
            </div>
        </form>
    </div>
</div>
</body>
<script>
          let nowUrl = window.location.href;
          if(nowUrl.indexOf("admin_updateItem")){
       	   document.getElementById('admin_updateItemBtn').classList.add("active");
          }
</script>
<%@include file="fragments/footer.jsp" %>
