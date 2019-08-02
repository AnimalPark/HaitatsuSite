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
			   	Restaurant number<input type="hidden" name="rNum" value= "${restaurant.rNum}"/><br />
				Restaurant name<input type="text"  name="rName" value="${restaurant.rName}"/><br />
				Phone number<input type="text"  name="rPhoneNum" value= "${restaurant.rPhoneNum}"/><br />
				Category number<input type="text"  name="cNum" value= "${restaurant.cNum}"/><br />
				Town number<input type="text"  name="townNum" value= "${restaurant.townNum}"/><br />
				Star average<input type="text"  name="starAvg" value= "${restaurant.starAvg}"/><br />
				Address<input type="text"  name="rAddr" value= "${restaurant.rAddr}"/><br />
					  <input type="submit" class="btn btn-primary" value="수정"/><br />
			</form>
		<a href="admin_rtrt_delete?rNum=${restaurant.rNum}">가게 정보 삭제</a>

	</body>
</html>