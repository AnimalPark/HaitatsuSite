<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<a href="login_link">로그인</a>
	<a href="sign_link">회원가입</a>
	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="event_board_link">이벤트 게시판</a>

	<c:if test="${!empty lists}">
			<table class="table table-striped">
				<tr>
					<td>rName</td>
					<td>cNum</td>
					<td>starAvg</td>
					<td></td>
				</tr>
				<c:forEach var="list" items="${lists}">
					<tr>
						<td>${list.rName}</td>
						<td>${list.cNum}</td>
						<td>${list.starAvg}</td>
						<td><a href="restaurant_detail?rno=${list.memno}">상세보기</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
</body>
</html>