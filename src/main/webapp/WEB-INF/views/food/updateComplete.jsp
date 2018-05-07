<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 음식물 수정 완료 ]</title>
<script type="text/javascript"  src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
$(function(){
	$('body').css('background-image','url(<c:url value="/resources/images/restaurant.jpg"/>)');
	$('body').css('background-repeat','no-repeat');
	$('body').css('background-attachment','fixed');
	$('body').css('background-size','cover');
	$('h1').css('background-color','white');
	});
</script>
</head>
<body>
	${oldfname }에서 ${yori }으로 수정되었습니다.
	<h1><a href="foodList">음식메뉴판으로 이동하기</a></h1>
	
</body>
</html>
