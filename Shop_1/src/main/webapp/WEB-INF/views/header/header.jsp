<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
#top-menu {
	padding: 12px 10px 2px 20px;
	height: 2em;
	font-size: 1.1em;
}

</style>
</head>
<body>
	<div id="top-menu">
<a href="./">메인페이지</a>
<a href="cart.do">장바구니</a>
<a href="orderList.do">주문내역</a>





<c:set var="user" value="${sessionScope.id }" />
<c:choose>
    <c:when test="${empty user}">
<a href="loginForm.do">로그인</a>
<a href="joinForm.do">회원가입</a>
       &nbsp
    </c:when>
    
    <c:otherwise>
    &nbsp&nbsp&nbsp
    <a href="${pageContext.request.contextPath }/editForm.do">
내정보수정
    </a>
    <a href="logout.do">로그아웃</a>
    &nbsp
	${sessionScope.id }님 로그인중<br>
    </c:otherwise>
</c:choose>


</div>
</body>
</html>