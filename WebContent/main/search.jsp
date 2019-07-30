<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD

=======
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
>>>>>>> 7e2192997d1d4ea1628b26d25e15c7693d019638
</body>
</html>