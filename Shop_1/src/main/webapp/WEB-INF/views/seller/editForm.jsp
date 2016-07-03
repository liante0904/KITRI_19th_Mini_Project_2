<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/header/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>

<title> :: 상품등록 :: </title>
</head>
<body>

<form action="${pageContext.request.contextPath}/seller/editok.do" method="POST" name="f" enctype="multipart/form-data">
<input type="hidden" name="id" value="${sessionScope.id }"/>
<input type="hidden" name="prod_num" value="${p.prod_num }">
상품명 : <input type="text" name="prod_name" value="${p.prod_name}"/> 수량 : <input type="text" name="prod_cnt" value="${p.prod_cnt}" /> 
상품가격 : <input type="text" name="prod_price" value="${p.prod_price }" /> <br>

내용 : <textarea cols="130" rows="30" name="prod_content">${p.prod_content }</textarea><br/>
이미지1 : <input type="file" name="file1" />
이미지1 : <input type="file" name="file2" /><br/>


<input type="reset" value="취소"/>
<input type="submit" value="수정완료" />
</form>

</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>