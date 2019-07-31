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
	 <img src="image/bikewaiter-icon1.png" alt="Haitatsu" style="width:100px;">
	</a>

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
	<%-- <c:if test="${ybbs.userid}"> --%>
		
		<!-- <form action="ybbs_update" method="post"> -->
		<form action="ybbs_reply_form" method="post">
			<div>작성자 :${ybbs.userid}</div>
			<input type="hidden"  name="qanumber" value="${ybbs.qanumber}"/><br />
			<input type="text"  name="qasubject" value="${ybbs.qasubject}" /><br />
			<input type="text"  name="qacomment" value="${ybbs.qacomment}" /><br />
			<input type="text" name="userid" value="${ybbs.userid}"/>
			<input type="submit" class="btn btn-primary" value="응답쓰러가기">
		</form>
			<a href="ybbs_delete?qanumber?${ybbs.qanumber}">삭제</a><br />
			<a href="ybbs_req_list?reqPage=1">뒤로가기</a>	
	<%-- </c:if> --%>
	
	<%-- <c:if test="${ybbs.userid != member.id}">
		
	<form action="ybbs_reply_form.do" method="post">
		<div>작성자 :${ybbs.userid}</div>
		
		<input type="hidden"  name="qanumber" value="${ybbs.qanumber}"/><br />
		<input type="text"  name="qasubject" value="${ybbs.qasubject}" disabled="disabled"/><br />
		<input type="text"  name="qacomment" value="${ybbs.qacomment}" disabled="disabled"/><br />
		
		<a href="ybbs_req_list?reqPage=1">페이징처리된 뒤로가기ㅎ</a>
		<c:if test="${member.id != null}">
			<input type="submit" class="btn btn-primary" value="응답쓰러가기">
		</c:if>
	
	 </form>
	
	</c:if> --%>

</body>
</html>