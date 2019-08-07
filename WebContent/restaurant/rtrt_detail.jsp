<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Restaurant Detail</title>
	</head>
	<body>
			<h4>상세보기</h4>
			<form action="admin_rtrt_update" method="post">
			   	가게고유번호<input type="text" name="rNum" value= "${restaurant.rNum}"/><br />
				가게이름 <input type="text"  name="rName" value="${restaurant.rName}"/><br />
				전화번호 <input type="text"  name="rPhoneNum" value= "${restaurant.rPhoneNum}"/><br />
				카테고리 <input type="text"  name="cNum" value= "${restaurant.cNum}"/><br />
				동네번호 <input type="text"  name="townNum" value= "${restaurant.townNum}"/><br />
				평균별점 <input type="text"  name="starAvg" value= "${restaurant.starAvg}"/><br />
				주소 <input type="text"  name="rAddr" value= "${restaurant.rAddr}"/><br />
					  <input type="submit" class="btn btn-primary" value="수정"/><br />
			</form>
		<a href="admin_rtrt_delete?rNum=${restaurant.rNum}">가게 정보 삭제</a><br/>
		<a href="menu_add/">메뉴추가하기</a>
		<a href="index.jsp">처음으로 돌아가기</a>
		
		<table>
			<thead>
				<tr>
					<td>메뉴이름</td>
					<td>/ 가격</td>
				</tr>
			</thead>
		
		<c:forEach var="menu" items="${menulist}">
			<tr>
				<td><a href="admin_menu_detail?rNum=${restaurant.rNum}">${menu.mName}</a></td>
				<td>${menu.mPrice}</td>
			</tr>
		</c:forEach>
		</table>
		<button type="button" onclick="location.href='admin_home_link' " >처음으로</button>
    	<button type="button" onclick="location.href='menu_add' " >메뉴 추가</button>
	</body>
</html>