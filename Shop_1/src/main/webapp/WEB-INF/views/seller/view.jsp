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

${p.prod_name }  남은수량 : ${p.prod_cnt}<br>
<img src="${p.prod_image1 }" style="width:200px; height:200px"/><br>
<img src="${p.prod_image2 }" style="width:200px; height:200px"/><br>
${p.prod_content }<br>


<form action="${pageContext.request.contextPath}/seller/edit.do?prod_num=${p.prod_num}" method="POST" name="f">
<input type="submit" name="searchh" value="수정">
</form>
<a href="${pageContext.request.contextPath }/seller/delete.do?prod_num=${p.prod_num}"><input type="button" name="delprod" value="삭제"></a>


</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>