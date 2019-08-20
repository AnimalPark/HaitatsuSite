<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
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

<style type="text/css">
body {
	font-family: "Open Sans", sans-serif;
}

h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	position: relative;
	margin: 30px 0 60px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	border-radius: 1px;
	background: #E34724;
	left: 0;
	right: 0;
	bottom: -20px;
}

.carousel {
	margin: 0 auto;
	padding: 0 70px;
}

.carousel .item {
	color: #999;
	overflow: hidden;
	min-height: 120px;
	font-size: 13px;
}

.carousel .media {
	position: relative;
	padding: 0 0 0 20px;
}

.carousel .media img {
	width: 75px;
	height: 75px;
	display: block;
	border-radius: 50%;
}

.carousel .testimonial-wrapper {
	padding: 0 10px;
}

.carousel .testimonial {
	color: #808080;
	position: relative;
	padding: 15px;
	background: #f1f1f1;
	border: 1px solid #efefef;
	border-radius: 3px;
	margin-bottom: 15px;
}

.carousel .testimonial::after {
	content: "";
	width: 15px;
	height: 15px;
	display: block;
	background: #f1f1f1;
	border: 1px solid #efefef;
	border-width: 0 0 1px 1px;
	position: absolute;
	bottom: -8px;
	left: 46px;
	transform: rotateZ(-46deg);
}

.carousel .star-rating li {
	padding: 0 2px;
}

.carousel .star-rating i {
	font-size: 16px;
	color: #ffdc12;
}

.carousel .overview {
	padding: 3px 0 0 15px;
}

.carousel .overview .details {
	padding: 5px 0 8px;
}

.carousel .overview b {
	text-transform: uppercase;
	color: #E34724;
}

.carousel .carousel-indicators {
	bottom: -70px;
}

.carousel-indicators li, .carousel-indicators li.active {
	width: 18px;
	height: 18px;
	border-radius: 50%;
	margin: 1px 2px;
}

.carousel-indicators li {
	background: #e2e2e2;
	border: 4px solid #fff;
}

.carousel-indicators li.active {
	color: #fff;
	background: #1abc9c;
	border: 5px double;
}
</style>

<style type="text/css">
body {
	color: #404E67;
	background: #F5F7FA;
	font-family: 'Open Sans', sans-serif;
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
</style>

<style type="text/css">
body {
	background: #FFFFFF;
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

<script type="text/javascript"
	src="https://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
<script type="text/x-jquery-tmpl" id="itemTemplate">
<div id="myCarousel" class="carousel slide" data-ride="carousel" data_num = "{{= commnum}}">

	<!-- Wrapper for carousel items -->


			<div class="testimonial">{{= commcontents}}</div>
			<div class="media">	
				<div class="media-body">
					<div class="overview">
						<div class="name">
							<b>{{= userid}}</b>
						</div>
						<div class="details">{{= order_str}} / {{= commaddr}}</div>
						<div class="star-rating">
							<ul class="list-inline">
								{{if star == 1}}
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
								{{/if}}	
								{{if star == 2}}
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
								{{/if}}
								{{if star == 3}}
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
								{{/if}}
								{{if star == 4}}
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star-o"></i></li>
								{{/if}}
								{{if star == 5}}
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
									<li class="list-inline-item"><i class="fa fa-star"></i></li>
								{{/if}}												
							</ul>							
						</div>
					</div>
				</div>
			</div>
	<hr />
</div>

	</script>
<script type="text/javascript">
	function addNewItem(commnum, userid, commcontents, star, commaddr, chk,
			order_str) {
		var li_data = {
			"commnum" : commnum,
			"userid" : userid,
			"commcontents" : commcontents,
			"star" : star,
			"commaddr" : commaddr,
			"chk" : chk,
			"order_str" : order_str
		};
		var new_li = $("#itemTemplate").tmpl(li_data);
		$("#comment_list").prepend(new_li);
	}

	$(function() {
		$.get(
				"comment_list",
				{},
				function(data) {
					$(data).find("comment").each(
							function() {
								var commnum = $(this).find("commnum").text();
								var userid = $(this).find("userid").text();
								var commcontents = $(this).find("commcontents")
										.text();
								var star = $(this).find("star").text();
								var commaddr = $(this).find("commaddr").text();
								var order_str = $(this).find("order_str")
										.text();
								var loginid = $("#user_name").val();
								var chk = false;

								if (userid == loginid) {
									chk = true;
								}

								addNewItem(commnum, userid, commcontents, star,
										commaddr, chk, order_str);
							});
				}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주십시오.")
		});

		$("#comment_form")
				.submit(
						function() {
							if (!$("#user_name").val()) {
								alert("입력하세요");
								return false;
							}

							if (!$("#comment").val()) {
								alert("내용을 입력하세요");
								return false;
							}

							$
									.post(
											"comment_add",
											$(this).serialize(),
											function(xml) {
												var result = $(xml).find(
														"result").text();
												var message = $(xml).find(
														"message").text();

												if (result) {
													alert(message);
													var commnum = $(xml).find(
															"commnum").text();
													var userid = $(xml).find(
															"userid").text();
													var commcontents = $(xml)
															.find(
																	"commcontents")
															.text();
													var star = $(xml).find(
															"star").text();
													var commaddr = $(xml).find(
															"commaddr").text();
													var loginid = $(
															"#user_name").val();
													var chk = false;

													if (userid == loginid) {
														chk = true;
													}
													alert(chk);
													addNewItem(commnum, userid,
															commcontents, star,
															commaddr, chk);

													$("#comment").val("");
												} else {
													alert(message);
												}
											}).fail(function() {
										alert("실패");
									});
							return false
						});

		$(document).on('click', '.delete_btn', function() {
			if (confirm("정말로 선택하신 댓글을 삭제하시겠습니까?")) {
				var num = $(this).parent().parent().attr("data_num");
				var target = $(this).parents(".carousel slide");//$(this).find("num").text();
				target.remove();

				$.post("deleteComment", {
					"commnum" : num
				}, function(xml) {

				}).fail(function() {
					alert("삭제 실패");
				});
			}
		});
	});
</script>
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

<meta charset="utf-8">
<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
</head>
<body>
	<nav class="navbar navbar-default navbar-expand-lg navbar-light">
		<div class="navbar-header d-flex col">
			<a class="navbar-brand" href="home_link">Haitatsu<b>Site</b></a>
		</div>
		<!-- Collection of nav links, forms, and other content for toggling -->
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
						<li><a href="#" class="ybbs_eventList?reqPage=1">이벤트 게시판</a></li>
						<li><a href="#" class="ybbs_req_list?reqPage=1">Q/A 게시판</a></li>
					</ul></li>
				<c:if test="${users != null}">
					<li class="nav-item"><a href="logout_link" class="nav-link">로그아웃</a></li>
					<li class="nav-item"><a href="myPage_link" class="nav-link">마이페이지</a></li>
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
	<br />
	<span>${detailR.rNum}</span>
	<span>${detailR.rName}</span>
	<span>${detailR.cNum}</span>
	<span><fmt:formatNumber value="${detailR.starAvg}" pattern=".0" /></span>
	<span>${detailR.townNum}</span>
	<span>${detailR.rAddr}</span>
	<span>${detailR.rPhoneNum}</span>
	<hr />
	<div class="container">
		<div
			style="width: 750px; height: 500px; float: left; margin-right: 5px;">
			<div class="w3-bar">
				<input type="button" value="메뉴"
					class="w3-bar-item w3-button w3-black" style="width: 50%"
					id="change1"> <input type="button" value="댓글"
					class="w3-bar-item w3-button w3-red" style="width: 50%"
					id="change2">
			</div>
			<form id="comment_form">
				<input type="hidden" name="user_name" id="user_name"
					value="${users.userId}" />
			</form>

			<h2>
				See What <b>${detailR.rName}'s Customers</b> Say About Us
			</h2>

			<div id="comment_list"></div>
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
</body>
</html>