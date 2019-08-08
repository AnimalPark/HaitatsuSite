<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>마이페이지</title>
</head>
<body>
	<h3>마이페이지</h3>
	${users.uName}님 안녕하세요!<br />
	아이디 : ${users.userId}<br />
	주소 : ${users.uAddr}<br />
	연락처 : ${users.uPhonenum}<br />
	<br />
	<a href="orderList_link">주문 내역</a><br />
	<a href="update_link">회원 정보 수정</a><br />
	<a href="updateuPwd_link">비밀번호 변경</a><br />
	<a href="delete_link">탈퇴하기</a>
</body>
</html>