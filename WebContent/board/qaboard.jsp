<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border-collapse: collapse;
	width: 70%;
	margin: auto;
	text-align: center;
}
span {
  font-size: 30px;
  background-color: red;
  -webkit-animation-name: example;
  -webkit-animation-duration: 1s;
  animation-name: example;
  animation-duration: 1s;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}

#back {
	position: absolute;
	top: 50px;
	left: 50px;	
}

#select{
	margin : auto;
	text-align : center;
}

a:link {
	color: red;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
</head>
<body>
	<a href="index.jsp">뒤로가기</a>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회</th>
		</tr>
		<c:forEach var="ybbsList" items="${ybbsList}">
			<tr>
				<td>${ybbsList.no}</td>
				<c:if test="${ybbsList.lvl eq 0}">
					<td><a href="ybbs_detail?no=${ybbsList.no}">${ybbsList.subject}</a></td>
				</c:if>
				<c:if test="${ybbsList.lvl eq 1}">
					<td><a href="ybbs_detail?no=${ybbsList.no}">ㄴ${ybbsList.subject}</a></td>
				</c:if>
				<td>${ybbsList.id}</td>
				<td>${ybbsList.wdate}</td>
				<td>${ybbsList.visited}</td>
			</tr>
		</c:forEach>
	</table>
	<div id="select">
			<c:if test="${pageGroupResult.beforePage}">
				<a href="ybbs_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◁</a>
				</c:if>
			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}"
				end="${pageGroupResult.groupEndNumber}">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumber==index}">
						<span><a href="ybbs_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					<c:otherwise>
						<a href="ybbs_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<c:if test="${pageGroupResult.afterPage}">
			<a href="ybbs_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▷</a>
		</c:if>
	</div>
</body>
</html>