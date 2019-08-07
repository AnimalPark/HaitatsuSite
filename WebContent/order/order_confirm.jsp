<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta content="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#order_end").click(function() {

			order_end();

			function order_end() {
				location.href = "order_end";
				return false;
			};
		});
	});
</script>
</head>
<body>
	<c:if test="${!empty lists}">
		<p>===============최종 주문리스트============</p>
		<c:forEach var="o_list" items="${order_lists}">
			<span>메뉴 : ${o_list.mName}</span>
			<span>${o_list.count} 개</span>
			<span>->${o_list.price}원</span>
			<br />
		</c:forEach>

		
		<c:if test="${delivery_check eq 1}">
			<span>총 ${total_price+2000}원 [배달료 2000원 추가]</span>
		</c:if>
		<c:if test="${delivery_check eq 0}">
			<span>총 ${total_price}원</span>
		</c:if>
		<br />
	</c:if>
	<span>=================================</span>
	<br />
	<input type="button" value="주문 완료하기" id="order_end">


</body>
</html>