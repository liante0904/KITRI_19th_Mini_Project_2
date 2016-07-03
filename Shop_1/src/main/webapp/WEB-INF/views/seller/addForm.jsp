<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file= "/resources/header/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>

h2{font-size:25px; color:#000; padding-left:30px;}
</style>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "prod_content",
        sSkinURI: "${pageContext.request.contextPath}/smarteditor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["prod_content"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})
</script>
<title> :: 상품등록 :: </title>


</head>
<body>
<br>
<h2>상품 등록 페이지</h2>
<div class="addForm_content" style="padding-left:30px">
<form action="${pageContext.request.contextPath}/seller/add.do" method="post" id="frm" enctype="multipart/form-data">
<input type="hidden" name="id" value="${sessionScope.id }"/>

<br><br>
상품명 : <input type="text" name="prod_name" size="53"/><br><br>
수량 : <input type="text" name="prod_cnt" />
상품가격 : <input type="text" name="prod_price" /><br>
<span style="line-height:40px">메인상품사진 등록</span><br>
<input type="file" name="file1" style="position:absolute; top:244px;left:160px;"/>
    <textarea name="prod_content" id="prod_content" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
    <br><br>
    <input type="button" id="savebutton" value="상품등록" />
</form>
</div>
</body>
</html>
 <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>