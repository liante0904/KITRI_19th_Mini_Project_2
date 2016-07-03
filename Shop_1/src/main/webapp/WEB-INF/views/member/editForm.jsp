<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>

</head>
<body>
	<h3>정보수정</h3>


	<form action="${pageContext.request.contextPath }/edit_submit.do"	method="POST" name="f">
		<input type="hidden" name="TYPE" value="1"> id : <input
			type="text" name="id" value="${m.id}" readonly> <span
			id="checkMsg"></span><br> <br> pwd : <input type="password"
			name="pwd" value="${m.pwd}"><br> <br> name :<input
			type="text" name="name" size="7" value="${m.name}"><br>
		<br> email : <input type="text" name="email" value="${m.email}"><br>
		<br> tel : <input type="text" name="tel" size="15" value="${m.tel}"><br>
		address : <input type="text" name="address" size="50"
			value="${m.address}" /><br> 
					
			<br> <input type="button"
			value="취소" onclick="javascript:history.back()"> <input
			type="submit" value="수정완료" />
	</form>

</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>