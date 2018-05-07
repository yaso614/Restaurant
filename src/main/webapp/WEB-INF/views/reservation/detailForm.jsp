<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">


	$(function(){
		$('body').css('background-image','url(<c:url value="/resources/images/this.jpg"/>)');
		$('body').css('background-repeat','no-repeat');
		$('body').css('background-attachment','fixed');
		$('body').css('background-size','cover');
		$('table').css('background-color','white');
		$('th').css('background-color','#BDBDBD');
		$('td').css('background-color','#81DAF5');
		$('div').css('background-color','#F3E2A9');
		$('div').find('a').css('background-color','#CEF6F5');
		$('.detailbutton').css('background-color','#58D3F7');
		$('.detailbutton1').css('background-color','#F7BE81');
		$('.detailid').css('background-color','#9FF781');
		$('.detailtext').css('background-color','#81F7D8');
		$('#save').css('background-color','#F7BE81');
		$('#goback').css('font-size','30px');
	});

//상세요구 사항 체크
function detailFormCheck() {
	var detail = document.getElementById('detail');
	if (detail.value.length < 5) {
		alert('요구사항을을 입력하세요.');
		detail.focus();
		detail.select();
		return false;
	}
	return true;			
}


//리플 수정
function detailEditForm(detailnum, rvnum, detail) {
	//해당 리플번호를 붙여 생성한 <div>태그에 접근
	var div = document.getElementById("div"+detailnum);
	
	var str = '<form name="editForm' + detailnum + '" action="detailEdit" method="post">';
	str += '<input type="hidden" name="detailnum" value="'+detailnum+'">';
	str += '<input type="hidden" name="rvnum" value="'+rvnum+'">';
	str += '&nbsp;';
	str += '<input type="text" id="save" name="detail" value="' + detail + '" style="width:530px;">';
	str += '&nbsp;';
	str += '<a href="javascript:detailEdit(document.editForm' + detailnum + ')">[저장]</a>';
	str += '&nbsp;';
	str += '<a href="javascript:detailEditCancle(document.getElementById(\'div' + detailnum + '\'))">[취소]</a>';
	str += '</form>';
	div.innerHTML = str;
}

//리플 수정 취소
function detailEditCancle(div) {
	div.innerHTML = '';
}

//리플 수정 정보 저장
function detailEdit(form) {
	if (confirm('수정된 내용을 저장하시겠습니까?')) {
		form.submit();
	}
}

//리플 삭제
function detailDelete(detailnum, rvnum) {
	if (confirm('리플을 삭제하시겠습니까?')) {
		location.href='detailDelete?detailnum=' + detailnum + '&rvnum=' + rvnum;
	}
}
</script>
<title>[ detailForm ]</title>
</head>
<body>
<h1><a href="reserveListForm"><button id="goback">주문 리스트</button></a></h1>
<table border="1" id="firstTable">
	<tr>	
		<th>주문번호</th>
		<td>${detailOrder.rvnum }</td>
	</tr>
	<tr>
		<th>주문자 아이디</th>
		<td>${detailOrder.subid }</td>
	</tr>
	<tr>
		<th>주문자 성명</th>
		<td>${detailOrder.subname }</td>
	</tr>
	<tr>
		<th>주문횟수</th>
		<td>${detailOrder.subloyalty }</td>
	</tr>
	<tr>
		<th>주문시간</th>
		<td>${detailOrder.aptime }</td>
	</tr>
	<tr>
		<th>주문요리</th>
		<td>${detailOrder.selectfood }</td>
	</tr>
	<tr>
		<th>주문수량</th>
		<td>${detailOrder.quantity }</td>
	</tr>
	<tr>
		<th>총주문가격</th>
		<td>${detailOrder.totalprice }</td>
	</tr>
</table>



<form id="detailForm" action="detailWrite" method="POST" onSubmit="return detailFormCheck();">
	<input type="hidden" name="rvnum" value="${detailOrder.rvnum }">
	요구사항<input type="text" name="detail" id="detail" style="width:500px;" />
	<input type="submit" value="확인" />
</form>

<!-- 리플 목록 출력 시작 -->
<table class="detail">
<c:forEach var="demon" items="${detailList}">
	<tr>
		<td class="detailid">
			<b>${demon.id}</b>
		</td>
		<td class="detailtext">
			<c:out value="${demon.detail}"/>
		</td>
		<td class="detailbutton">
			<c:if test="${loginUserId == demon.id}">
				[<a href="javascript:detailEditForm(${demon.detailnum}, ${demon.rvnum}, '${demon.detail}')">수정</a>]
			</c:if>
		</td>
		<td class="detailbutton1">
			<c:if test="${loginUserId == demon.id}">
				[<a href="javascript:detailDelete(${demon.detailnum}, ${demon.rvnum })">삭제</a>]
			</c:if>
		</td>
	</tr>	
	<tr>
		<!-- 리플 수정 폼이 나타날 위치 -->
		<td class="white" colspan="4"><div id="div${demon.detailnum}"></div></td>
	</tr>
		 
</c:forEach>
</table>
<!-- /리플 목록 출력 끝 -->



</body>
</html>