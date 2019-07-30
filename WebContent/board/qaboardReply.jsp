<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta charset="utf-8">
	<title>board.jsp</title>
</head>
<body>
	<h1>글작성</h1>
	<form action="ybbs_reply.do" method="post">
		<input type="hidden" name="id" value="${member.id}"/>
		<div id='writer'>작성자:${member.name}</div><br />
		제목<input type="text" name="subject" id="subject"><br />
		내용<textarea rows="10" cols="50" name="content"></textarea><br />
		그룹<input type="hidden" name="grp" id="grp" value="${num}">
		<input type="submit" value="댓글달기">
	</form>
</body>
</html>