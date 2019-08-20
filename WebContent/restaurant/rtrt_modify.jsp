<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가게정보 수정</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	color: #999;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
}

.form-control {
	box-shadow: none;
	border-color: #ddd;
}

.form-control:focus {
	border-color: #4aba70;
}

.login-form {
	width: 500px;
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

.login-form .form-group {
	margin-bottom: 20px;
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

.login-form a {
	color: #4aba70;
}
</style>

</head>
<body>

	<div class="login-form">
		<form action="admin_rtrt_update" method="get">
			<div class="avatar">
				<img src="filemanager/${restaurant.rFileName}" class="avatar"
					alt="Avatar">
			</div>
			<h4 class="modal-title">가게 정보 수정</h4>
			<div class="form-group">
				<input type="hidden" name="rNum" value="${restaurant.rNum}" />
				가게이름<input type="text" class="form-control" name="rName"value="${restaurant.rName}" required="required"> 
				전화번호<input type="text" class="form-control" name="rPhoneNum" value="${restaurant.rPhoneNum}" required="required"> 
				카테고리 <select name="cNum" class="form-control" required="required">
					<option >업종을 선택하세요</option>
					<option value="1">한식</option>
					<option value="2">중식</option>
					<option value="3">일식</option>
					<option value="4">피자</option>
					<option value="5">치킨</option>
					<option value="6">분식</option>
					<option value="7">족발</option>
					<option value="8">간식</option>
				</select>
			<input type="hidden" name="townNum" value="${restaurant.townNum}" />
			<input type="hidden" name="starAvg" value="${restaurant.starAvg}" />
			<input type="hidden" name="rAddr" value="${restaurant.rAddr}" />
			</div>
		
		<c:if test="${users.authority eq 1}">
			<input type="submit" value="수정" />
			<button type="button"
				onclick="location.href='admin_rtrt_delete?rNum=${restaurant.rNum}'">가게
				정보 삭제</button>
		</c:if>
		
		</form>
	</div>
</body>
</html>




