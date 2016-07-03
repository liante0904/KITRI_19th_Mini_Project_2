<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
 src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<script type="text/javascript">
 /* 아이디 체크 */
 function idCheck() {
  var param = "id=" + document.f.id.value;
  if (document.f.id.value == "") {
   alert("ID를 입력하세요.");
   document.getElementById("checkMsg").innerHTML = "";
   return;
  } else {
   sendRequest("${pageContext.request.contextPath}/idCheck.do", param,
     checkResult, "POST");
  }
 }
 function checkResult() {
  if (httpRequest.readyState == 4) {
   if (httpRequest.status == 200) {
    var str = httpRequest.responseText;
    var o = eval("(" + str + ")");
    var myDiv = document.getElementById("checkMsg");
    var msg = "";
    if (o.flag) {
     msg = "사용가능한 아이디";
    } else {
     msg = "사용불가능한 아이디";
    }
    myDiv.innerHTML = msg;
   }
  }
 }
 /* 휴대폰 번호 입력 체크 */
 /*  function onlyNumber() {
  if ((event.keyCode < 48) || (event.keyCode > 57))
  event.returnValue = false;
  }
  function CheckForm() {
  if (document.getElementById("telMobile1").value == "") {
  window.alert("휴대폰 번호를 선택하시오.");
  return false;
  }
  if (document.getElementById("telMobile2").value.length != 4) {
  window.alert("가운데 번호는 4자리로 입력하세요");
  }
  }
  function goMypage() {
  var param = "id=" + document.f.id.value;
  var param2 = "pwd=" + document.f.pwd.value;
  String id=(String)session.getAttribute("id");
  String log_jsp="";
  if(id==null){
  log_jsp="login.jsp";
  }
  else{
  log_jsp="logout.jsp";
  }
  } */
 function check() {
  if (document.f.ID.value == "") {
   alert("ID를 입력하세요");
  } else if (document.f.PWD.value == "") {
   alert("패스워드를 입력하세요");
  } else if (document.f.NAME.value == "") {
   alert("이름을 입력하세요");
  } else if (document.f.EMAIL.value == "") {
   alert("이메일을 입력하세요");
  } else if (document.f.TEL.value == "") {
   alert("전화번호를 입력하세요");
  } else if (document.f.ADDRESS.value == "") {
   alert("주소를 입력하세요");
  } else {
   document.f.submit();
  }
 }
</script>
<style>
 h3{
  margin-bottom:30px;
  padding-left:30px;
  font-weight:bold;
  font-weight:black;
 }
 #join_contents{
  padding-left:30px;
  font-color:black;
  font-size:13px;
  
 }
INPUT{MARGIN: 0px 3px 1px 0px;  HEIGHT: 25px;}
.loginbtn{border:1px solid red;}
</style>
</head>
<body>
 <h3>회원가입</h3>
 
 <form action="${pageContext.request.contextPath }/join_submit.do"
  method="POST" name="f" id="join_contents">
  <span>아이디</span>: <span>&nbsp;&nbsp; : &nbsp; </span><input type="text" name="id" size="7"> <input type="button"
   value="중복체크" style="height:31px" onclick="idCheck()"> <span id="checkMsg"></span><br><br>
   <span>패스워드 </span><span>&nbsp; : &nbsp; </span><input type="password" name="pwd" size="12"><br> <br>
  <span>이<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>름</span><span>&nbsp; : &nbsp; </span><input type="text" name="name" size="7"><br> <br>
  <span>E - MAIL</span><span>&nbsp; &nbsp;: &nbsp;</span><input type="text" name="email"><br><br>
  <span> 휴대전화</span><span>&nbsp; : &nbsp; </span> <input type="text" name="tel" size="11" /><br><br>
  <span>주<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>소</span><span>&nbsp; : &nbsp; </span><input type="text" name="address" size="35" /><br><br>
  <span>회원종류</span> : &nbsp;<input type="radio" name="type" value="1" style="MARGIN: 0px 5px 1px 0px; WIDTH: 13px; HEIGHT: 13px" type=radio>
  구매자 <span>&nbsp;</span><input type="radio" name="type" value="2" checked="checked" style="MARGIN: 0px 3px 1px 3px; WIDTH: 13px; HEIGHT: 13px" type=radio><span>&nbsp;</span>판매자 <br><br><br>
  <center>
  <div class="loginbtn">
   <input type="button" value="취소" onclick="javascript:window.close()" style="align:center">
   <input type="submit" value="가입" name="gopage" onclick="check(); return false;" />
  </div>
  </center>
 </form>
</body>
</html> 