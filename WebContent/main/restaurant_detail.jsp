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
		$("#order_click1").click(function() {

			order_start1();

			function order_start1() {
				delivery = 1;

				url = "confirm_orders";
				$.get(url, {
					"delichk" : delivery
				}, function() {
					location.href = "order_final";
					return false;
				});
			}
		});
		$("#order_click2").click(function() {
			order_start2();

			function order_start2() {
				delivery = 0;

				url = "confirm_orders";
				$.get(url, {
					"delichk" : delivery
				}, function() {
					location.href = "order_final";
					return false;
				});
			}
			;
		});
	});
</script>
<meta charset="utf-8">

</head>
<body>
	<a href="login_link">로그인</a>
	<a href="sign_link">회원가입</a>
	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="ybbs_eventlist">이벤트 게시판</a>

	<br />
	<br />
	<span>${detailR.rNum}</span>
	<span>${detailR.rName}</span>
	<span>${detailR.cNum}</span>
	<span>${detailR.starAvg}</span>
	<span>${detailR.townNum}</span>
	<span>${detailR.rAddr}</span>
	<span>${detailR.rPhoneNum}</span>
	<hr />
	<p>메 뉴 리 스 트</p>
	<c:if test="${!empty lists}">
		<c:forEach var="list" items="${lists}">
			<span>${list.mNum}</span>
			<span>${list.rNum}</span>
			<a href="order_confirm?mnum=${list.mNum}">${list.mName}</a>
			<span>${list.mPrice}</span>
			<span>${list.mSales}</span>
			<br />
		</c:forEach>
	</c:if>

	<c:if test="${!empty order_lists}">
		<p>=============장바구니============</p>
		<c:forEach var="o_list" items="${order_lists}">
			<span>메뉴 : ${o_list.mName}</span>
			<span>${o_list.count} 개</span>
			<span>->${o_list.price}원</span>
			<br />
		</c:forEach>
		<p>--------------------------------------------------------</p>
		<span>총 ${total_price}원</span>
		<br />
		<span>=================================</span>
		<br />
		<input type="button" value="배달(+2000)" id="order_click1">
		<input type="button" value="방문포장" id="order_click2">
	</c:if>

</body>
</html>