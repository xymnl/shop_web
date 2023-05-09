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
    
    <script>
        var token = localStorage.getItem("token");

        $(document).ready(function(){

                let data;

                // Ajax를 이용한 회원 조회
                $.ajax({
                    type: "GET",
                    url: api+"/board/admin",
                    async: false,
                    contentType: "application/text; charset=utf-8",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function(data) {
                        /* console.log("board/admin 노출 data : "+JSON.stringify(data)) */
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Authorization","Bearer " + token);
                    },
                }).done(function (res) {
                	var result = JSON.stringify(res);
                	console.log("모든 res 값 노출 : "+result);
                	console.log("res 중 title 노출 "+result.name);
                	
                	
                	$('.board_List').remove();
                	$('.board_List').append('<c:forEach items = "'+res+'" var="boardList">'+
                	          '<tr>'+
                	            '<td><a href="inquiry_detail"><c:out value="'+res.title+'"></c:out></a></td>'
                	            +'<td><c:out value="'+res.content+'"></c:out></td>'
                	            +'<td><c:out value="'+res.questionStatus+'"></c:out></td>'
                	            +'<td><c:out value="'+res.name+'"></c:out></td>'
                	            +'<td><c:out value="'+res.email+'"></c:out></td>'
                	          +'</tr>'
                	         +'</c:forEach>');

                }).fail(function (err) {
                    alert(JSON.stringify(err));
                })
        });
    </script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover dt-responsive">
        <thead>
          <tr>
            <th>title</th>
            <th>content</th> 
            <th>questionStatus</th>
            <th>name</th>
            <th>user</th>
          </tr>
        </thead>
        <tbody class="board_list">
        
        
  			<td>타이틀</td>
  			<td>내용</td>
  			<td>상태</td>
  			<td>이름</td>
  			<td>사용자</td>
        
        
        <%-- <c:forEach items = "${boardList}" var="boardList">
          <tr>
            <td><a href="inquiry_detail"><c:out value="${boardList.title}"></c:out></a></td>
            <td><c:out value="${boardList.content}"></c:out></td>
            <td><c:out value="${boardList.questionStatus}"></c:out></td>
            <td><c:out value="${boardList.name}"></c:out></td>
            <td><c:out value="${boardList.email}"></c:out></td>
          </tr>
         </c:forEach> --%>
         

        </tbody>
      </table>
      
		<div class="pagenation_box">
			<ul class="pagination pagination-seperated "></ul>
		</div>
      
    </div>
  </div>
</div>
</body>
</html>
