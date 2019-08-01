<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<!-- 로그인하면 로그인 버튼 대신에 로그아웃 버튼이 뜨게 하고 싶은데 잘 안 되네요 -->
	<c:if test="${Users == null}">
		<a href="login_link">로그인</a>
	</c:if>
	<c:if test="${Users != null}">
		<form action="user_logout">
			<a href="logout_link">로그아웃</a>
		</form>
	</c:if>
	<a href="join_link">회원가입</a>
	<a href="admin_home_link">홈화면</a>
	<a href="ybbs_req_list?reqPage=1">Q/A 게시판</a>
	<a href="ybbs_eventList?reqPage=1">이벤트 게시판</a>

	<a href = "search_link?category=1">한식</a>
	<a href = "search_link?category=2">중식</a>
	<a href = "search_link?category=3">일식</a>
	<a href = "search_link?category=4">피자</a>
	<a href = "search_link?category=5">치킨</a>
	<a href = "search_link?category=6">분식</a>
	<a href = "search_link?category=7">족발</a>
	<a href = "search_link?category=8">간식</a>
	
</body>
</html>