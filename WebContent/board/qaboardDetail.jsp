<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>안녕하세요</title>
<style>
div {
	border: 1px solid #bcbcbc;
	width : 10%
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

	<a class="navbar-brand" href="index.jsp">
	 <img src="image/Haitatsu.jpg" alt="Haitatsu" style="width:100px;">
	</a>

  <ul class="navbar-nav">
    <li class="nav">
   	 <a class="nav-link" href="ybbs_eventList?reqPage=1">이벤트게시판 </a>
    </li>
    <c:if test="${users == null}">
	    <li class="nav1">
	    	<a class="nav-link" href="user_login">로그인</a>
	    </li>
    </c:if>
    <c:if test="${users != null}">
		<li class="nav1">
	    	<a class="nav-link" href=user_logout>로그아웃</a>
	    </li>
	</c:if>
  </ul>
</nav>
	<c:if test="${ybbs.userid == users.userId || users.authority eq 1}">
		<form action="ybbs_goTo_update" method="post">
			<div>작성자 : ${ybbs.userid}</div>
			<div>${ybbs.qanumber}</div>
			<div>${ybbs.qasubject}</div>
			<div>${ybbs.qacomment}</div>
			<input type="hidden" name ="qanumber" value="${ybbs.qanumber}">
			<input type="submit" class="btn btn-primary" value="글 수정">
		</form>
		<c:if test="${users.authority eq 1}">
			<a href="ybbs_reply_form.ad?qanumber=${ybbs.qanumber}">답변 작성</a><br />
		</c:if>
			<a href="ybbs_delete?qanumber=${ybbs.qanumber}">글 삭제</a><br />
			<a href="ybbs_req_list?reqPage=1">목록으로</a>	<br/>	
	</c:if>
	<c:if test="${ybbs.userid != users.userId && ybbs_id != users.userId && users.authority != 1}">
			<div>글 작성자만 읽을 수 있습니다</div>
			<a href = "ybbs_req_list?reqPage=1">목록으로</a>
		</c:if>
	<c:if test="${ybbs_id == users.userId && ybbs.userid != users.userId }">
			<div>작성자 : ${ybbs.userid}</div>
			<div>${ybbs.qanumber}</div>
			<div>${ybbs.qasubject}</div>
			<div>${ybbs.qacomment}</div>
			<a href="ybbs_req_list?reqPage=1">목록으로</a>	<br/>
	</c:if>
</body>
</html>