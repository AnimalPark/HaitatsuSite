<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 페이지</title>
</head>
<body>
	<form method="post" action="user_login" >
		<input type="text" name="userid" id="userid" placeholder="username"/> <br />
		<input type="pwd" name="upwd" id="upwd" placeholder="●●●●"/> <br />
		<input type="submit" value="로그인 하기">
	</form>
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
	<meta charset="utf-8">
	<title>login.jsp</title>
</head>
<body>
	<h2>로그인</h2>
	<form action="login" method="post">
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요."/><br />
		<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요."/><br />
		<input type="submit" value= "가입하기"/>
	</form>
	${message}
>>>>>>> 295481901e21a44729e90155469461be43ceefb0
</body>
</html>