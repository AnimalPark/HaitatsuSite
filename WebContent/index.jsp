<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
.button {
	background-color: #008CBA;
	border: none;
	color: white;
	padding: 70px 70px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<c:if test="${warning eq 0}">
<script type="text/javascript">
	alert("관리자 계정으로 로그인시에만 가능한 행동입니다.");
</script>
</c:if>
	<c:if test="${users == null}">
		<a href="login_link">로그인</a>
		<a href="join_link">회원가입</a>
	</c:if>
	<c:if test="${users != null}">
		<form action="user_logout">
			<a href="logout_link">로그아웃</a>
		</form>
		<a href="myPage_link">마이페이지</a>
	</c:if>

	<a href="home_link">홈화면</a>
	<a href="ybbs_req_list?reqPage=1">Q/A 게시판</a>
	<a href="ybbs_eventList?reqPage=1">이벤트 게시판</a>
	<a href="admin_home_link">비로그인</a>
	<br /><br /><br /><br />

	<input type="button" class="button" value="한식" onclick="category1()">
	<input type="button" class="button" value="중식" onclick="category2()">
	<input type="button" class="button" value="일식" onclick="category3()"><br />
	<input type="button" class="button" value="피자" onclick="category4()">
	<input type="button" class="button" value="치킨" onclick="category5()">
	<input type="button" class="button" value="분식" onclick="category6()"><br />
	<input type="button" class="button" value="족발" onclick="category7()">
	<input type="button" class="button" value="간식" onclick="category8()">
	<br />
	<c:if test="${users.authority eq 1}">
		<a href="admin_home_link">관리자 모드로 가기</a>
	</c:if>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function category1() {
			location.href = "search_link?category=1";
			return false;
		}
		function category2() {
			location.href = "search_link?category=2";
			return false;
		}
		function category3() {
			location.href = "search_link?category=3";
			return false;
		}
		function category4() {
			location.href = "search_link?category=4";
			return false;
		}
		function category5() {
			location.href = "search_link?category=5";
			return false;
		}
		function category6() {
			location.href = "search_link?category=6";
			return false;
		}
		function category7() {
			location.href = "search_link?category=7";
			return false;
		}
		function category8() {
			location.href = "search_link?category=8";
			return false;
		}
	</script>
	<a href = "test2" >사진보자</a>
	<a href = "test" >사진보자</a>
</body>
</html>