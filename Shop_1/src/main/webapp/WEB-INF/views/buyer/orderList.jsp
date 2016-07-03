<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file= "/resources/header/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function pay(num){
	location.href="payBuy.do?buy_num="+num;
}
function delBuy(num){
	location.href="delBuy.do?buy_num="+num;
}

function payCancel(num){
	location.href="payCancel.do?buy_num="+num;
}
</script>
<style>

table {
	width: 1600px;
	border-color: #ddd;
	text-align: center;
}

table tr th {
	font-size: 15px;
	text-align: center;
	line-height: 50px;
}

#orderList_content {
	padding-left: 30px;
}
h2{font-size:25px; color:#000; padding-left:30px;}
</style>
<title>주문 내역</title>
</head>
<body>
<br>
 <h2>주문 내역</h2><br>
 <div id="orderList_content">
<table border="1" cellspacing="0">
<tr><th>주문번호</th> <th>상품번호</th> <th>구매갯수</th> <th>구입날짜</th> <th>결제/취소여부</th><th>결제금액</th><th>판매자ID</th><th>상품명</th><th></th><th></th></tr>
<c:forEach var="a" items="${list }">
<input type="hidden" name="buy_num" value="${a.buy_num }">
<tr>
<td>${a.buy_num }</td> 
<td>${a.prod_num }</td> 
<td>${a.buy_cnt}</td> 
<td>${a.buy_date }</td>
<td>
<c:if test="${a.buy_pay eq 0 }">미결제</c:if> 
<c:if test="${a.buy_pay eq 1}">결제완료</c:if>
<c:if test="${a.buy_pay eq 2}">취소대기</c:if>
<c:if test="${a.buy_pay eq 3}">취소완료</c:if>
</td>
<td> ${a.prod_price * a.buy_cnt }</td>
<td> ${a.seller_id }</td>
<td> ${a.prod_name }</td>
<td> <img src="${a.prod_image1 }" style="width:348px; height: 315px"></td>
<td>
<c:if test="${a.buy_pay eq 0 }">
<input type="button" value="결제" onclick="pay(${a.buy_num})">
<input type="button" value="주문취소" onclick="delBuy(${a.buy_num})">
</c:if> 
<c:if test="${a.buy_pay eq 1 }"><input type="button" value="결제취소" onclick="payCancel(${a.buy_num})"></c:if> 
</td>
 </tr>

</c:forEach>
</table>
</div>
</body>
</html>