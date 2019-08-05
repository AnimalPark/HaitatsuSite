<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Restaurant Form</title>
	</head>
	<body>
		<form action="admin_rtrt_insert" method="post">
		<h2>가게 등록</h2>
			<hr>
	        Restaurant name<input type="text" name="rName" placeholder="가게명을 입력하세요"><br />
	        Phone number<input type="text" name="rPhoneNum" placeholder="대표전화번호를 입력하세요"><br />
			Category number
			<select name="cNum">
					<option>-------업종선택-------</option>
					<option value="1">한식</option>
					<option value="2">중식</option>
					<option value="3">일식</option>
					<option value="4">피자</option>
					<option value="5">치킨</option>
					<option value="6">분식</option>
					<option value="7">족발</option>
					<option value="8">간식</option>
			</select><br />
       		Town number
			<select name="townNum">
					<option>-------지역선택-------</option>
					<option value="1">안양1동</option>
					<option value="2">안양2동</option>
					<option value="3">안양3동</option>
					<option value="4">호계동</option>
					<option value="5">비산동</option>
					<option value="6">모택동</option>
					<option value="7">고길동</option>
					<option value="8">춘하추동</option>
			</select><br />
			Star average
			<select name="starAvg">
					<option>-------별점-------</option>
					<option value="1">0점</option>
					<option value="1">1점</option>
					<option value="2">2점</option>
					<option value="3">3점</option>
					<option value="4">4점</option>
					<option value="5">5점</option>
			</select><br />
			Address<input type="text" name="rAddr"placeholder="이름을입력하세요"><br />
 			<input type="submit" value="가게 등록">
            <hr />
    	</form>
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
					<td>Restaurant name</td>
					<td>/ Phone number</td>
					<td>/ Category number</td>
					<td>/ Town number</td>
					<td>/ Star average</td>
					<td>/ Address</td>
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
				<td></td>
			</tr>
		</c:forEach>
		</table>

   		<button type="button" onclick="location.href='index.jsp' " >처음화면으로</button>
   	 	<button type="button" onclick="location.href='restaurant/rtrt_form.jsp' ">가게 정보 추가</button>

	</body>
</html>