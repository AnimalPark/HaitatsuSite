<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Restaurant Detail</title>
	</head>
	<body>
		<button type="button" onclick="location.href='index.jsp'" >처음으로</button>
		
			<h4>상세보기</h4>
				<img src="filemanager/${restaurant.fileName}"/>
			  	가게이름 : ${restaurant.rName}<br />
				전화번호 : ${restaurant.rPhoneNum}<br />
				주소 : ${restaurant.rAddr}<br />
			<c:if test="${users.authority eq 1}">
				<button type="button" onclick="location.href='admin_rtrt_mdf?rNum=${restaurant.rNum}'" >가게 정보 수정</button>
				<button type="button" onclick="location.href='admin_rtrt_delete?rNum=${restaurant.rNum}'" >가게 삭제</button><br />
			</c:if>
			
		
		<hr />
		<c:if test="${users.authority eq 1}">
		<button type="button" onclick="location.href='menu_add?rNum=${restaurant.rNum}'" >메뉴추가</button>
		</c:if>
		<table>
			<thead>
				<tr>
					<td>메뉴이름</td>
					<td>/ 가격</td>
				</tr>
			</thead>
		
		<c:forEach var="menu" items="${menulist}">
			<tr>
			<c:if test="${users.authority eq 0 || users == null}">
				<td>${menu.mName}</td>
			</c:if>
			<c:if test="${users.authority eq 1}">
				<td><a href="admin_menu_detail?mNum=${menu.mNum}">${menu.mName}</a></td>
			</c:if>
				<td>${menu.mPrice}</td>
			</tr>
		</c:forEach>
		</table>
	</body>
</html>