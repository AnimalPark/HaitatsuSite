<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
		<c:forEach var="list" items="${lists}">
			<c:if test="${list.mNum == mno}">
				<input type="hidden" name="order_menu" id="order_menu" value="${list.mNum}" />
				<span>${list.mName}</span>
				<span>${list.mPrice}원</span>
			</c:if>
		</c:forEach>

		<select name="order_cnt" id = "order_cnt">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
		</select> <br /> 
		<input type="button" value="장바구니 추가하기" id="menu_add_btn">
		<button onclick="history.back(); return false;">앞
			페이지로 이동</button>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
		$(function() { $("#menu_add_btn").click(function() {
				menu_add();

				function menu_add() {
					var menu_num = $("#order_menu").val();
					var menu_cnt = $("#order_cnt").val();

					var url = "ordermenu_add";
					$.get(url, {"num" : menu_num , "cnt" : menu_cnt}, function(){
						location.href = "return_detail"; 
						return false;
				});
			};
		});
	});
</script>
</body>
</html>