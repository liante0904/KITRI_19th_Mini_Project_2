<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file= "/resources/header/header.jsp" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<c:set var="x">0</c:set>
<script type="text/javascript">
function chkBox() {
	var flg = false;
	var i = 0;
	var fm = document.chk1;
	for (i; i < fm.cart_num.length; i++) {
		if (fm.cart_num[i].checked) {
			flg = true;
		}
	}
	if (!fm.cart_num.checked && !flg) {
		alert("선택하신 상품이 없습니다.");
		flg = false;
	} else{
		fm.submit();

	}
}
function delCart(){
	var flg = false;
	var i = 0;
	var fm = document.chk1;
	for (i; i < fm.cart_num.length; i++) {
		if (fm.cart_num[i].checked) {
			flg = true;
		}
	}
	if (!fm.cart_num.checked && !flg) {
		alert("선택하신 상품이 없습니다.");
		flg = false;
	} else{
		fm.action="delCart.do";
		fm.submit();
	}
}




</script>
<style>

table {
	width: 1400px;
	border-color: #ddd;
	text-align: center;
}

table tr th {
	font-size: 15px;
	text-align: center;
	line-height: 50px;
}


#cartView_content {
	padding-left: 30px;
}
h2{font-size:25px; color:#000; padding-left:30px;}
</style>
<title> :: 장바구니 ::</title>
</head>
<body>
<br>
	<h2>장바구니 목록</h2>
	<br>
	<div id="cartView_content">
	<c:if test="${flag }">
	<script type="text/javascript">
	window.onload=function(){
		var l = ${error};
		for(i=0; i<${error.size()}; i++){
			document.getElementById(l[i]).style.color = "red";
		} 
		alert("재고 수량을 초과하였습니다.");
	}
	</script>
	</c:if>
<form name="chk1" action="addBuy.do"> 
<table border="1px">
<tr>
<th>번호</th>
<th>수량</th>
<th>총 가격</th>
<th>판매자ID</th>
<th>상품명</th>
<th></th>
<th></th>
</tr>
<c:forEach items="${list }" var="l">
<tr id="${l.cart_num }">
<td>
${l.cart_num }
</td> 
<td>
${l.cart_cnt }개
</td> 
<td>
<fmt:formatNumber value="${l.prod_price * l.cart_cnt }" pattern="#,###.##"/>원
</td> 
<td>
${l.seller_id } 
</td> 
<td>
<a href="${pageContext.request.contextPath }/view.do?num=${l.prod_num}">
${l.prod_name } 
</a>
</td> 
<td>
<img src="${l.prod_image1 }" style="width: 150px; height: 150px"/> 
</td>
<td>
<input type="checkbox" name="cart_num"	value='${l.cart_num}'>
</td>
</tr>
</c:forEach>
</table>

<input type="button" onclick="chkBox()" value="구매하기"/>
<input type="button" onclick="delCart()" value="삭제"/>
</form>
</body>
</div>
</html>