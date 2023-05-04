<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


<h2 class="inquiry_title">이곳은 문의화면입니다</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover dt-responsive">
        <thead>
          <tr>
            <th>ID</th>
            <th>title</th>
            <th>name</th>
            <th>content</th> 
            <th>questionStatus</th>
            <th>user</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items = "${boardList}" var="boardList">
          <tr>
            <td><c:out value="${boardList.id}"></c:out></td>
            <td><c:out value="${boardList.title}"></c:out></td>
            <td><c:out value="${boardList.name}"></c:out></td>
            <td><c:out value="${boardList.content}"></c:out></td>
            <td><c:out value="${boardList.questionStatus}"></c:out></td>
            <td><c:out value="${boardList.user_id}"></c:out></td>
          </tr>
         </c:forEach>

        </tbody>
      </table>
      
      <div class="paging">
      	<div class="page_btn first_btn"><<</div>
      	<div class="page_btn prev_btn"><</div>
      		<div class="pages">
      			<span class="active">1</span>
      			<span>2</span>
      			<span>3</span>
      			<span>4</span>
      			<span>5</span>
      		</div>
      	<div class="page_btn last_btn">>></div>
      	<div class="page_btn next_btn">></div>
      </div>
      
    </div>
  </div>
</div>
<!-- <script>
	$('table').DataTable();
</script> -->

<%@ include file="fragments/footer.jsp" %>