<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api"/>
<%@include file="fragments/header.jsp" %>

z

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
                <input type="text" id="itemName" name="itemName" class="form-control" required>
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
          if(nowUrl.indexOf("admin_addItem")){
       	   document.getElementById('admin_addItemBtn').classList.add("active");
          }
</script>
<%@include file="fragments/footer.jsp" %>
