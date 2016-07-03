<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file= "/resources/header/header.jsp" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="/WEB-INF/jsp/includes/src.jsp"%>
<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>

<!DOCTYPE html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/swiper.min.css">
  <title>메인 페이지</title>
   <style>
html, body {
        position: relative;
        height: 100%;
    }
    body {
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    }

    .swiper-container {
        width: 100%;
        height: 100%;
        margin-left: auto;
        margin-right: auto;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
    .jumbotron{background-color:#asd; }
  
    </style>


</head>
<body>

<br>
<br>
<br>
<div class="jumbotron">
  <div class="container text-center">     
       <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper" >
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/1.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/2.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/3.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/4.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/5.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/6.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/7.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/8.jpg"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/9.jpg"></div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
  <h3></h3><br>
  <div class="row">
  <c:forEach items="${list }" var="l" begin="0" end="3">
    <div class="col-sm-3">
      <a href=${pageContext.request.contextPath }/view.do?num=${l.prod_num}><img src="${l.prod_image1 }" class="img-responsive" style="width:348x; height: 315px" alt="Image">
      <p>${l.prod_name }</p>
      <p><fmt:formatNumber value="${l.prod_price}" pattern="#,###.##"/>원</p></a>
      
    </div>
  </c:forEach>
  </div>
</div><br>
 
<div class="container-fluid bg-3 text-center">    
  <div class="row">
   <c:forEach items="${list }" var="l" begin="4" end="7">
    <div class="col-sm-3">
      <a href=${pageContext.request.contextPath }/view.do?num=${l.prod_num}><img src="${l.prod_image1 }" class="img-responsive" style="width:348px; height: 315px" alt="Image">
      <p>${l.prod_name }</p>
      <p><fmt:formatNumber value="${l.prod_price}" pattern="#,###.##"/>원</p></a>
      
    </div>
  </c:forEach>
  </div>
</div><br><br>
<footer class="container-fluid text-center">
  <p> </p>
 
</footer>
    <!-- Swiper JS -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
     <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 30,
        loop: true
    });
    </script>
  
</body>
</html>
  <%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>