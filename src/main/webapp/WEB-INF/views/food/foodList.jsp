	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ foodList ]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$('.dragon').css('height','100px'); //음식리스트 버튼
		$('.dragon').css('width','100%'); //음식리스트 버튼
		$('.dragon').css('font-size','30px'); //음식리스트 버튼
		$('.dragon').css('background-color','#FF8000'); //음식리스트 버튼
		
		$('.orderButton').css('height','80px'); //음식리스트 버튼
		$('.orderButton').css('width','100%'); //음식리스트 버튼
		$('.orderButton').css('fond-size','30px'); //음식리스트 버튼
		$('.orderButton').css('background-image','url(<c:url value="/resources/images/buy.png"/>)'); //음식리스트 버튼
		$('.orderButton').css('background-size','cover');
		
		$('#totalsales').css('background-color','#F7BE81'); //음식리스트 버튼
		$('#Rlist').css('background-color','#82FA58'); //음식리스트 버튼
		$('#insertFF').css('background-color','#819FF7'); //음식등록 버튼
		$('tr').css('background-color','#D8D8D8');
		$('td').css('text-align','center');
		$('td').css('font-size','30px');
	<c:if test="${sessionScope.loginUserId != 'master' }">
	</c:if>
		$('#foodPicture').find('td').css('background-size','100%');
		$('#abc').find('td').css('background-size','cover');
		$('#abc').find('td').css('height','100px');
		$('#abc').prev().prev().find('td').css('background-color','##F2F5A9'); 
		//음식 스타일 분류
		$('td[data-sbs=snack]').css('background-image','url(<c:url value="/resources/images/snack.jpg"/>)');
		$('td[data-sbs=chiness]').css('background-image','url(<c:url value="/resources/images/china.png"/>)');
		$('td[data-sbs=korea]').css('background-image','url(<c:url value="/resources/images/korea.png"/>)');
		$('td[data-sbs=western]').css('background-image','url(<c:url value="/resources/images/usa.png"/>)');
		$('td[data-sbs=japan]').css('background-image','url(<c:url value="/resources/images/japan.png"/>)');
		$('td[data-sbs=drink]').css('background-image','url(<c:url value="/resources/images/drink.jpg"/>)');
		
	});	
function foodRegistForm(){
	location.href="registForm";
}
function gogomain(){
	location.href="iDontWantRegist"
}

function pagingFormSubmit(currentPage){
	var form = document.getElementById("pagingForm");
	var page = document.getElementById("page");
	
	page.value = currentPage;
	
	form.submit();	//버튼을 이용해서 Form을 Submit하는 방식  ★정말 많이 사용하는 방식★
	
}	

function orderForm(fname,foodnum){
	
	var ordersign = confirm(fname+"을 선택하셨습니까?");
	if(ordersign){
		var qy = prompt("몇개 사실 겁니까?");
		
		while(qy == '' || isNaN(qy)){
			var qy = prompt("주문수량을 재입력해주세요");
		}
	if(qy == null){
		alert('주문을 취소하셨습니다.');
		return false;
	}
		location.href = "reservationForm?qy="+qy+"&fname="+fname+"&foodnum="+foodnum;
	}

}

function foodsort(foodtype){
	var searchChoice = "foodtype";
	location.href ="foodList?searchText="+foodtype+"&searchChoice="+searchChoice;
}

function clearButton(){
	var okCheck = confirm("현재 판매량과 매출액을 초기화 하시겠습니까?");
	if(okCheck){
	location.href ="clearSales?";
	}
	return false;
}

	</script>
<style type="text/css">
	body {
	background-image: url(<c:url value="/resources/images/menu.jpg"/>) ;
}
a {
	color:  white;
	font-size: 50px;
}

	h1 {
	color: white;
	
}

</style>
</head>
<body>
<c:if test="${sessionScope.loginUserId eq 'master' }">
	<button id="insertFF"><a href="insertFoodForm">음식메뉴 추가하기</a></button>&nbsp &nbsp &nbsp &nbsp &nbsp <button id="Rlist"><a href="../reservation/reserveListForm">주문 리스트 확인하기</a></button>
</c:if>
	<h1><a href="../">Main Menu로 이동</a></h1> 
	<table border=1>
		<tr id ="foodPicture">	
			<th>음식사진</th>
<c:forEach var="dish" items="${flist }">
	<c:choose>
		<c:when test="${sessionScope.loginUserId eq 'master' }">
			<td><a href="foodInfoForm?fname=${dish.fname }&foodnum=${dish.foodnum}"><img src="download?fname=${dish.fname}&foodnum=${dish.foodnum}" style="width: 150px; height: 150px;"></a></td>
		</c:when>
		<c:otherwise>
			<td><a href="download?fname=${dish.fname}&foodnum=${dish.foodnum}"><img src="download?fname=${dish.fname}&foodnum=${dish.foodnum}" style="width: 150px; height: 150px;"></a></td>
		</c:otherwise>
	</c:choose>
</c:forEach>	
		</tr>
		<tr>
			<th>음식이름</th>
<c:forEach var="dish" items="${flist }">
	<c:choose>
		<c:when test="${sessionScope.loginUserId eq 'master' }">
			<td><a href="foodInfoForm?fname=${dish.fname }&foodnum=${dish.foodnum}"><button class="dragon">${dish.fname }</button></a></td>
		</c:when>
		<c:otherwise>
			<td>${dish.fname }</td>
		</c:otherwise>
	</c:choose>
</c:forEach>	
		</tr>
		<tr>
			<th>음식가격</th>
<c:forEach var="dish" items="${flist }">
			<td>${dish.price }</td>
</c:forEach>	
		</tr>
		<tr>
<c:if test="${sessionScope.loginUserId eq 'master' }">
				<th>판매량</th>
	<c:forEach var="dish" items="${flist }">
				<td>${dish.foodsales }</td>
	</c:forEach>
</c:if>	
		</tr>
		<tr>
<c:if test="${sessionScope.loginUserId != 'master' }">
				<th id="orderSize">주문</th>
	<c:forEach var="dish" items="${flist }">
				<td><a><button class="orderButton" onclick="orderForm('${dish.fname}','${dish.foodnum }')">주문</button></a></td>
	</c:forEach>
</c:if>	
		</tr>
		<tr id="abc">
			<th>음식분류</th>
<c:forEach var="dish" items="${flist }">
			<td onclick="foodsort('${dish.foodtype}')" data-sbs="${dish.foodtype }"></td>
</c:forEach>
		</tr>
	</table>

<div>
	<a href="javascript:pagingFormSubmit(${navi.currentPage-navi.pagePerGroup })">◁◁</a>
	<a href="javascript:pagingFormSubmit(${navi.currentPage-1 })">◀</a>
	<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
		<c:choose>
			<c:when test="${counter == navi.currentPage }">
				<a href="javascript:pagingFormSubmit(${counter })"><b>${counter}</b></a>
			</c:when>
			<c:otherwise>
				<a href="javascript:pagingFormSubmit(${counter })">${counter}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<a href="javascript:pagingFormSubmit(${navi.currentPage+1 })">▶</a>	
	<a href="javascript:pagingFormSubmit(${navi.currentPage+navi.pagePerGroup })">▷▷</a>
</div>
	

<form action="foodList" method="get" id="pagingForm">
	<input type="hidden" name="page" id="page">
	<select name="searchChoice">
		<option value="fname">음식이름</option>
		<option value="price">음식가격(검색가 이하정렬)</option>
		<option value="foodtype">음식스타일 검색</option>
<c:if test="${sessionScope.loginUserId == 'master' }">
		<option value="foodsales">인기판매순위(내림차순)</option>
</c:if>
	</select>
	<input type="text" name="searchText" value="${searchText }">
	<input type="button" value="검색" onclick="pagingFormSubmit(1)"> <!--검색할때는 1페이지로 돌아오니까 -->
</form>

<c:set var="temp"></c:set>
<c:set var="tank"></c:set>

<c:forEach var="money" items="${soso }">
<c:set var="temp" value="${temp + (money.price - money.cost)*money.foodsales }"></c:set>	 
<c:set var="tank" value="${tank + (money.price*money.foodsales) }"></c:set>	 
</c:forEach>

<c:if test="${sessionScope.loginUserId == 'master' }">
<button><c:out value="매출 순이익 : ${temp }"></c:out></button>
<button><c:out value="매출 총이익 : ${tank }"></c:out></button>
<br><button onclick="clearButton()">매출초기화</button>
</c:if>
	
</body>
</html>