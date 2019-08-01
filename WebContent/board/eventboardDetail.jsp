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
   	 <a class="nav-link" href="ybbs_req_list?reqPage=1">Q/A게시판 </a>
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
			<%-- <div>작성자 :${ybbs.userid}</div> --%>
			<div>
				<h1>${ybbs.evNumber}</h1>
			</div>
			<div>
				<h1>${ybbs.evSubject}</h1>
			</div>
			<div>
				<h1>${ybbs.evComment}</h1>
			</div>
			<div>
				<h1>${ybbs.userId}</h1>
			</div>
			<a href="ybbs_delete_event?evNumber=${ybbs.evNumber}">글 내리기</a><br />
			<a href="ybbs_req_list?reqPage=1">뒤로가기</a>	

</body>
</html>