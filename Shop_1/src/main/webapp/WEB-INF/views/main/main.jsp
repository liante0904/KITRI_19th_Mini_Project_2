<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/resources/header/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: 전체 상품 목록 ::</title>
<script type="text/javascript">
	function search_product() {
		var prod_name = document.f.prod_name.value

		alert(prod_name);
		f.action = "${pageContext.request.contextPath }/mainSearch.do?prod_name="
				+ prod_name;
		f.submit();
	}
	function sort_selecter(flag) {
		var obj_sel;
		var values;
		obj_sel = document.all.sort_select;
		values = obj_sel.options[obj_sel.selectedIndex].value;
	//	alert(values); //values = select 박스 선택값
		if (!(values == null)) {
			location.href = "${pageContext.request.contextPath }/sort.do?type="+ values + "&pageNum=1";
		}
	}
</script>
<style>
.row {
	width: 100%;
	margin: 0 auto;
	padding-left: 125px;
}

.row .col-sm-3 {
	margin: 0 40px;
	margin-right: 3px;
}
</style>

</head>

<body>
<div align="right">
<select name="sort_select" onchange="sort_selecter();" style="">
					<option value="" selected="selected">정렬선택</option>
					<option value="2">높은가격순</option>
					<option value="1">낮은가격순</option>
					<option value="3">신규등록순</option>
			</select>
			</div>
	<div class="container-fluid bg-3 text-center">
		<!-- <h2>전체 상품 목록</h2> -->
		<br>
		<%
			int a = 0;
			int b = 0;
		%>
		<div class='row'>
			<c:forEach items="${list }" var="l">

				<%
					if (a != 0 && a % 4 == 0) {
							out.write("<div class='row'>");
							b = 1;
						}
				%>
				<div class="col-sm-3" style="width: 348px; height: 450px;">
					<a
						href="${pageContext.request.contextPath }/view.do?num=${l.prod_num}"><img
						src="${l.prod_image1 }" class="img-responsive"
						style="width: 348px; height: 315px" alt="Image">
						<p>${l.prod_name }</p>
						<p>
							<fmt:formatNumber value="${l.prod_price}" pattern="#,###.##" />
							원
						</p></a>

				</div>

				<%
					if ((a + 1) % 4 == 0) {
							out.write("</div>");
							b = 0;
						}
				%>
				<%
					a++;
				%>
			</c:forEach>
			<%
				if (b == 1)
					out.write("</div>");
			%>
		</div>
		<%
			int pageC = 1;
		%>
		<div style="text-align: center; font-size: 20px">
			<c:forEach begin="1" end="${cntPage}">
				<a
					href="<%=request.getContextPath()%>/allProd.do?pageNum=<%=pageC%>"><%=pageC%>
					<%
						pageC++;
					%></a>&nbsp;&nbsp;</c:forEach>
		</div>
</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>