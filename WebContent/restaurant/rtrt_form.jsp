<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>가게 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
body {
	color: #fff;
	background: #eeeeee;
	font-family: 'Roboto', sans-serif;
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

.form-control {
	min-height: 41px;
	box-shadow: none;
	border-color: #e1e4e5;
}

.form-control:focus {
	border-color: #49c1a2;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form form {
	color: #9ba5a8;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}

.signup-form hr {
	margin: 0 -30px 20px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form label {
	font-weight: normal;
	font-size: 13px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #49c1a2;
	border: none;
	min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #3cb094;
	outline: none !important;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #49c1a2;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}

.file_input label{
position:relative;
cursor:pointer;
display:inline-block;
vertical-align:middle;
overflow:hidden;
width:100px;
height:30px;
background:#777;
color:#fff;
text-align:center;
line-height:30px;}

.file_input label input{
position:absolution;
width:0;
height:0;
overflow:hidden;}

.file_input input[type=text]{
vertical-align:middle;
display:inline-block;
width:300px;
height:28px;
font-size:11px;
padding:0;
border:0;
border:1px solid #777;}

</style>
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


<div class="signup-form">
    <form action="admin_rtrt_insert" enctype="multipart/form-data" method="post">
		<h2>가게 등록</h2>
		<hr>
        <div class="form-group">
			<label>가게이름</label>
        	<input type="text" class="form-control" name="rName" required="required">
        </div>
        <div class="form-group">
			<label>전화번호</label>
        	<input type="text" class="form-control" name="rPhoneNum" required="required">
        </div>
		<div class="form-group">
			<label>음식 카테고리</label>
            <select name="cNum" class="form-control" required="required">
            <option>-------업종선택-------</option>
			<option value="1">한식</option>
			<option value="2">중식</option>
			<option value="3">일식</option>
			<option value="4">피자</option>
			<option value="5">치킨</option>
			<option value="6">분식</option>
			<option value="7">족발</option>
			<option value="8">간식</option>
			</select>
        </div>
		<div class="form-group">
			<label>지역</label>
            <select name="townNum" class="form-control" required="required">
            <option>-------지역선택-------</option>
			<option value="1">영등포구 양산로</option>
			<option value="2">영등포구 영신로</option>
			<option value="3">영등포구 노들로</option>
			<option value="4">마포구 와우산로</option>
			<option value="5">마포구 월드컵로</option>
			<option value="6">용산구 회나무로</option>
			<option value="7">용산구 이태원로</option>
			</select>
        </div>
        <div class="form-group">
			<label>상세 주소</label>
            <input type="text" class="form-control" name="confirm_password" required="required">
        </div>
		<div class="file_input">
		<input type="text" readonly="readonly" id="file_route">
		<label>
		사진 추가
		<input type="file" name="filename" onchange="javascript:document.getElementById('file_route').value=this.value">
		</label>
		</div>
		<br>
		
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">등록</button>
        </div>
    </form>
</div>
</body>
</html>

