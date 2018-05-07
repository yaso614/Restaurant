<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ idCheckForm ]</title>
<script type="text/javascript">

function useId(checkId){
	if(checkId == ''){
		return false
	}
	opener.document.getElementById("userid").value = checkId;
	this.close();
}

</script>
</head>
<body>

<form action="idCheck" method="POST">
	<input type="text" name="checkId" id="checkId" value="${checkId }">
	<input type="submit" value="아이디 중복 조회">
</form>



<c:if test="${firstCheck != true }">
<c:choose>
	<c:when test="${user == null}">
		<c:if test="${checkId != '' }">
		${checkId }는 사용 할수 있는 ID 입니다.		
		</c:if>
		<c:if test="${checkId == '' }">
		아이디를 입력해주세요 공백은 허용하지 않습니다.
		</c:if>
		<input type="button" value="사용하기" id="checkid" onclick="useId('${checkId}')">	
	</c:when>
	<c:otherwise>
		${checkId }는 누군가 선점한 ID 입니다.
	</c:otherwise>
</c:choose>

</c:if>




</body>
</html>