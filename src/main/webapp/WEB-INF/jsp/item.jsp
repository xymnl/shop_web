<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<head></head>
<body>

<table class ="itemList">
    <tbody>
        <tr>
            <th scope="row">아이디</th>
            <th scope="row">이름</th>
            <th scope="row">가격</th>
            <th scope="row">수량</th>
            <th scope="row">주문상세</th>
            <th scope="row">주문상태</th>
        </tr>
    <c:forEach items = "${list}" var="list">
        <tr>
            <td><c:out value="${list.item_id}"></c:out></td>
            <td><c:out value="${list.item_name}"></c:out></td>
            <td><c:out value="${list.price}"></c:out></td>
            <td><c:out value="${list.stock_number}"></c:out></td>
            <td><c:out value="${list.item_detail}"></c:out></td>
            <td><c:out value="${list.item_sell_status}"></c:out></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>