<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Restaurant List</title>
		<style type="text/css">
			#select{
    			font-size: 20px;
    		}
		</style>
	</head>
	<body>
		
		<form action="" method="post">
			<input type="text" name="name" placeholder="찾는 이름을 입력하세요">
			<input type="submit" value="찾기">
		</form>
		
	<c:if test="${empty  ">
		<hr />
			검색된 결과가 존재하지 않습니다.
		<hr />
	</c:if>
	<c:if test="${!empty }"></c:if>
	
	<table>
		<thead>
			<tr>
				<th>Restaurant name</th>
				<th>Phone number</th>
				<th>Category</th>
				<th>Town</th>
				<th>Star average</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${}">
				<tr>
					<td><a href="mbr_detail?no=${member.no}">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.gender}</td>
					<td>${member.birth}</td>
			</c:forEach>
		</tbody>
	</table>
	
	<c:if test="${pageGroupResult.beforePage}"><a href="memo_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">앞</a></c:if>
	<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
		<c:choose>
			<c:when test="${pageGroupResult.selectPageNumber==index}">
				<span id="select"><a href="memo_req_list?reqPage=${index}">${index}</a></span>
			</c:when>
			<c:otherwise>
				<a href="memo_req_list?reqPage=${index}">${index}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pageGroupResult.afterPage}"><a href="memo_req_list?reqPage=${pageGroupResult.groupEndNumber+1}" >뒤</a></c:if>
	<br /><br />
	<button type="button" onclick="location.href='' " >처음으로</button>
    <button type="button" onclick="location.href='' " >회원가입</button>
    <button type="button" onclick="location.href='' ">게시판</button>
	</body>
</html>