<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<link rel="stylesheet" href="resources/css/abc.css">	



	<title>[ Restaurant Main Page ]</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
</head>
<body>

	
<br>
<c:choose>
	<c:when test="${loginUserId == null}">
	<h1><a href="user/joinForm" style="color: white;">회원가입</a></h1>
	<h1><a href="user/loginForm" style="color: white;">로그인</a></h1>
	<h1><a style="color: blue;"href="xczcxzcz/zxczxcxzcz">에러 세계</a></h1>
	</c:when>
	<c:otherwise>
	<h1><a style="color: lime;" href="user/logout">로그아웃</a></h1>
	<h1><a style="color: aqua;"href="food/foodList">음식메뉴 리스트</a></h1>
	<h1><a style="color:orange;"href="reservation/reserveListForm">주문 리스트</a></h1>

	</c:otherwise>
</c:choose>


	<div class="wrapper">
  <div class="message">
  <c:choose>
  	<c:when test="${loginUserId == null }">
	    <h1>어서오세요 안식당에 오신걸 환영합니다.  </h1>    
	    <p>맛있는 음식을 파는 Restaurant에 어서오세요</p>
  	</c:when>
  	<c:otherwise>
	    <h1>어서오세요  ${ loginUserId }님 안식당에 오신걸 환영합니다.  </h1>    
	    <p>맛있는 음식을 파는 Restaurant에 어서오세요</p>
  	</c:otherwise>
  </c:choose>
  </div>
</div>


</body>
</html>
