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
	<c:if test="${users == null}">
		<a href="login_link">로그인</a>
	</c:if>`	
	<c:if test="${users != null}">
		<form action="user_logout">
			<a href="logout_link">로그아웃</a>
		</form>
	</c:if>
	<a href="join_link">회원가입</a>
	<a href="home_link">홈화면</a>
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
	
	<a href = "admin_home_link">관리자 모드로 가기</a>
</body>
</html>