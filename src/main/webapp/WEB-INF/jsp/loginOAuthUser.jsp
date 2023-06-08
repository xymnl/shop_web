<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
   <%-- <button onclick="oAuthLogin()">로그인</button>--%>

</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    <%
String token = request.getParameter("token").trim();
%>
    let api = '${api}';
    let token = "<%= token %>";
    $(document).ready(function(){
            let data;
            $.ajax({
                type: "GET",
                url: api+"/user/info",
                async: false,
                contentType: "application/text; charset=utf-8",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    localStorage.setItem("token", token)
                    location.href="/";
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization","Bearer " + token);
                },
            }).done(function (res) {
                var email = res.email;
                var name = res.name;

                document.getElementById("myInfo").style.display= "";
                document.getElementById("inquiry").style.display= "";
                document.getElementById("admin_addItem").style.display= "";

                if(res != null){
                    $('.mypageLink').remove();
                    $('.mypageButton').append('<a href="/" class="logout">로그아웃</a>');
                    $('#myInfo').append('<a href="/mypage" class="myinfoBtn">내 정보 </a>');
                    $('.myInfoName').append(name+'<p class="myInfoemail">'+email+'</p>');
                }

                if(email.includes('admin')){
                    $('#admin_addItem').append('<a href="/admin_addItem" class="admin_Item">상품 관리</a>');
                    $('#inquiry').append('<a href="/admin_inquiry" class="inquryBtn">문의 관리</a>');
                    $('.inquiry_box').append('<h2 class="inquiry_title">문의 내역입니다.</h2>');
                }else {
                    $('#inquiry').append('<a href="/inquiry" class="inquryBtn">문의</a>');
                    $('.inquiry_box').append('<h2 class="inquiry_title">'+name+'님의 문의 내역</h2>');
                }
            }).fail(function (err) {
                /* alert(JSON.stringify(err)); */
                alert('로그인이 필요합니다.');
            })
    });


</script>