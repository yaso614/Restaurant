<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/error.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript" >
	$(function(){
		//css
		$('body').css('background-image','url(<c:url value="/resources/images/error.gif	"/>)');
		$('body').css('background-repeat','no-repeat');
		$('body').css('background-attachment','fixed');
		$('body').css('background-size','cover');
		$('#GGG').css('height','100px');
		//event
		$('#GGG').on('click',function(){
			location.href = "/www"
		});
	});
</script>
<title>[ Error Page ]</title>
</head>
<body>
<center><h1> error 라서 스미마셍</h1></center>
<center><button id="GGG">return to main</button></center>
</body>
</html>