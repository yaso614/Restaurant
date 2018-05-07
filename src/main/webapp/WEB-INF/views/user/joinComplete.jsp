<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
$(function(){
	$('body').css('background-image','url(<c:url value="/resources/images/welcome.jpg"/>)');
	$('body').css('background-repeat','no-repeat');
	$('body').css('background-attachment','fixed');
	$('body').css('background-size','cover');
});

</script>
<title>[셋 컴플리트]</title>
</head>
<body>
${userId }님 회원가입을 축하드립니다.
	 <h1><a href="../">로그인 하러 이동하기</a></h1>
</body>
</html>