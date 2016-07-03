<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file= "/resources/header/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/seller/addPage.do"><input type="button" name="addProd" value="상품등록"></a>
<table border="1">

<c:forEach var="list" items="${p }">
<tr><td><a href="##"><img src="${list.prod_image1 }" style="width:200px; height:200px"/></a></td>
<td><a href="##">${list.prod_name }</a></td></tr>
</c:forEach>

</table>
<form action="${pageContext.request.contextPath}/seller/search.do" method="POST" name="f">
<select name="job">
    <option value="1">전체검색</option>
    <option value="2">상품명검색</option>
    <option value="3">내용검색</option>
    <option value="4">판매자검색</option>
</select>
<input type="text" name="search">
<input type="submit" name="searchh" value="검색">
</form>
</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>