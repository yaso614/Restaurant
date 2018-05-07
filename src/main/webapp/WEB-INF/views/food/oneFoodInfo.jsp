<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ oneFoodInfo ]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		
		//event
		$('#goBackFoodList').on('click',function(){
			location.href = "foodList";
		});
		
		//css
		$('body').css('background-image','url(<c:url value="/resources/images/buffet.jpg"/>)');
		$('body').css('background-repeat','no-repeat');
		$('body').css('background-attachment','fixed');
		$('body').css('background-size','cover');
		$('td').css('text-align','center');
		$('th').css('background-color','#A4A4A4');
		$('td').css('background-color','#BDBDBD');
		$('button').css('background-color','#F5A9D0');
	});
</script>
</head>
<body>
	<table border=1>
		<tr>
			<th>음식등록번호</th>
			<td>${osara.foodnum }</td>
		</tr>
		<tr>
			<th>음식이름</th>
			<td>${osara.fname }</td>
		</tr>
		<tr>
			<th>음식가격</th>
			<td>${osara.price }</td>
		</tr>
		<tr>
			<th>식자재비</th>
			<td>${osara.cost }</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>${osara.cookingdate }</td>
		</tr>
		<tr>
			<th>음식분류</th>
			<td>${osara.foodtype }</td>
		</tr>
		<tr>
			<th>음식판매량</th>
			<td>${osara.foodsales }</td>
		</tr>
		<tr>
			<th>음식사진</th>
			<td><a href="download?fname=${osara.fname}&foodnum=${osara.foodnum}"><img src="download?fname=${osara.fname}&foodnum=${osara.foodnum}" style="width: 150px; height: 150px;"></a></td>
		</tr>
		
		<%-- 	
			<tr>
				<th>savedfile</th>
				<td>${osara.savedfile }</td>
			</tr> 
		--%>	
		<tr>
			<th>삭제</th>
			<td><a href="deleteFood?fname=${osara.fname}&foodnum=${osara.foodnum}"><button>메뉴판에서 음식물 삭제하기</button></a></td>
		</tr>
		<tr>
			<th>수정</th>
			<td><a href="updateFoodForm?fname=${osara.fname}&foodnum=${osara.foodnum}"><button>메뉴판에서 음식물 수정하기</button></a></td>
		</tr>
	</table>
	<button id="goBackFoodList">메뉴판 보기</button>
</body>
</html>