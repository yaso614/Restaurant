<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
function ordercancel(){
	location.href = "foodList"
}
$(function(){
	$('body').css('background-image','url(<c:url value="/resources/images/order.jpg"/>)');
	$('body').css('background-repeat','no-repeat');
	$('body').css('background-attachment','fixed');
	$('body').css('background-size','cover');
	$('table').css('background-color','#F5A9E1');
 });	


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ User Reservation Form ]</title>
</head>
<body>	
<form action="../reservation/order" method="POST">
	<table>
		<tr>
			<th>주문요리</th>
			<td><input type="text" name="selectfood" id="selectfood" value="${order.fname }" readonly="readonly"></td>
		</tr>	
		<tr>
			<th>주문수량</th>
			<td><input type="text" name="quantity" id="quantity" value="${qy }" readonly="readonly"></td>
		</tr>	
		<tr>
			<th>총가격</th>
			<td><input type="text" name="totalprice" id="totalprice" value="${order.price * qy }" readonly="readonly"></td>
		</tr>	
	</table>
	<input type="submit" value="주문확인">
	<input type="button" value="주문취소" onclick="ordercancel()">
</form>

</body>
</html>