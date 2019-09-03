<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Raleway|Open+Sans"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>Insert title here</title>
<style type="text/css">
.login-form {
	width: 340px;
	margin: 50px auto;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.btn {
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="login-form">
		<form action="/examples/actions/confirmation.php" method="post">
			<c:forEach var="list" items="${lists}">
				<c:if test="${list.mNum == mno}">
					<input type="hidden" name="order_menu" id="order_menu"
						value="${list.mNum}" />
					<h2 class="text-center">${list.mName}:${list.mPrice}원</h2>
				</c:if>
			</c:forEach>
			<div class="form-group">
				<select name="order_cnt" id="order_cnt" class="form-control">
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
				</select> <br /> <input type="button" value="장바구니 추가하기" id="menu_add_btn"
					class="btn btn-primary btn-block">
				<button onclick="history.back(); return false;"
					class="btn btn-primary btn-block">앞 페이지로 이동</button>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		$(function() {
			$("#menu_add_btn").click(function() {
				menu_add();

				function menu_add() {

					var menu_num = $("#order_menu").val();
					var menu_cnt = $("#order_cnt").val();

					var url = "ordermenu_add";
					$.get(url, {
						"num" : menu_num,
						"cnt" : menu_cnt
					}, function() {
						location.href = "return_detail";
						return false;
					});
				}
				;
			});
		});
	</script>
</body>
</html>