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
</head>

<body>
<table border="1">

<c:forEach var="list" items="${p }">
<tr>
<td>${list.prod_num }</td>
<td><a href="${pageContext.request.contextPath }/seller/sview.do"><img src="${list.prod_image1 }" style="width:100px; height:100px"/></a></td>
<td width="500px" height="20px"><a href="${pageContext.request.contextPath }/seller/sview.do">${list.prod_name }</a></td></tr>
</c:forEach>
</table>

</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>