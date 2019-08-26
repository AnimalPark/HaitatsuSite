<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
	
	
<script type="text/javascript">
	$(function() {
		$("#comment_form").submit(function() {
			if (!$("#user_name").val()) {
				alert("입력하세요");
				return false;
			}

			if (!$("#comment").val()) {
				alert("내용을 입력하세요");
				return false;
			}

			$.post("comment_add", $(this).serialize(), function(xml) {
				location.href = "user_orderlist";

			}).fail(function() {
				alert("실패");
			});
			return false
		});
	});
</script>
<style type="text/css">

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

.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('img/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 30px;
	padding: 10px;
	line-height: 20px;
}

.star-input>.input {
	display: inline-block;
	width: 100px;
	background-size: 100px;
	height: 18px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 18px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 100px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 20px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 40px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 60px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 80px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 100px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 40px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>

<title>Insert title here</title>
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
						</ul>
				</c:if>
			</ul>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 m-auto">
				<div class="contact-form">
					<h1>후기 남기기</h1>
					<form id="comment_form">
						<input type="hidden" name="rn" id="rn" value="${rnum}" /> <input
							type="hidden" name="on" id="on" value="${onum}" /> <input
							type="hidden" name="order_string" id="order_string"
							value="${order_str}" /> <input type="hidden" name="userid"
							id="userid" value="${users.userId}" /> <input type="hidden"
							name="user_name" id="user_name" value="${users.userId}"
							disabled="disabled" /> <br />
						<p>주문 목록 : ${order_str}</p>
						<span class="star-input"> <span class="input"> <input
								type="radio" name="star-input" value="1" id="p1"> <label
								for="p1">1</label> <input type="radio" name="star-input"
								value="2" id="p2"> <label for="p2">2</label> <input
								type="radio" name="star-input" value="3" id="p3"> <label
								for="p3">3</label> <input type="radio" name="star-input"
								value="4" id="p4"> <label for="p4">4</label> <input
								type="radio" name="star-input" value="5" id="p5"> <label
								for="p5">5</label>
						</span>
						</span><br /> <label for="comment">덧글 내용</label><br />
						<textarea class="form-control" id="comment" name="comment"
							rows="10" style="width: 100%" required></textarea>
						<input type="submit" value="저장하기" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/star.js"></script>
</body>
</html>