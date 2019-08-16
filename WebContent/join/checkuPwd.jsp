<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>비밀번호 확인</title>
</head>
<body>
	비밀번호를 확인해 주세요.
	<form method="post" action="check_uPwd?userId=${users.userId}">
		비밀번호 <input type="password" id="uPwd" name="uPwd" placeholder="비밀번호를 입력해주세요."><br />
	<input type="submit" value="비밀번호 확인">
	</form>
	${message}
</body>
</html>