<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta content="utf-8">
<title>멤 버 수 정 창</title>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<a href="login_link">로그인</a>
	<a href="sign_link">회원가입</a>
	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="ybbs_eventlist">이벤트 게시판</a>

	<br />
	<br />
	<span>${detailR.rNum}</span>
	<span>${detailR.rName}</span>
	<span>${detailR.cNum}</span>
	<span>${detailR.starAvg}</span>
	<span>${detailR.townNum}</span>
	<span>${detailR.rAddr}</span>
	<span>${detailR.rPhoneNum}</span>
	<hr />
	<p>메 뉴 리 스 트</p>
	<c:if test="${!empty lists}">
		<!-- <table>
			<tr>
				<td>MNUM</td>
				<td>RNUM</td>
				<td>MNAME</td>
				<td>MPRICE</td>
				<td>MSALES</td>
			</tr>
 -->
		<c:forEach var="list" items="${lists}">
			<span>${list.mNum}</span>
			<span>${list.rNum}</span>
			<a href="order_confirm?mnum=${list.mNum}">${list.mName}</a>
			<span>${list.mPrice}</span>
			<span>${list.mSales}</span>
			<br />
		</c:forEach>
	</c:if>

	<ul></ul>
</body>
</html>