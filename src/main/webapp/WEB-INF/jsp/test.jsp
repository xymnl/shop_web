<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@include file="fragments/header.jsp" %>

<!--상품등록 에이작스 테스트중-->
<form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">
    <table class="edit-table">
        <tr>
            <th>상품이름</th>
            <td>
                <input type="text" id="itemName" name="itemName">
            </td>
        </tr>
        <tr>
            <th>상품가격</th>
            <td>
                <input type="number" id="price" name="price"/>
            </td>
        </tr>
        <tr>
            <th>상품수량</th>
            <td>
                <input type="number" id="stockNumber" name="stockNumber" />
            </td>
        </tr>
        <tr>
            <th>상품상세</th>
            <td>
                <input type="text" id="itemDetail" name="itemDetail" />
            </td>
        </tr>

        <tr>
            <th>상품이미지</th>
            <td>
                <input type="file" id="item_img" name="item_img" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="저장" />
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript">
  let api = "http://localhost:8090"

  $('#edit-table').submit(function(event) {
    var file = $('#file')[0].files[0];
    var formData = new FormData();
    formData.append('file', file);

    var data = {
      itemName: $('#itemName').val(),
      price: $('#price').val(),
      stockNumber: $('#stockNumber').val(),
      itemDetail: $('#itemDetail').val()

    };
    formData.append("account", new Blob([JSON.stringify(data)], {type: "application/json"}));

    $.ajax({
      url: api + "user/item/new",
      method: "post",
      data: formData,
      contentType: false,
      processData: false,
      cache: false,
      enctype: 'multipart/form-data',
      dataType: "json",
      success: function(result) {
        // 성공 시 처리
      },
      error: function (xhr, status, error) {
        // 실패 시 처리
      }
    });
  });
<%@include file="fragments/footer.jsp" %>