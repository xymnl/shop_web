<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp" %>


<div class="inquiry_box"></div>

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
          </tr>
        </thead>
        <tbody>
        	<c:set var="boardList" value="${boardList}" />
        	<c:choose>
        	<c:when test="${not empty boardList}">
        		<c:forEach items = "${boardList}" var="boardList">
        			<tr>
                      <td><a href="inquiry_detail?idx=${boardList.id}"><c:out value="${boardList.title}"></c:out></a></td>	
			          <td><c:out value="${boardList.content}"></c:out></td>
			          <td><c:out value="${boardList.questionStatus}"></c:out></td>
			          <td><c:out value="${boardList.name}"></c:out></td>
			        </tr>
        		</c:forEach>
        	</c:when>
        	<c:when test="${empty boardList }">
        		<tr>
        			<td>문의 내역이 없습니다.</td>
        			<td>문의 내역이 없습니다.</td>
        			<td>문의 내역이 없습니다.</td>
        			<td>문의 내역이 없습니다.</td>
        		</tr>
        	</c:when>
        	</c:choose>
        </tbody>
      </table>
      <div class="inquiry_create">
      	<a href="create">문의 작성</a>
   	  </div>
      
		<div class="pagenation_box">
			<ul class="pagination pagination-seperated "></ul>
		</div>
      
    </div>
  </div>
</div>

<%@ include file="fragments/footer.jsp" %>