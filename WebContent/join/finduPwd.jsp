<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<a href="login_link">로그인 화면으로</a>
	<form method="post" action="find_uPwd" >
		아이디 <input type="text" name="userId" id="userId"/><br />
		이름 <input type="text" name="uName" id="uName"/><br />
		연락처 <input type="text" name="uPhonenum" id="uPhonenum" placeholder="ex) 01012345678"/><br />
		<input type="submit" value="비밀번호 찾기">
	</form>
	${message}<br />
	${users.uPwd}
</body>
</html>