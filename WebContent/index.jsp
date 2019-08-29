<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>처음화면</title>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
.table-title {
	color: #fff;
	background: #4b5366;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 30px auto;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-wrapper .btn {
	float: right;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-wrapper .btn:hover {
	color: #333;
	background: #f2f2f2;
}

.show-entries select.form-control {
	width: 60px;
	margin: 0 5px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 80px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.view {
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}

table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.form-control {
	box-shadow: none;
	border-color: #ddd;
}

.form-control:focus {
	border-color: #4aba70;
}

.login-form {
	width: 350px;
	margin: 0 auto;
	padding: 30px 0;
}

.login-form form {
	color: #434343;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h4 {
	text-align: center;
	font-size: 22px;
	margin-bottom: 20px;
}

.login-form .avatar {
	color: #fff;
	margin: 0 auto 30px;
	text-align: center;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	z-index: 9;
	background: #fcfffd;
	padding: 0px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}

.login-form .avatar i {
	font-size: 62px;
}

.login-form .form-control, .login-form .btn {
	min-height: 40px;
	border-radius: 2px;
	transition: all 0.5s;
}

.login-form .close {
	position: absolute;
	top: 15px;
	right: 15px;
}

.login-form .btn {
	background: #4aba70;
	border: none;
	line-height: normal;
}

.login-form .btn:hover, .login-form .btn:focus {
	background: #42ae68;
}

.login-form .checkbox-inline {
	float: left;
}

.login-form input[type="checkbox"] {
	margin-top: 2px;
}

.login-form .small {
	font-size: 13px;
}

.login-form a {
	color: #4aba70;
}

h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	margin: 30px 0 80px;
}

h2 b {
	color: #ffc000;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	background: rgba(0, 0, 0, 0.2);
	left: 0;
	right: 0;
	bottom: -20px;
}

.carousel {
	margin: 50px auto;
	padding: 0 30px;
}

.carousel .item {
	min-height: 330px;
	text-align: center;
	overflow: hidden;
}

.carousel .item .img-box {
	height: 180px;
	width: 100%;
	position: relative;
}

.carousel .item img {
	max-width: 100%;
	max-height: 100%;
	display: inline-block;
	position: absolute;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}

.carousel .item h4 {
	font-size: 15px;
	margin: 0 px 0;
}

.carousel .item .btn {
	color: #333;
	border-radius: 0;
	font-size: 11px;
	text-transform: uppercase;
	font-weight: bold;
	background: none;
	border: 1px solid #ccc;
	padding: 5px 10px;
	margin-top: 5px;
	line-height: 16px;
}

.carousel .item .btn:hover, .carousel .item .btn:focus {
	color: #fff;
	background: #000;
	border-color: #000;
	box-shadow: none;
}

.carousel .item .btn i {
	font-size: 14px;
	font-weight: bold;
	margin-left: 5px;
}

.carousel .thumb-wrapper {
	text-align: center;
}

.carousel .thumb-content {
	padding: 15px;
}

.carousel .carousel-control {
	height: 100px;
	width: 40px;
	background: none;
	margin: auto 0;
	background: rgba(0, 0, 0, 0.2);
}

.carousel .carousel-control i {
	font-size: 30px;
	position: absolute;
	top: 50%;
	display: inline-block;
	margin: -16px 0 0 0;
	z-index: 5;
	left: 0;
	right: 0;
	color: rgba(0, 0, 0, 0.8);
	text-shadow: none;
	font-weight: bold;
}

.carousel .item-price {
	font-size: 13px;
	padding: 2px 0;
}

.carousel .item-price strike {
	color: #999;
	margin-right: 5px;
}

.carousel .item-price span {
	color: #86bd57;
	font-size: 110%;
}

.carousel .carousel-control.left i {
	margin-left: -3px;
}

.carousel .carousel-control.left i {
	margin-right: -3px;
}

.carousel .carousel-indicators {
	bottom: -50px;
}

.carousel-indicators li, .carousel-indicators li.active {
	width: 10px;
	height: 10px;
	margin: 4px;
	border-radius: 50%;
	border-color: transparent;
}

.carousel-indicators li {
	background: rgba(0, 0, 0, 0.2);
}

.carousel-indicators li.active {
	background: rgba(0, 0, 0, 0.6);
}

.star-rating li {
	padding: 0;
}

.star-rating i {
	font-size: 14px;
	color: #ffc000;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 30px auto;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-wrapper .btn {
	float: right;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-wrapper .btn:hover {
	color: #333;
	background: #f2f2f2;
}

.table-wrapper .btn.btn-primary {
	color: #fff;
	background: #03A9F4;
}

.table-wrapper .btn.btn-primary:hover {
	background: #03a3e7;
}

.table-title .btn {
	font-size: 13px;
	border: none;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

.table-title {
	color: #fff;
	background: #4b5366;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.show-entries select.form-control {
	width: 60px;
	margin: 0 5px;
}

.table-filter .filter-group {
	float: right;
	margin-left: 15px;
}

.table-filter input, .table-filter select {
	height: 34px;
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
}

.table-filter {
	padding: 5px 0 15px;
	border-bottom: 1px solid #e9e9e9;
	margin-bottom: 5px;
}

.table-filter .btn {
	height: 34px;
}

.table-filter label {
	font-weight: normal;
	margin-left: 10px;
}

.table-filter select, .table-filter input {
	display: inline-block;
	margin-left: 5px;
}

.table-filter input {
	width: 200px;
	display: inline-block;
}

.filter-group select.form-control {
	width: 110px;
}

.filter-icon {
	float: right;
	margin-top: 7px;
}

.filter-icon i {
	font-size: 18px;
	opacity: 0.7;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 110px;
}

table.table tr th:last-child {
	width: 120px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.view {
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}

table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

.table-wrapper {
	width: 350px;
	margin: 0px auto;
	background: #fff;
	padding: 10px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 6px 0 0;
	font-size: 22px;
}

.table-title .add-new {
	float: right;
	height: 30px;
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}

table.table {
	table-layout: fixed;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table th:last-child {
	width: 100px;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 5px;
	min-width: 24px;
}

table.table td a.add {
	color: #27C46B;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}

body {
	background: #F2F2F2;
	font-family: 'Open Sans', sans-serif;
}

.form-inline {
	display: inline-block;
}

.navbar-header.col {
	padding: 0 !important;
}

.navbar {
	font-size: 12px;
	background: #fff;
	padding-left: 16px;
	padding-right: 16px;
	border-bottom: 1px solid #d6d6d6;
	box-shadow: 0 0 4px rgba(0, 0, 0, .1);
}

.navbar .navbar-brand {
	color: #555;
	padding-left: 0;
	font-size: 20px;
	padding-right: 50px;
	font-family: 'Raleway', sans-serif;
	text-transform: uppercase;
}

.navbar .navbar-brand b {
	font-weight: bold;
	color: #f04f01;
}

.navbar ul.nav li {
	font-size: 96%;
	font-weight: bold;
	text-transform: uppercase;
}

.navbar ul.nav li.active a, .navbar ul.nav li.active a:hover, .navbar ul.nav li.active a:focus
	{
	color: #f04f01 !important;
	background: transparent !important;
}

.navbar .nav-item i {
	font-size: 18px;
	navbar-form: pull-right;
}

.navbar .dropdown-item i {
	font-size: 16px;
	min-width: 22px;
}

.navbar .nav-item.open>a {
	background: none !important;
}

.navbar .dropdown-menu {
	border-radius: 1px;
	border-color: #e5e5e5;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .05);
}

.navbar .dropdown-menu li a {
	color: #777;
	padding: 8px 20px;
	line-height: normal;
	font-size: 14px;
}

.navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:active {
	color: #333;
}

.navbar .navbar-form {
	border: none;
	justify-content-end;
}

@media ( min-width : 992px) {
	.form-inline .input-group .form-control {
		width: 225px;
	}
}

@media ( max-width : 992px) {
	.form-inline {
		display: block;
	}
}

.button {
	border: none;
	padding: 20px 80px 80px 20px;
	text-decoration: none;
	font-align: right;
	display: inline-block;
	font-size: 20px;
	margin: 4px 2px;
	cursor: pointer;
	font-weight: bold;
	background-size: 140px;
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
	<nav class="navbar navbar-default navbar-expand-lg navbar-light">
		<div class="navbar-header d-flex col">
			<a class="navbar-brand" href="index.jsp">Haitatsu<b>Site</b></a>
		</div>
		<div id="navbarCollapse"
			class="collapse navbar-collapse justify-content-start">
			<ul class="nav navbar-nav">
				<c:if test="${users.authority eq 1}">
					<li class="nav-item"><a href="admin_home_link"
						class="nav-link">관리자 화면으로</a></li>
				</c:if>
				<c:if test="${users == null}">
					<li class="nav-item"><a href="login_index_link"
						class="nav-link">로그인</a></li>
					<li class="nav-item"><a href="join_link" class="nav-link">회원가입</a></li>
				</c:if>
				<li class="nav-item dropdown"><a data-toggle="dropdown"
					class="nav-link dropdown-toggle" href="#">게시판 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="ybbs_eventList?reqPage=1">이벤트 게시판</a></li>
						<li><a href="ybbs_QaList?reqPage=1">Q/A 게시판</a></li>
					</ul></li>
				<c:if test="${users != null}">
					<li class="nav-item"><a href="user_logout" class="nav-link">로그아웃</a></li>

					<li class="nav-item dropdown"><a data-toggle="dropdown"
						class="nav-link dropdown-toggle" href="myPage_link">마이페이지 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="user_orderlist">주문내역</a></li>
							<li><a href="update_link?type=1">회원정보 보기</a></li>
							<li><a href="update_link?type=2">회원정보 수정</a></li>
							<li><a href="update_link?type=3">비밀번호 변경</a></li>
						</ul></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<c:if test="${warning eq 0}">
		<script type="text/javascript">
			alert("관리자 계정으로 로그인시에만 가능한 기능입니다.");
		</script>
	</c:if>

	<br />
	<div class="container">
		<div
			style="width: 750px; height: 500px; float: left; margin-right: 5px;">
			<input type="button" class="button" value="            "
				style="background-image: url(image/event.png); background-size: 162px;"
				onclick="category0()"> <input type="button" class="button"
				value="한  식" style="background-image: url(image/category-05.png);"
				onclick="category1()"> <input type="button" class="button"
				value="중  식"
				style="background-image: url(image/category-04.png); background-position: 0px 0px;"
				onclick="category2()"> <br /> <input type="button"
				class="button" value="일    식"
				style="background-image: url(image/category-06.png); background-position: 0px 0px;"
				onclick="category3()"> <input type="button" class="button"
				value="피  자"
				style="background-image: url(image/category-03.png); background-position: 0px 0px;"
				onclick="category4()"> <input type="button" class="button"
				value="치  킨"
				style="background-image: url(image/category-02.png); background-position: 0px 0px;"
				onclick="category5()"> <br /> <input type="button"
				class="button" value="분    식"
				style="background-image: url(image/category-09.png); background-position: 0px 0px;"
				onclick="category6()"> <input type="button" class="button"
				value="족  발"
				style="background-image: url(image/category-07.png); background-position: 0px 0px;"
				onclick="category7()"> <input type="button" class="button"
				value="간  식"
				style="background-image: url(image/category-11.png); background-position: 0px 0px;"
				onclick="category8()"> <br />
		</div>
		<div
			style="width: 300px; height: 500px; float: left; margin-left: 30px;">
			<c:if test="${!empty order_lists}">
				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-8">
								<h4>${order_restaurant}
									<b> 장바구니</b>
								</h4>
							</div>
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>주문 메뉴</th>
								<th>갯 수</th>
								<th>가 격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o_list" items="${order_lists}">
								<tr>
									<td>${o_list.mName}</td>
									<td>${o_list.count}개</td>
									<td>${o_list.price}원</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-sm-8">
						<h4>
							총 <b> ${total_price}원</b>
						</h4>
					</div>
					<br /> <input type="button" value="배달(+2000)" id="order_click1"
						class="w3-bar-item w3-button w3-red" style="width: 48%"> <input
						type="button" value="방문포장" id="order_click2"
						class="w3-bar-item w3-button w3-red" style="width: 48%">
				</div>
			</c:if>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function category0() {
			location.href = "ybbs_eventList?reqPage=1";
			return false;
		}
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