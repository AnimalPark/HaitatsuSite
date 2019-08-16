<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>아이디 찾기</title>
</head>
<body>
<div class = "login-form">
	<a href="login_link">로그인 화면으로</a> <a href="findPwd_link">비밀번호 찾기</a>
	<form method="post" action="find_userId" >
			<input type="text" name="uName" id="uName" placeholder="이름를 입력해주세요."/><br />
			<input type="text" name="uPhonenum" id="uPhonenum" placeholder="ex) 01012345678"/><br />
			<button class="btn btn-primary btn-block" type="submit" value="아이디 찾기">아이디 찾기</button>
			<!-- <input type="submit" value="아이디 찾기"> -->
	</form>
	${message}<br />
	${users.userId}
</div>
</body>
</html>