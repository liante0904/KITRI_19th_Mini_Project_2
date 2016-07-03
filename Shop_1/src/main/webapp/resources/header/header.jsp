<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/component.css" />
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.navbar-inverse .navbar-nav > li > a:focus, .navbar-inverse .navbar-nav > li > a:hover {
	color: black;
}
</style>
<script type="text/javascript">
function joinPage(){
	window.open("${pageContext.request.contextPath }/joinPage.do","","width=480, height=470, resizable=no, scrollbars=no, status=no");
}
</script>
</head>
<body>
	<div class="md-modal md-effect-13" id="modal-13">
		<div class="md-content">
			<h3>KITRI MALL</h3>
			<div>
				<p>Welcome to Shop</p>
				<form action="${pageContext.request.contextPath }/login.do">
					<ul>
						<li><strong>고객 ID:</strong> <input type="text" name="id"></li>
						<li><strong>고객 PW:</strong> <input type="password" name="pw"
							style="font-color: black"></li>
					</ul>
					<div class="btn">
						<!-- <button class="md-close">Login</button> -->
						<button type="submit">로그인</button>
						<button type="button" onclick="joinPage()">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<nav class="navbar navbar-inverse" style="background-color:#fff;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<h4 style="padding-top: 6px">ShoppingMall</h4>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>">메인페이지</a></li>
				<li><a href="<%=request.getContextPath()%>/allProd.do?pageNum=1">전체상품보기</a></li>
				<c:if test="${sessionScope.type eq 1 }">
				<li><a href="<%=request.getContextPath()%>/cart.do">장바구니</a></li>
				<li><a href="<%=request.getContextPath()%>/orderList.do">주문내역</a></li>
				</c:if>
				<c:if test="${sessionScope.type eq 2 }">
					<li><a href="<%=request.getContextPath()%>/seller/addPage.do">상품등록</a></li>
					<li><a href="<%=request.getContextPath()%>/seller/mylist.do">나의 상품</a></li>
					<li><a href="<%=request.getContextPath()%>/seller/sview.do">나의 판매내역</a></li>

				</c:if>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>

				</li>
				<c:if test="${sessionScope.id eq null }">
					<li><a class="md-trigger" data-modal="modal-13"><span
							class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.id ne null }">
					<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</nav>

	<div class="md-overlay"></div>

	<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/modalEffects.js"></script>
</body>
</html>