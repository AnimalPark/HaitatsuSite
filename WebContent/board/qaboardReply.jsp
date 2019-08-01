<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<meta charset="utf-8">
	<title>board.jsp</title>
<style>
body{
	background-image:url(image/image/Haitatsu.jpg);
	background-repeat:no-repeat;
	background-size:cover;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">	
  <ul class="navbar-nav">
    <li class="nav">
   	 <a class="nav-link" href="ybbs_eventlist">이벤트게시판 </a>
    </li>
    <li class="nav1">
      <a class="nav-link" href="#">로그인</a>
    </li>
    <li class="nav1">
      <a class="nav-link" href="#">로그아웃</a>
    </li>
  </ul>
</nav>
	<h1>글작성</h1>
	<form action="ybbs_reply" method="post">
		<input type="text" name="userid" value="${userid}"/>
		<div id='writer'>작성자:${userid}</div><br />
		제목<input type="text" name="qasubject" id="qasubject"><br />
		내용<textarea rows="10" cols="50" name="qacomment"></textarea><br />
		그룹<input type="text" name="qagroup" id="qagroup" value="${num}">
		<input type="submit" value="댓글달기">
	</form>
</body>
</html>