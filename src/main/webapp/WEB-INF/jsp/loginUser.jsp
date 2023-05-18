<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>

    <title>Title</title>
    <h2 class="inquiry_title">개인정보</h2>

    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <table class="table table-bordered table-hover dt-responsive">
            <thead>
              <tr>
                <th>이름</th>
                <th>이메일</th>
                <th>주소</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><span class='span_dataset1'></span></td>
                <td><span class='span_dataset2'></span></td>
                <td><span class='span_dataset3'></span></td>
              </tr>
            </tbody>
          </table>
          <div><button type="button"  onclick="location.href='/updateUser'">개인정보수정</button></div>
        </div>
      </div>
    </div>
<script>
        let api = "http://localhost:8090";
        var token = localStorage.getItem("token");

        $(document).ready(function(){

                let data;

                // Ajax를 이용한 회원 조회
                $.ajax({
                    type: "GET",
                    url: api+"/user/info",
                    async: false,
                    contentType: "application/text; charset=utf-8",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function(data) {
                            $('.span_dataset1').text(data.name);
                            $('.span_dataset2').text(data.email);
                            $('.span_dataset3').text(data.address);
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                }).fail(function (err) {
                    alert(JSON.stringify(err));
                })
        });
</script>
<%@ include file="fragments/footer.jsp" %>