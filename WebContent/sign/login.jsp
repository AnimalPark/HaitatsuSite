<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</body>
</html>