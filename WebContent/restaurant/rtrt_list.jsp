<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<<<<<<< HEAD
<head>
<meta charset="utf-8">
<title>Restaurant List</title>
<style type="text/css">
#select {
	font-size: 20px;
}
</style>
</head>
<body>


	<form action="" method="post">
		<input type="text" name="name" placeholder="찾는 이름을 입력하세요"> <input
			type="submit" value="찾기">
	</form>
	<%-- 		
	<c:if test="${empty  }">
=======

	<head>
		<meta charset="utf-8">
		<title>Restaurant List</title>
	</head>
	<body>		
		<form action="" method="post">
			<input type="text" name="name" placeholder="찾는 이름을 입력하세요">
			<input type="submit" value="찾기">
		</form>	
	<c:if test="${empty restaurant}">	
>>>>>>> f0b7fd70f8c1ff9aee6dd3c8310e8d663608922e
		<hr />
			검색된 결과가 존재하지 않습니다.
		<hr />
	</c:if>
<<<<<<< HEAD
	<c:if test="${!empty }"></c:if>
	
=======

	<c:if test="${!empty restaurant}"></c:if>
>>>>>>> f0b7fd70f8c1ff9aee6dd3c8310e8d663608922e
	<table>
		<thead>
			<tr>
				<th>Restaurant name</th>
				<th>/ Phone number</th>
				<th>/ Category</th>
				<th>/ Star average</th>
				<th>/ Restaurant Address</th>
			</tr>
		</thead>
		<tbody>
<<<<<<< HEAD
			<c:forEach var="member" items="${}">
				<tr>
					<td><a href="mbr_detail?no=${member.no}">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.gender}</td>
					<td>${member.birth}</td>
=======
			<c:forEach var="restaurant" items="${restaurant}">
				<tr>
					<td><a href="admin_rtrt_detail?rNum=${restaurant.rNum}">${restaurant.rName}</a></td>
					<td>${restaurant.rPhoneNum}</td>
					<td>${restaurant.cNum}</td>
					<td>${restaurant.starAvg}</td>
					<td>${restaurant.rAddr}</td>
>>>>>>> f0b7fd70f8c1ff9aee6dd3c8310e8d663608922e
			</c:forEach> 
		</tbody>
	</table>

	<button type="button" onclick="location.href='admin/adminScreen.jsp' ">관리자화면 메인</button>
</body>
</html>