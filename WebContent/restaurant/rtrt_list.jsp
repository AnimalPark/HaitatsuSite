<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Restaurant Form</title>
	</head>
	<body>
	<c:if test="${users.authority eq 1}">
	<h1>${users.userId}관리자 계정으로 로그인됨</h1>
	</c:if>
		<h3>Restaurant List</h3>
	
		<form action="admin_rtrt_search"method="post">
			<input type="text" name="rName" placeholder="가게 이름 검색...">
			<input type="submit" value="검색">
		</form>
			
		<c:if test="${empty restaurant}">
			<hr />
			검색된 결과가 존재하지 않습니다
			<hr />
		</c:if>
		<c:if test="${!empty restaurant}"></c:if>
		
		<table class="table">
			<thead>
				<tr>
					<td>가게이름</td>
					
					<td>/  전화번호</td>
					
					<td>/  카테고리</td>
					
					<td>/  동네번호</td>
					
					<td>/  평균별점</td>
					
					<td>/  주소</td>
				</tr>
			</thead>
				
		<c:forEach var="restaurant" items="${restaurant}">
			<tr>
				<td><a href="admin_rtrt_detail?rNum=${restaurant.rNum}">${restaurant.rName}</a></td>
				<td>${restaurant.rPhoneNum}</td>
				<td>${restaurant.cNum}</td>
				<td>${restaurant.townNum}</td>
				<td>${restaurant.starAvg}</td>
				<td>${restaurant.rAddr}</td>
			</tr>	
		</c:forEach>
		</table>

   		<button type="button" onclick="location.href='index.jsp'" >처음화면으로</button>
   		<c:if test="${users.authority eq 1}">
   	 	<button type="button" onclick="location.href='restaurant_add'">가게 정보 추가</button>
		</c:if>
	</body>
</html>