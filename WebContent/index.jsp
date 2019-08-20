<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
<style type="text/css">
body {
	background: #eeeeee;
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
						<li><a href="ybbs_eventList?reqPage=1">이벤트 게시판</a></li>
						<li><a href="ybbs_req_list?reqPage=1">Q/A 게시판</a></li>
					</ul></li>
				<c:if test="${users != null}">
					<li class="nav-item"><a href="user_logout" class="nav-link">로그아웃</a></li>

					<li class="nav-item dropdown"><a data-toggle="dropdown"
						class="nav-link dropdown-toggle" href="myPage_link">마이페이지 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">주문내역</a></li>
							<li><a href="#">개인정보 수정</a></li>
							<li><a href="#">비밀번호 변경</a></li>
						</ul>
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
	<div
		style="width: 700px; height: 500px; float: left; margin-right: 10px;">
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