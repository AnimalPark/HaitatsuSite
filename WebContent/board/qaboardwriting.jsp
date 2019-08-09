<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta charset="utf-8">
	<title>QA게시판/글 작성 페이지</title>
</head>
<body>
	<h1>글작성</h1>
	<form action="ybbs_insert.ad" method="post">
		<input type="hidden" name="userid" value="${users.userId}"/>
		<div id='writer'>작성자명 : ${users.userId}</div><br />
		제목<input type="text" name="qasubject" id="qasubject"><br />
		내용<textarea rows="10" cols="50" name="qacomment"></textarea><br />
		<input type="submit" value="등록">
	</form>
	<a href="ybbs_req_list?reqPage=1">뒤로가기</a>
</body>
</html>