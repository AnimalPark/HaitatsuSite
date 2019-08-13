<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
		$("#change1").click(function() {
			mode_change1();

			function mode_change1() {

				location.href = "menu_mode";
				return false;
			}
			;
		});
		$("#change2").click(function() {
			mode_change2();

			function mode_change2() {
				location.href = "comment_mode";
				return false;
			}
			;
		});
	});
</script>
<script>
	$(function() {
		$("#save").click(function() {
			commentform();

			function commentform() {
				var u = $("#userid").val();
				var c = $("textarea:eq(0)").val();
				var restaurant_number = $("#rnumber").val();

				$.get("comment_add", {
					"userid" : u,
					"rn" : restaurant_number,
					"text" : c
				}, function() {
					location.href = "comment_mode";
					return false;
				});
			}
			$(document).on("click", ".delete_btn", function() {
				$(this).parent("strong").remove();
			});
		});
	});
</script>
<meta charset="utf-8">

</head>
<body>
	<c:if test="${users == null}">
		<a href="login_link">로그인</a>
		<a href="join_link">회원가입</a>
	</c:if>
	<c:if test="${users != null}">
		<form action="user_logout">
			<a href="logout_link">로그아웃</a>
		</form>
		<a href="myPage_link">마이페이지</a>
	</c:if>
	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="ybbs_eventlist">이벤트 게시판</a>
	<br />
	<div class="container">
		<br /> <br /> <span>${detailR.rNum}</span> <span>${detailR.rName}</span>
		<span>${detailR.cNum}</span> <span>${detailR.starAvg}</span> <span>${detailR.townNum}</span>
		<span>${detailR.rAddr}</span> <span>${detailR.rPhoneNum}</span>
		<hr />

		<div
			style="width: 500px; height: 500px; float: left; margin-right: 10px;">
			<input type="button" value="메뉴" class="btn btn-secondary"
				id="change1"> <input type="button" value="댓글"
				class="btn btn-primary" id="change2">


			<div class="container mt-3">
				<h3>후기 남기기</h3>
			</div>
			<input type="hidden" name="rnumber" id="rnumber"
				value="${detailR.rNum}" /> <input type="hidden" name="userid"
				id="userid" value="${users.userId}" />
			<div class="container mt-3">
				<label for="user">작성자:</label> ${users.userId}
			</div>
			<div class="container mt-3">
				<label for="commenttext">덧글 내용:</label> <br />
				<textarea id="comment" cols="60" rows="6"></textarea>
				<input type="button" id="save" value="저장하기" />
			</div>
			<div class="container mt-3">
				<c:if test="${!empty comments_list}">
						<c:forEach var="commList" items="${comments_list}">
							<strong>${commList.userid}  ${commList.commaddr}<br />${commList.commcontents} <hr /> </strong>
						</c:forEach>
				</c:if>
			</div>
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
	</div>

</body>
</html>