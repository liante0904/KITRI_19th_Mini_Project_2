<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/header/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

table {
	width: 1400px;
	border-color: #ddd;
	text-align: center;
}

table tr th {
	font-size: 15px;
	text-align: center;
	line-height: 50px;
}

.sview_content {
	padding-left: 30px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<script type="text/javascript">
	function addCart(){
		var cnt = document.getElementById("cnt").value;
		if(cnt=="" || cnt=="0"){
			document.getElementById("divCont").innerHTML="<p>수량을 입력하세요.</p>";	
		}else{
			document.getElementById("divCont").innerHTML="<p>장바구니에 성공적으로 담겼습니다.</p>"	;
			var id = "${sessionScope.id}";
			var prod_num = ${product.prod_num};
			var cnt = document.getElementById("cnt").value;
			var param = "id="+id+"&prod_num="+prod_num+"&cart_cnt="+cnt;
			sendRequest("${pageContext.request.contextPath}/addcart.do", 
					param, checkResult, "POST");
		}
	}
	function checkResult(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
			}
		}
	}	 
 
/*  function priceCnt(){
	 var cnt = document.getElementById("cnt").value;
	 var price = '${product.prod_price}';
	 if(isNaN(cnt) || cnt<0){
		 document.getElementById("cnt").value = "";
		 document.getElementById("totalPrice").innerHTML = "";
		 alert("숫자만 입력가능합니다.");
	 } else{
		 
	 if(cnt>${product.prod_cnt - product.prod_sellcnt}){
		 document.getElementById("cnt").value = "";
		 document.getElementById("totalPrice").innerHTML = "";
		 alert("재고수량을 초과하였습니다.");
	 } else{
	 	document.getElementById("totalPrice").innerHTML = comma(price*cnt)+"원";
	 }
	 }
	 
 } */
 

 function comma(num){
	    var len, point, str;  
	       
	    num = num + "";  
	    point = num.length % 3 ;
	    len = num.length;  
	  
	    str = num.substring(0, point);  
	    while (point < len) {  
	        if (str != "") str += ",";  
	        str += num.substring(point, point + 3);  
	        point += 3;  
	    }  
	     
	    return str;
	 
	}
 function pageCart(){
	 location.href="${pageContext.request.contextPath}/cart.do"
 }
 
function down(a){
	if(document.ff.cnt2.value > 1){
		document.ff.cnt2.value--;
		document.ff.totalprice.value = a * document.ff.cnt2.value;
	}
}
function up(a){

		document.ff.cnt2.value++;
	  document.ff.totalprice.value = a * document.ff.cnt2.value;

}

</script>
</head>
<body>
<center>
	<div class="container">
	
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">장바구니 담기</h4>
					</div>
					<div class="modal-body" id="divCont"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">계속
							쇼핑</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="pageCart()">장바구니로 이동</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	
	<table border='1px'>
		<tr>
			<td rowspan="6"><img src="${product.prod_image1}"
				style="width: 200px; height: 200px"></td>
			<td colspan="2">${product.prod_name }</td>
		</tr>
		<tr>
			<td colspan="2"><fmt:formatNumber
					value="${product.prod_cnt - product.prod_sellcnt}"
					pattern="#,###.##" />개</td>
		</tr>
		<tr>
			<td colspan="2"><fmt:formatNumber value="${product.prod_price}"
					pattern="#,###.##" />원</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="plusminus">
					<form name="ff">
					수량:	<input type="text" id="cnt" class="text" title="수량설정" value="1"
							name="cnt2" size="3">
						<button type="button" class="defbtn_minus"
							onclick="down(${product.prod_price})">수량감소</button>
						<button type="button" class="defbtn_plus"
							onclick="up(${product.prod_price})">수량증가</button>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">총 가격: <span id="totalPrice"><input
					type="text" name=totalprice
					value="<fmt:formatNumber value="${product.prod_price}" pattern="#,###.##" />"
					readonly></span>
			</td>
		</tr>
		</form>


		<tr>
			<c:choose>
				<c:when test="${product.prod_cnt > 0}">
					<td><button type="button" class="btn btn-info btn-sm"
							data-toggle="modal" data-target="#myModal" onclick="addCart()">장바구니</button>
					</td>
					<td>구매하기</td>
				</c:when>
				<c:otherwise>
					<td colspan="2" style="color: red">품절!</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="3">${product.prod_content}</td>
		</tr>



	</table>
<br><br><br>
	<div>

		<table border="1" align="center" width="70%" height="70%">
			<tr>
				<th align="center">평가</th>
				<th>내용</th>
				<th>작성자</th>
			</tr>

			<c:set var="total" value="0"></c:set>

			<c:forEach var="list" items="${c }">

				<c:choose>
					<c:when test="${list.cmt_score == 1}">
						<c:set var="a" value="★"></c:set>
					</c:when>
					<c:when test="${list.cmt_score == 2}">
						<c:set var="a" value="★★"></c:set>
					</c:when>
					<c:when test="${list.cmt_score == 3}">
						<c:set var="a" value="★★★"></c:set>
					</c:when>
					<c:when test="${list.cmt_score == 4}">
						<c:set var="a" value="★★★★"></c:set>
					</c:when>
					<c:when test="${list.cmt_score == 5}">
						<c:set var="a" value="★★★★★"></c:set>
					</c:when>
				</c:choose>
				<tr>
					<td align="center">${a}</td>
					<td>${list.cmt_comment}</td>
					<td>${list.id}</td>
				</tr>
			</c:forEach>




		</table>
	</div>
	<form action="${pageContext.request.contextPath}/writeCmt.do"
		method="POST" name="f">
		<input type="hidden" name="id" value="1"> <input type="hidden"
			name="prod_num" value="${product.prod_num }"> <br /> 한줄평<br> <select
			name="cmt_score">
			<option value="1">★</option>
			<option value="2">★★</option>
			<option value="3">★★★</option>
			<option value="4">★★★★</option>
			<option value="5">★★★★★</option>
		</select> <input type="text" name="cmt_comment" style="width: 880px;" /> <input
			type="submit" name="searchh" value="작성">
	</form>
	</center>
</body>
</html>
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>