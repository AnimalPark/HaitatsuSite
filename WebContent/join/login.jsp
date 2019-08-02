<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 페이지</title>
</head>
<body>
	<a href="join_link">회원가입</a>
	<form method="post" action="user_login" >
		<input type="text" name="userId" id="userId" placeholder="username"/> <br />
		<input type="password" name="uPwd" id="uPwd" placeholder="●●●●"/> <br />
		<input type="submit" value="로그인 하기">
	</form>
<<<<<<< HEAD
	${message}<br />
	<a href="findId_link">아이디 찾기</a>/<a href="findPwd_link">비밀번호 찾기</a>
=======
	${message}
>>>>>>> f0b7fd70f8c1ff9aee6dd3c8310e8d663608922e
</body>
</html>