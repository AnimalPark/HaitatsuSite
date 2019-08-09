<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta charset="utf-8">
	<title>이벤트 글 작성</title>
</head>
<body>
	<h1>이벤트게시판/글 작성 페이지</h1>
	<form action="ybbs_insert_event.ad" method="post">
		<input type="hidden" name="userId" value="${users.userId}"/>
		<div id='writer'>작성자 : ${users.userId}</div><br />
		제목<input type="text" name="evSubject" id="evSubject"><br />
		내용<textarea rows="10" cols="50" name="evComment"></textarea><br />
		<input type="submit" value="등록">
	</form>
	<a href="ybbs_eventList?reqPage=1">뒤로가기</a>
</body>
</html>