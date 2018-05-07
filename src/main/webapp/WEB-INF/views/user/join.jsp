<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ join User Form ]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">

 $(function(){
	$('body').css('background-image','url(<c:url value="/resources/images/restaurant.jpg"/>)');
	$('body').css('background-repeat','no-repeat');
	$('body').css('background-attachment','fixed');
	$('body').css('background-size','cover');
	$('table').css('background-color','white');
	$('th').css('background-color','orange');
	$('td').css('background-color','#A4A4A4');
 
 });

//회원가입하기
function join(){
	
	var userid = document.getElementById("userid").value;
	var p1  = document.getElementById("password").value;
	var p2  = document.getElementById("password2").value;
	var name = document.getElementById("name").value;
	var year = document.getElementById("dob_Y").value;
	var month  = document.getElementById("dob_M").value;
	var day  = document.getElementById("dob_D").value;
	var birthday  = document.getElementById("birthday");
	var email  = document.getElementById("email");
	var email2  = document.getElementById("email2").value;
	var pnhead  = document.getElementById("pnhead").value;
	var phone  = document.getElementById("phone");
	var address = document.getElementById("address").value;
	var form = document.getElementById("joinform");
	if(userid == ''){
		alert("아이디를 입력하라");
		return false;
	}
	if(p1 == ''){
		alert("비번 입력하라");
		return false;
	}
	if(p2 == ''){
		alert("확인비번 입력하라");
		return false;
	}
	if(p1 != p2){
		alert("비번 불일치");
		return false;
	}
	if(name == ''){
		alert("이름을 입력하라");
		return false;
	}
	if(email == ''){
		alert("이메일 입력하라");
		return false;
	}
	if(address == ''){
		alert("주소를 입력하라");
		return false;
	}
	if(phone == ''){
		alert("휴대전화번호 입력하라");
		return false;
	}
	
	if(month < 10){
		month = ("0" + month);
	}
	
	if(day < 10){
		day = ("0" + day);
	}
	birthday.value = year+""+month+""+day;
	email.value = email.value +""+email2;
	phone.value = pnhead+""+phone.value;
	form.submit();
}

function idCheckOpen(){
	//ID중복체크 버튼 클릭시           window.open(호출주소,창이름,창의 사이즈 위치정보)
	window.open("idCheckForm", "newWindow","top=300,left=300,width=500,height=500");   
	/* 스프링에서는 jsp를 직접 호출할수 없다. 그럼 어떻게 해야하나? 리퀘스트매핑 으로 한단계 거쳐서 가야한다. */
	
	
	/* document
	location href
	window.opener  
	꽤 많이 쓰이는 내장 객체들 */
	
}

//회원가입 취소하기 [Main화면 으로 이동합니다.]
function canceljoin(){
	var not_join = confirm("회원가입을 취소하겠습니까?")
	if(not_join){
	location.href = "<c:url value='/'/>"; 
	}
}





</script>
</head>
<body>
	<%-- <c:out value="${'<>'}"/> 출력시 태그 사용 방지 --%>

<form action="join" method="post" id="joinform">
<table border="1">
	<tr>
		<th>
			아이디 
		</th>
		<td>
			<input type="text" name="userid" id="userid" readonly="readonly" value="${apple.userid }">
			<input type="button" value="ID중복 체크" onclick="idCheckOpen()">
		</td>
	</tr>
	
	<tr>
		<th>비밀번호 </th><td><input type="password" name="password" id="password"></td>
	</tr>
	
	<tr>
		<th>비밀번호 확인</th><td><input type="password" name="password2" id="password2"></td>
	</tr>
		
	<tr>
		<th>
			이름 
		</th>
		<td>
			<input type="text" name="name" id="name" value="${apple.name }">
		</td>
	</tr>
		
	
	<tr>
		<th>
			이메일 
		</th>
		<td>
			<input type="text" name="email" id="email" value="${apple.email }">@
			<select name="email2" id="email2">
				<option value="" selected="selected">직접입력</option>
				<option value="@naver.com">naver.com</option>
				<option value="@daum.net">daum.net</option>
			</select>
		</td>
	</tr>
	
		
	<tr>
		<th>
			성별  
		</th>
		<td>
			
			남성<input type="radio" name="sex" id="sex" value="man" <c:if test="${apple.sex == 'man' }"> checked </c:if>>
			여성<input type="radio" name="sex" id="sex2" value="woman"<c:if test="${apple.sex == 'woman' }"> checked </c:if>>
		</td>
	</tr>
		
	<tr>
		<th>생일</th>
		
		<td>
		<input type="hidden" id="birthday" name="birthday">
		<select id="dob_Y">
				<option value="1900" selected="selected">1900년</option>
<c:forEach var="y" begin="1901" end="2017" step="1">
				<option value="${y}" >${y}년</option>
</c:forEach>
		</select>
		
		
		<select id="dob_M">
		
				<option value="1" selected="selected">1월</option>
<c:forEach var="a" begin="02" end="12" step="1">
				<option value="${a}" >${a}월</option>
				
</c:forEach>
		</select>

		<select id="dob_D">
				<option value="1" selected="selected">1일</option>
<c:forEach var="b" begin="02" end="31" step="1">
				<option value="${b}" >${b}일</option>
</c:forEach>
		</select>
		</td>
	</tr>
		
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" id="address" value="${apple.address }"></td>
	</tr>
		
	<tr>
		<th>휴대전화번호 </th>
		<td>
		<select name="pnhead" id="pnhead">
			<option value="" selected="selected">직접입력</option>
			<option value="010-">010</option>
			<option value="011-">011</option>
			<option value="016-">016</option>
			<option value="017-">017</option>
			<option value="019-">019</option>
		</select> - <input type="text" name="phone" id="phone" value="${apple.phone }"></td>
	</tr>
		
</table>

<input type="button" value="join" onclick="join()">
<input type="button" value="cancel" onclick="canceljoin()">
<input type="reset" value="reset" >
</form>
</body>
</html>