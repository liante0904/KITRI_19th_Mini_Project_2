<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file= "/resources/header/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이미지 업로드</h3>
<form action="${pageContext.request.contextPath }/add.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="PROD_NUM" value="1">
	<input type="hidden" name="PROD_NAME" value="1">
	<input type="hidden" name="PROD_CNT" value="1">
	<input type="hidden" name="PROD_CONTENT" value="1">
	<input type="hidden" name="PROD_SELLCNT" value="1">
	<input type="hidden" name="ID" value="1">
	<input type="hidden" name="PROD_PRICE" value="1">
	<input type="file" name="file2">
	<input type="file" name="file1"> 
	<input type="text" name="aa" value="1">
	<input type="submit" />
</form>
</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>