<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function (){
		$('th').css('background-color','#81BEF7');
		$('td').css('background-color','#A9F5BC');
		
		$('.detailOrder').on('click',function(){
			var rvnum = $(this).val();
			location.href = "detailOrder?rvnum="+rvnum;
		});
		
	});

	
	function pagingFormSubmit(currentPage){
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		
		page.value = currentPage;
		
		form.submit();	//버튼을 이용해서 Form을 Submit하는 방식  ★정말 많이 사용하는 방식★
		
	}	
	
</script>

<style type="text/css">
body {
	background-image: url(<c:url value="/resources/images/menu2.jpg"/>) ;
}
table {
	background: white;
}

</style>
<title>[reserveList]</title>
</head>
<body>
<H1 style="color: lime;">주문리스트</H1> <h1><a href="../">Main으로 이동</a></h1>
		<h1><a href="../food/foodList">
		
	<c:if test="${sessionScope.loginUserId != 'master' }">
		추가주문
	</c:if>
	<c:if test="${sessionScope.loginUserId == 'master' }">
		메뉴판 관리			
	</c:if>
		</a></h1>
<h2><c:out value="${ sessionScope.loginUserId }"/>님 안녕하세요</h2>
	<table border="1">
		<tr>
			<th>rvnum</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.rvnum }</td> 
</c:forEach> 
		</tr>
		<tr>
			<th>주문자ID</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.subid }</td>
</c:forEach> 
		</tr>
		<tr>
			<th>주문자명</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.subname }</td>
</c:forEach>
		</tr>
		<tr>
			<th>Loyalty</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.subloyalty }</td>
</c:forEach>
		</tr>
		<tr>
			<th>주문시간</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.aptime }</td>
</c:forEach>
		</tr>
		<tr>
			<th>주문요리</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.selectfood }</td>
</c:forEach>
		</tr>
		<tr>
			<th>주문수량</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.quantity }</td>
</c:forEach>
		</tr>
		<tr>
			<th>총주문 가격</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td>${orderLine.totalprice }</td>
</c:forEach>
		</tr>
		
	<c:if test="${sessionScope.loginUserId == 'master'  }">
		<tr>
			<th>고객님요구사항</th>
<c:forEach var="orderLine"  items="${orderList }">
			<td><button  value="${orderLine.rvnum}" class ="detailOrder">구체적주문</button></td>
</c:forEach>
		</tr>
	</c:if>
	
	
	<c:if test="${sessionScope.loginUserId != 'master'  }">
		<tr>
			<th>주문시특이사항</th>
<c:forEach var="orderLine"  items="${orderList }">
			
		<c:if test="${sessionScope.loginUserId == orderLine.subid  }">
			<td><button  value="${orderLine.rvnum}" class ="detailOrder">입력하기</button></td>
		</c:if>
		<c:if test="${sessionScope.loginUserId != orderLine.subid  }">
			<td></td>
		</c:if>
</c:forEach>
		</tr>
	</c:if>
		
		
		<tr>
	<c:choose>
		<c:when test="${sessionScope.loginUserId == 'master'  }">
			<th>주문접수</th>
		</c:when>
		<c:otherwise>
			<th>주문취소</th>
		</c:otherwise>
	</c:choose>
<c:forEach var="orderLine"  items="${orderList }">
	<c:choose>
		<c:when test="${sessionScope.loginUserId == 'master'  }">
			<td><a href="receipt?rvnum=${orderLine.rvnum }&subid=${orderLine.subid}&selectfood=${orderLine.selectfood }&quantity=${orderLine.quantity }"><button>주문접수</button></a></td>
		</c:when>
		<c:when test="${sessionScope.loginUserId == orderLine.subid}">
			<td><a href="reserveCancel?rvnum=${orderLine.rvnum }&subid=${sessionScope.loginUserId}"><button>주문취소</button></a></td>
		</c:when>
		<c:when test="${sessionScope.loginUserId != orderLine.subid}">
			<td><a></a></td>
		</c:when>
	</c:choose>	
			
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
	
<form action="reserveListForm" method="get" id="pagingForm">
	<input type="hidden" name="page" id="page">
	<select name="searchChoice">
		<option value="subid">주문자Id검색</option>
		<option value="subname">주문자명검색</option>
<c:if test="${sessionScope.loginUserId == 'master' }">
		<option value="foodsales">인기판매순위(내림차순)</option>
</c:if>
	</select>
	<input type="text" name="searchText" value="${searchText }">
	<input type="button" value="검색" onclick="pagingFormSubmit(1)"> <!--검색할때는 1페이지로 돌아오니까 -->
</form>
	
	
	
	
	

</body>
</html>