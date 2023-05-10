<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


<h2 class="inquiry_title"> ${boardList.name}님의 문의 내역</h2>

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
        <tbody>
        <c:forEach items = "${boardList}" var="boardList">
          <tr>
            <td><a href="inquiry_detail"><c:out value="${boardList.title}"></c:out></a></td>
            <td><c:out value="${boardList.content}"></c:out></td>
            <td><c:out value="${boardList.questionStatus}"></c:out></td>
            <td><c:out value="${boardList.name}"></c:out></td>
            <td><c:out value="${boardList.email}"></c:out></td>
          </tr>
         </c:forEach>

        </tbody>
      </table>
      
		<div class="pagenation_box">
			<ul class="pagination pagination-seperated "></ul>
		</div>
      
    </div>
  </div>
</div>

<%@ include file="fragments/footer.jsp" %>