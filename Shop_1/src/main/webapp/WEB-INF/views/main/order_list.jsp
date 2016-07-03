<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <h3>구매 내역</h3>
<table border="1" cellspacing="0">
<tr><th>주문번호</th> <th>ID</th> <th>상품번호</th> <th>구매갯수</th> <th>구입날짜</th> <th>결제/취소여부</th>
<c:forEach var="a" items="${list }">
<tr>
<td>${a.buy_num }</td> <td>${a.id }</td> <td>${a.prod_num }</td> <td>${a.buy_cnt}</td> <td>${a.buy_date }</td>
 <td> ${a.buy_pay }</td>
 </tr>

</c:forEach>
</table>

</body>
</html>


