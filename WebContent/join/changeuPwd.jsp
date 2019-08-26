<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
<
script type ="text/javascript">function validation () {if
	(change.uPwd.value == "") { alert("비밀번호를 입력하세요.") change.uPwd.focus();return
	false;
	
}

//
비밀번호 유효성 검사 (영문 대소문자, 숫자만 허용 )
        var numChk = 0; var engChk = 0; var tfchk = 1; for (var i = 0; i 
	< change.uPwd.value.length ; i+ +) { ch = change.uPwd.value.charAt (i);
             
             if ((ch> = '0' && ch <= '9') || (ch> = 'a ' && ch <= 'z ') 
	|| (ch> = 'A ' && ch <= 'Z ')){if ((ch >= '0' && ch <= '9')){ numChk++;
	
}

else if ((ch > = 'a ' && ch <= 'z ') || (ch> = 'A ' && ch <= 'Z ')){engChk
	++;
	
}

}
else {tfchk = 0;
	
}

}
if
(tfchk
 
==
0){
alert
("비밀번호는
 
영문
 
대소문자
,
숫자만
 
입력가능합니다
.")

            
change
.uPwd
.focus
();

        	
change
.uPwd
.select
();

            
return
 
false
;

        
}
else {if (!(numChk != 0 && engChk != 0)){ alert("숫자와 영문자(대소문자 무관) 각각 하나
	이상을 입력하세요.") change.uPwd.focus();change .uPwd.select();return false;
	
}

else {;
	
}

}
if
 
(
change
.uPwd
.value
.indexOf
("
 
")
>=
0)
{
alert
("비밀번호에
 
공백을
 
사용할
 
수
 
없습니다
.")

            
change
.uPwd
.focus
();

            
change
.uPwd
.select
()

            
return
 
false
;

        
}
if
 
(
change
.uPwd
.value
.length
 
<
6
||
change
.uPwd
.value
.length
>
18)
{
alert
("비밀번호를
 
6~18
자까지
 
입력해주세요
.")

            
change
.uPwd
.focus
();

            
change
.uPwd
.select
();

            
return
 
false
;

        
}
if (change.uPwd.value != change.uPwd1.value ) {alert ("비밀번호가 일치하지 않습니다")
	change.uPwd1.value = "" change.uPwd1.focus();return false;
	
}

alert
("비밀번호가
 
정상적으로
 
변경되었습니다
.");

    
}
</
script> <title>비밀번호 재설정 </title>body {
	color: #636363;
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
	height: 40px;
	box-shadow: none;
	color: #969fa4;
}

.form-control:focus {
	border-color: #5cb85c;
}

.form-control, .btn {
	border-radius: 3px;
}

.finduPwd-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;
}

.finduPwd-form h3 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
}

.finduPwd-form h3:before, .finduPwd-form h3:after {
	content: "";
	height: 2px;
	width: 30%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}

.finduPwd-form h3:before {
	left: 0;
}

.finduPwd-form h3:after {
	right: 0;
}

.finduPwd-form .hint-text {
	color: #999;
	margin-bottom: 30px;
	text-align: center;
}

.finduPwd-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.finduPwd-form .form-group {
	margin-bottom: 5px;
}

.finduPwd-form .btn {
	font-size: 16px;
	font-weight: bold;
	min-width: 140px;
	outline: none !important;
}

.finduPwd-form a {
	color: #636363;
	text-decoration: underline;
}

.finduPwd-form a:hover {
	text-decoration: none;
}

.finduPwd-form form a {
	color: #636363;
	text-decoration: none;
}

.finduPwd-form form a:hover {
	text-decoration: underline;
}
</style>

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

	<div class="finduPwd-form">
		<form method="post" action="change_uPwd?userId=${users.userId}"
			name="change" onsubmit="return validation();">
			<h3>비밀번호 재설정</h3>
			<p class="hint-text">비밀밀호를 변경해주세요.</p>
			<div class="form-group">
				<input type="password" id="uPwd" name="uPwd" class="form-control"
					placeholder="비밀번호를 입력해주세요.">※6~18자리의 영문 대소문자, 숫자를 조합하여 사용하실
				수 있습니다.<br />
			</div>
			<div class="form-group">
				<input type="password" id="uPwd1" name="uPwd1" class="form-control"
					placeholder="비밀번호를 다시 한 번 입력해주세요."><br />
			</div>
			<div class="form-group">
				<button class="btn btn-success btn-lg btn-block" type="submit"
					value="변경">변경</button>
				<br />
				<!-- <input type="submit" value="변경하기"> -->
			</div>
		</form>
	</div>
</body>
</html>