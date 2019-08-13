<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<meta charset="utf-8">
	<title>QA게시판/ 답변달기 게시판</title>
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
   	 <a class="nav-link" href="ybbs_eventList?reqPage=1">이벤트게시판 </a>
    </li>
    <c:if test="${users == null}">
	    <li class="nav1">
	    	<a class="nav-link" href="login_link">로그인</a>
	    </li>
    </c:if>
    <c:if test="${users != null}">
		<li class="nav1">
	    	<a class="nav-link" href="user_logout">로그아웃</a>
	    </li>
	</c:if>
  </ul>
</nav>
	<h1>댓글작성</h1><br/>
	<form action="ybbs_reply.ad" method="post">
		<div><h3>작성자: ${users.userId}</h3></div><br />
		<input type="hidden" name="userid" id="userid" value="${users.userId}"><br />
		<input type="hidden" name="qagroup" id="qagroup" value="${num}" /><br />
		제목<br/><input type="text" name="qasubject" id="qasubject"><br />
		내용<br/><textarea rows="10" cols="50" name="qacomment"></textarea><br />
		<input type="submit" value="답변 작성">
	</form><br/>
	<a href="ybbs_req_list?reqPage=1">목록으로</a>
</body>
</html>