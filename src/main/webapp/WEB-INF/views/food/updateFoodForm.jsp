<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ updateFoodForm ]</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">

	$(function(){
		//css
		$('body').css('background-image','url(<c:url value="/resources/images/buffet.jpg"/>)');
		$('body').css('background-repeat','no-repeat');
		$('body').css('background-attachment','fixed');
		$('body').css('background-size','cover');
		$('td').css('text-align','center');
		$('th').css('background-color','#A4A4A4');
		$('td').css('background-color','#BDBDBD');
		$('button').css('background-color','#F5A9D0');
		//event
		$('#fnameCheck').on('click',function(){
			var fname = $('#fname').val();
			
				$.ajax({
					url : "fnameCheck",
					type : "GET",
					data : {
						fname : fname
					},
					dataType : "text",
					success : function(fname){
						
						if(fname == ''){
							var str = fname;
							str += "은 사용해도 되는 이름 입니다.";
							$('#popFname').html(str);
						}
						if(fname != ''){
							var str = fname +"<br>이미 사용중 입니다.";
							$('#popFname').html(str);
							$('#fname').focus();
							$('#fname').val('');
						} 
						
					},
					error : function(err){
						alert(JSON.stringify(err));
					}
				});
		});
		
	});

function updateCancel(){
	var cancelCheck = confirm("음식물 수정을 취소하시겠습니까?");
	if (cancelCheck == true){
		location.href = "<c:url value="/food/foodList"/>"
	}
}

function foodUpdateCheck(){
	var fname = document.getElementById("fname").value;
	var price = document.getElementById("price").value;
	var cost = $('#cost').val();
	var korea = $('#ftk');
	var west = $('#ftw');
	var japan = $('#ftj');
	var china = $('#ftc');
	var snack = $('#fts');
	var drink = $('#ftd');
	
	if(fname == ''){
		alert("음식 이름을 입력해주세요");
		return false;
	}
	if(price == '' || price == 0){
		alert("음식 판매가격을 입력해주세요");
		return false;
	}
	if(isNaN(price)){
		alert("price에 숫자만 입력하세요.");
		return false;
	}
	if(cost == '' || cost == 0){
		alert("음식 재료비용을 입력해주세요");
		return false;
	}
	if(isNaN(cost)){
		alert("cost에 숫자만 입력하세요");
		return false;
	}
	
	if($(':radio[name="foodtype"]:checked').length < 1){
	    alert('음식스타일을 선택해주세요');                        
	    korea.focus();
	    event.preventDefault();
	}
	
	return true;
}
</script>
</head>
<body>
<form action="updateFood" method="POST" onsubmit="return foodUpdateCheck();" enctype="multipart/form-data">
	<table border=1>
		<tr>
			<th>음식이름</th>
			<td><input type="text" name="fname" id="fname" value="${trash.fname }">
			<input type="button" id="fnameCheck" value="음식중복체크"></td>
		</tr>
		<tr>
			<th>음식가격</th>
			<td><input type="text" name="price" id="price" value="${trash.price }"></td>
		</tr>
		<tr>
			<th>식자재비</th>
			<td><input type="text" name="cost" id="cost" value="${trash.cost }"></td>
		</tr>
		
		<tr>
			<th>음식스타일</th>
			<td>
				한식<input type="radio" name="foodtype" id="ftk" value="korea">
				양식<input type="radio" name="foodtype" id="ftw" value="western">
				일식<input type="radio" name="foodtype" id="ftj" value="japan">
				<br>
				중식<input type="radio" name="foodtype" id="ftc" value="chiness">
				분식<input type="radio" name="foodtype" id="fts" value="snack">
				음료<input type="radio" name="foodtype" id="ftd" value="drink">
			</td>
		</tr>
		<tr>
			<th>음식물사진</th>
			<td>
				<!-- 새로 첨부할 파일 선택 -->
				<input type="file" name="upload" size="30">
				<!-- 기존에 첨부한 파일이 있는 경우 출력 -->
				<br>${trash.originalfile}		
			</td>
		</tr>
	</table>
<input type="submit" value="수정하기">
<input type="button" value="수정취소" onclick="updateCancel()">
<input type="reset" value="리셋" >
<input type="hidden" name="oldfname" id="oldfname" value="${trash.fname }">
<input type="hidden" name="foodnum" id="foodnum" value="${trash.foodnum }">
<input type="hidden" name="originalfile" id="originalfile" value="${trash.originalfile}">
</form>	
<div id="popFname">
</div>
${failMessage }
</body>
</html>