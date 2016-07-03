<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">


function cart(flag_num) {
	var f = document.loop;
	var flag_num = flag_num;
		loop.action="${pageContext.request.contextPath }/addcart.do?flag_num="+flag_num;
		loop.submit();
}

function delcart(cart_num) {
	var cart_num = cart_num;
	loop.action="${pageContext.request.contextPath }/delcart.do?cart_num=" + cart_num;
	loop.submit();
	
}


</script>
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath }/cart" name="loop" 
method="post">

ID:<input type="text" name="id"><br>
PROD_NUM:<input type="text" name="prod_num"><br>
수량: <input type="text" name="cart_cnt"><br>


<input type="button" value="장바구니 담기" onclick="cart(1)">

<input type="button" value="구매하기" onclick="cart(2)">


<input type="button" value="장바구니 삭제" onclick="delcart('+${cart_num}+')">



</form>
</body>
</html>


