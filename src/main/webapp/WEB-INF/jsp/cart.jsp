<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp"%>
	<h2>카트</h2>
	<table>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>총액</th>
        </tr>
        <c:forEach items="${cart}" var="item">
            <tr>
                <td>${item.product.name}</td>
                <td>${item.product.price}</td>
                <td>${item.quantity}</td>
                <td>${item.totalPrice}</td>
            </tr>
        </c:forEach>
    </table>
    <p>총액: ${totalPrice}</p>
    <p><a href="${pageContext.request.contextPath}/products">상품 목록</a></p>
    <p><a href="${pageContext.request.contextPath}/checkout">결제</a></p>
    <div>
        <h2>쿠폰</h2>
        <form action="${pageContext.request.contextPath}/cart/coupon" method="post">
            <input type="text" name="code">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>배송지</h2>
        <form action="${pageContext.request.contextPath}/cart/address" method="post">
            <input type="text" name="address">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>결제수단</h2>
        <form action="${pageContext.request.contextPath}/cart/payment" method="post">
            <select name="payment">
                <option value="CREDIT_CARD">신용카드</option>
                <option value="BANK_TRANSFER">계좌이체</option>
                <option value="CASH">현금</option>
            </select>
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>배송시 요청사항</h2>
        <form action="${pageContext.request.contextPath}/cart/request" method="post">
            <input type="text" name="request">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>배송일시</h2>
        <form action="${pageContext.request.contextPath}/cart/delivery" method="post">
            <input type="datetime-local" name="delivery">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>배송비</h2>
        <form action="${pageContext.request.contextPath}/cart/delivery-fee" method="post">
            <input type="number" name="deliveryFee">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>할인금액</h2>
        <form action="${pageContext.request.contextPath}/cart/discount" method="post">
            <input type="number" name="discount">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>최종 결제금액</h2>
        <form action="${pageContext.request.contextPath}/cart/total-price" method="post">
            <input type="number" name="totalPrice">
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>결제</h2>
        <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
            <button type="submit">결제</button>
        </form>
    </div>
    <div>
        <h2>주문 목록</h2>
        <table>
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>총액</th>
                <th>주문상태</th>
            </tr>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.product.name}</td>
                    <td>${order.product.price}</td>
                    <td>${order.quantity}</td>
                    <td>${order.totalPrice}</td>
                    <td>${order.status}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div>
        <h2>주문 상태 변경</h2>
        <form action="${pageContext.request.contextPath}/cart/order-status" method="post">
            <input type="number" name="id">
            <select name="status">
                <option value="ORDERED">주문 완료</option>
                <option value="SHIPPING">배송중</option>
                <option value="DELIVERED">배송 완료</option>
                <option value="CANCELED">주문 취소</option>
            </select>
            <button type="submit">적용</button>
        </form>
    </div>
    <div>
        <h2>주문 취소</h2>
        <form action="${pageContext.request.contextPath}/cart/order-cancel" method="post">
            <input type="number" name="id">
            <button type="submit">주문 취소</button>
        </form>
    </div>
    <div>
        <h2>주문 삭제</h2>
        <form action="${pageContext.request.contextPath}/cart/order-delete" method="post">
            <input type="number" name="id">
            <button type="submit">주문 삭제</button>
        </form>
    </div>
    // 설명 생략
    <div>
        <h2>주문 상세</h2>
        <table>
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>총액</th>
                <th>주문상태</th>
            </tr>
            <tr>
                <td>${order.id}</td>
                <td>${order.product.name}</td>
                <td>${order.product.price}</td>
                <td>${order.quantity}</td>
                <td>${order.totalPrice}</td>
                <td>${order.status}</td>
            </tr>
        </table>
    </div>
    <script>
        const cart = ${cart};
        const totalPrice = ${totalPrice};
        const orders = ${orders};
        const order = ${order};
    </script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>

<%@ include file="fragments/footer.jsp"%>