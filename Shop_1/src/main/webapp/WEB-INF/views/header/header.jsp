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
<a href="./">����������</a>
<a href="cart.do">��ٱ���</a>
<a href="orderList.do">�ֹ�����</a>





<c:set var="user" value="${sessionScope.id }" />
<c:choose>
    <c:when test="${empty user}">
<a href="loginForm.do">�α���</a>
<a href="joinForm.do">ȸ������</a>
       &nbsp
    </c:when>
    
    <c:otherwise>
    &nbsp&nbsp&nbsp
    <a href="${pageContext.request.contextPath }/editForm.do">
����������
    </a>
    <a href="logout.do">�α׾ƿ�</a>
    &nbsp
	${sessionScope.id }�� �α�����<br>
    </c:otherwise>
</c:choose>


</div>
</body>
</html>