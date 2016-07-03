<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h4{font-size:25px; color:#000;}
table{width:1200px; border-color:#ddd;text-align:center; }
table tr th{font-size:15px;text-align:center; line-height:50px;}
.sview_content{padding-left:30px;}

</style>
</head>
<title> :: 나의 판매내역 :: </title>
<body>
<div class="sview_content">
<h2> </h2>
<br><br>
<h4>미결제</h4>

<table border="1">
<tr><th>주문일자</th><th>물품 번호</th><th>물품명</th><th>주문자 ID</th><th>주문 수량</th></tr>
<c:forEach var="list" items="${b }">
   <c:choose>
       <c:when test="${list.buy_pay == 0}">
<tr>
<td>${list.buy_date }</td>
<td>${list.prod_num }</td>
<td><a href="${pageContext.request.contextPath }/view.do?num=${list.prod_num}">${list.prod_name }</a></td>
<td>${list.id }</td>
<td>${list.buy_cnt }</td>
</tr>
       </c:when>
       </c:choose>
</c:forEach>
</table>
<br><br>
<h4>결제 완료</h4>

<table border="1">
<tr><th>주문일자</th><th>물품 번호</th><th>물품명</th><th>주문자 ID</th><th>주문 수량</th></tr>
<c:forEach var="list" items="${b }">
   <c:choose>
       <c:when test="${list.buy_pay == 1}">
<tr>
<td>${list.buy_date }</td>
<td>${list.prod_num }</td>
<td><a href="${pageContext.request.contextPath }/view.do?num=${list.prod_num}">${list.prod_name }</a></td>
<td>${list.id }</td>
<td>${list.buy_cnt }</td>
</tr>
       </c:when>
       </c:choose>
</c:forEach>
</table>
<br><br>
<h4>주문 취소 요청</h4>
<table border="1">
<tr><th>주문 일자</th><th>물품 번호</th><th>물품명</th><th>주문자 ID</th><th>주문 수량</th><th>주문 취소</th></tr>
<c:forEach var="list" items="${b }">
   <c:choose>
       <c:when test="${list.buy_pay == 2}">
<tr>
<td>${list.buy_date }</td>
<td>${list.prod_num }</td>
<td><a href="${pageContext.request.contextPath }/view.do?num=${list.prod_num}">${list.prod_name }</a></td>
<td>${list.id }</td>
<td>${list.buy_cnt }</td>
<td><a href="${pageContext.request.contextPath }/seller/cancle.do?buy_num=${list.buy_num}">
<input type="button" value="취소" name="buy_num"></a></td>
</tr>
       </c:when>
       </c:choose>
</c:forEach>
</table>
<br><br>
<h4>취소 완료 목록</h4>
<table border="1">
<tr><th>주문 일자</th><th>물품 번호</th><th>물품명</th><th>주문자 ID</th><th>주문 수량</th></tr>
<c:forEach var="list" items="${b }">
   <c:choose>
       <c:when test="${list.buy_pay == 3}">
<tr>
<td>${list.buy_date }</td>
<td><a href="${pageContext.request.contextPath }/view.do?num=${list.prod_num}">${list.prod_num }</a></td>
<td>${list.prod_name }</td>
<td>${list.id }</td>
<td>${list.buy_cnt }</td>
</tr>
       </c:when>
       </c:choose>
</c:forEach>
</table>
</div>

</body>
</html>
