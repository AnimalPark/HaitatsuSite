<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
.button {
	background-color: #008CBA;
	border: none;
	color: white;
	padding: 60px 60px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
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

</head>
<body>
	<c:if test="${warning eq 0}">
		<script type="text/javascript">
			alert("관리자 계정으로 로그인시에만 가능한 기능입니다.");
		</script>
	</c:if>
	<c:if test="${users == null}">
		<a href=login_index_link>로그인</a>
		<a href="join_link">회원가입</a>
	</c:if>
	<c:if test="${users != null}">
		<form action="user_logout">
			<a href="logout_link">로그아웃</a>
		</form>
		<a href="myPage_link">마이페이지</a>
	</c:if>

	<a href="home_link">홈화면</a>
	<a href="ybbs_req_list?reqPage=1">Q/A 게시판</a>
	<a href="ybbs_eventList?reqPage=1">이벤트 게시판</a>
	<a href="admin_home_link">비로그인</a>
	<a href="user_orderlist"> 주문내역</a>
	<br />
	<br />
	<br />
	<br />
	<div
		style="width: 500px; height: 500px; float: left; margin-right: 10px;">
		<input type="button" class="button" value="한식" onclick="category1()">
		<input type="button" class="button" value="중식" onclick="category2()">
		<input type="button" class="button" value="일식" onclick="category3()">
		<br /> <input type="button" class="button" value="피자"
			onclick="category4()"> <input type="button" class="button"
			value="치킨" onclick="category5()"> <input type="button"
			class="button" value="분식" onclick="category6()"> <br /> <input
			type="button" class="button" value="족발" onclick="category7()">
		<input type="button" class="button" value="간식" onclick="category8()">
		<br /> <a href="test2">사진보자</a> <a href="test">사진보자</a>
	</div>
	<div style="width: 500px; height: 500px; float: left;">
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
	</div>
	<c:if test="${users.authority eq 1}">
		<a href="admin_home_link">관리자 모드로 가기</a>
	</c:if>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function category1() {
			location.href = "search_link?category=1";
			return false;
		}
		function category2() {
			location.href = "search_link?category=2";
			return false;
		}
		function category3() {
			location.href = "search_link?category=3";
			return false;
		}
		function category4() {
			location.href = "search_link?category=4";
			return false;
		}
		function category5() {
			location.href = "search_link?category=5";
			return false;
		}
		function category6() {
			location.href = "search_link?category=6";
			return false;
		}
		function category7() {
			location.href = "search_link?category=7";
			return false;
		}
		function category8() {
			location.href = "search_link?category=8";
			return false;
		}
	</script>
</body>
</html>