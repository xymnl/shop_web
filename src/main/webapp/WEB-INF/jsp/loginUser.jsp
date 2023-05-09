<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                        console.log(data)

                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                    var email = res.email;
                    var name = res.name;


                    $(".email").html(email);
                    $(".name").html(name);
                }).fail(function (err) {
                    alert(JSON.stringify(err));
                })
        });
    </script>
</head>
<body>
<div class="list-inline">
    <%--<div class="login_email"><span>${res}</span></div>--%>
        이메일 : <span class="email"> ${email}</span>
        이름 : <span class="name">${name}</span>
</div>
</body>
</html>
