<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<a href="ybbs_req_list?reqPage=1">Q/A게시판</a><br/>
<a href="">로그인</a> <a href="">☆회원가입☆</a>
	<table>
		<tbody>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:forEach var="ybbs_QA" items="${ybbsList}">
				<tr>
					<td>${ybbs_QA.qanumber}</td>
					<td>${ybbs_QA.qasubject}</td>
					<td>${ybbs_QA.qadate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>