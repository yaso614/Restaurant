<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 로그인 화면 ]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
function loginCheck(){
	var tryLoginId = document.getElementById("userid").value;
	var	tryLoginPW = document.getElementById("password").value;
	
	if(tryLoginId == ''){
		alert("userid를 입력하세요");
		return false;
	}
	
	if(tryLoginPW == ''){
		alert("password를 입력하세요");
		return false;
	}
	return true;
}

$(function(){
	$('body').css('background-image','url(<c:url value="/resources/images/restaurant.jpg"/>)');
	$('body').css('background-repeat','no-repeat');
	$('body').css('background-attachment','fixed');
	$('body').css('background-size','cover');
	$('table').css('background-color','#F5A9E1');
	$('#wantJoin').on('click',function(){
		location.href = "../"
	}) ;
 });

</script>
</head>
<body>
 ${userfail }
<form action="login" method="POST" onsubmit="return loginCheck();">
<table>
	<tr>
		<td>
			Login ID : <input type="text" name="userid" id="userid">
		</td>
	</tr>
	<tr>
		<td>
			Login PW : <input type="password" name="password" id="password">
		</td>
	<tr>
		<td>
			<input type="submit" value="login">
			<input type="button" value="회원가입" id="wantJoin">
		</td>			
	</tr>
</table>
</form>

</body>
</html>