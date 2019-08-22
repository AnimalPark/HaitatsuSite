<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	color: #566787;
	background: #f7f5f2;
	font-family: 'Roboto', sans-serif;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 30px auto;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	color: #fff;
	background: #40b2cd;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.search-box {
	position: relative;
	float: right;
}

.search-box .input-group {
	min-width: 300px;
	position: absolute;
	right: 0;
}

.search-box .input-group-addon, .search-box input {
	border-color: #ddd;
	border-radius: 0;
}

.search-box input {
	height: 34px;
	padding-right: 35px;
	background: #f4fcfd;
	border: none;
	border-radius: 2px !important;
}

.search-box input:focus {
	background: #fff;
}

.search-box input::placeholder {
	font-style: italic;
}

.search-box .input-group-addon {
	min-width: 35px;
	border: none;
	background: transparent;
	position: absolute;
	right: 0;
	z-index: 9;
	padding: 6px 0;
}

.search-box i {
	color: #a0a5b1;
	font-size: 19px;
	position: relative;
	top: 2px;
}

table.table {
	table-layout: fixed;
	margin-top: 15px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table th:first-child {
	width: 75px;
}

table.table th:last-child {
	width: 200px;
}

table.table td a {
	color: #a0a5b1;
	display: inline-block;
	margin: 0 5px;
}

table.table td a.view {
	color: #03A9F4;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>${users.uName}
							<b>의 주문리스트 입니다.</b>
						</h2>
					</div>
					<div class="col-sm-6">
						<div class="search-box">
							<div class="input-group">
								<a href="home_link" class="btn btn-primary">홈으로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th style="width: 22%;">음식점 이름</th>
						<th style="width: 22%;">주문 리스트</th>
						<th>가격</th>
						<th>주문 시간</th>
						<th>후기</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty order_list}">
						<c:forEach var="list" items="${order_list}">
							<tr>
								<c:if test="${list.deliChk eq 0}">
									<td>방문포장</td>
								</c:if>
								<c:if test="${list.deliChk eq 1}">
									<td>배달주문</td>
								</c:if>
								<td><a href="restaurant_detail?rno=${list.orderRNum}">${list.orderRName}</a></td>
								<td>${list.orderListName}</td>
								<td>${list.totalPrice}</td>
								<td>${list.oDate}</td>
								<c:if test="${list.comment_chk eq 0}">
									<td><a
										href="commentWrite?rno=${list.orderRNum}&ono=${list.oNum}&order_str=${list.orderListName}"
										class="edit" title="Edit" data-toggle="tooltip"><i
											class="material-icons">&#xE254;</i></a></td>
								</c:if>
								<c:if test="${list.comment_chk ne 0}">
									<td><span>이미 후기를 남기셨습니다.</span></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>