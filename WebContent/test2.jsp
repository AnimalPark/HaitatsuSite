<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list" items="${lists}">
		<c:if test="${list.mNum == mno}">
			<span>${list.mName}</span>
			<span>${list.mPrice}원</span>
		</c:if>
	</c:forEach>

	<select name=order_cnt>
		<option value="0">0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
	</select>
	<br /><a href="#" onclick="history.back(); return false;">앞 페이지로 이동</a>
</body>
</html>