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
h2{font-size:25px; color:#000; padding-left:30px;}
table{width:1000px; border-color:#ddd;text-align:center; }
table tr th{font-size:15px;text-align:center; line-height:50px;}
.mylist_content{padding-left:30px;}
</style>
</head>
<title> :: 나의 상품 :: </title>

<body>
<br>
<h2>나의 상품 목록</h2>
<br>
<div class="mylist_content">
<table border="1">
<c:forEach var="list" items="${p }">

<tr>
<td>${list.prod_num }</td>
<td><a href="${pageContext.request.contextPath }/view.do?num=${list.prod_num}"><img src="${list.prod_image1 }" style="width:90px; height:90px"/></a></td>
<td width="700px" height="20px"><a href="${pageContext.request.contextPath }/view.do?num=${list.prod_num}">${list.prod_name }</a></td>
</tr>
</c:forEach>

</table>
<form action="${pageContext.request.contextPath}/seller/search.do" method="POST" name="f">

</form>
</div>
</body>
</html>
