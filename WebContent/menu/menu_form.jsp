<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>Restaurant Form</title>
</head>
<body>
	<form action="admin_menu_insert" method="get">
		<h2>메뉴 등록</h2>
		<hr>
		<input type="hidden" name="rNum" value= "${restaurant.rNum}" >
		메뉴 이름<input type="text" name="mName" placeholder="가게명을 입력하세요"><br /> 
		가격<input type="text" name="mPrice" placeholder="대표전화번호를 입력하세요"><br />
		<input type="submit" value="메뉴 등록">
		<hr />
	</form>

</body>
</html>

