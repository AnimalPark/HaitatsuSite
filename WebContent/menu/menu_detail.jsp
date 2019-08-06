<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Menu Detail</title>
	</head>
	<body>
			<h4>상세보기</h4>
			<form action="admin_rtrt_update" method="post">
			   	메뉴고유번호<input type="hidden" name="rNum" value= "${menu.mNum}"/><br />
				가게고유번호<input type="text"  name="rName" value="${menu.rNum}"/><br />
				메뉴이름<input type="text"  name="rPhoneNum" value= "${menu.mName}"/><br />
				가격<input type="text"  name="cNum" value= "${menu.mPrice}"/><br />
				총판매개수<input type="text"  name="starAvg" value= "${menu.mSales}"/><br />
					  <input type="submit" class="btn btn-primary" value="수정"/><br />
			</form>
		<a href="admin_rtrt_delete?rNum=${menu.rNum}">가게 정보 삭제</a>
	</body>
</html>