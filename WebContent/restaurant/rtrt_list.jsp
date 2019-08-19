<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Table with Search Column Feature</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
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
        width: 60px;
    }
    table.table th:last-child {
        width: 120px;
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
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltips
	$('[data-toggle="tooltip"]').tooltip();
    
	// Filter table rows based on searched term
    $("#search").on("keyup", function() {
        var term = $(this).val().toLowerCase();
        $("table tbody tr").each(function(){
            $row = $(this);
            var name = $row.find("td:nth-child(2)").text().toLowerCase();
            console.log(name);
            if(name.search(term) < 0){                
                $row.hide();
            } else{
                $row.show();
            }
        });
    });
});
</script>
</head>
<body>
    <div class="container">
        <div class="table-wrapper">			
            <div class="table-title">
                <div class="row">
					<div class="col-sm-6">
						<h2>가게 <b>리스트</b></h2>
					</div>
                    <div class="col-sm-6">
                        <div class="search-box">
							<div class="input-group">
							<form action="admin_rtrt_search" method="post">								
								<input type="text" name="rName" id="search" class="form-control" placeholder="가게 이름 검색...">
                                <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                             </form>
							</div>
                        </div>
                    </div>
                    <c:if test="${empty restaurant}">
			<hr />
			검색된 결과가 존재하지 않습니다
			<hr />
			</c:if>
			<c:if test="${!empty restaurant}"></c:if>
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th style="width: 22%;">가게이름</th>
                        <th>전화번호</th>
                        <th>평균별점</th>
                        <th>주소</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                
                <tbody>
                <c:forEach var="restaurant" items="${restaurant}">    
			<tr>
				<td><a href="admin_rtrt_detail?rNum=${restaurant.rNum}">${restaurant.rName}</a></td>
				<td>${restaurant.rPhoneNum}</td>
				<td>${restaurant.starAvg}</td>
				<td>${restaurant.rAddr}</td>
                        <td>
                            <a href="#" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                </c:forEach>            
                </tbody>
            </table>
            <button type="button" onclick="location.href='index.jsp'" >처음화면으로</button>
   	 	<button type="button" onclick="location.href='restaurant_add'">가게 정보 추가</button>
        </div>
    </div>     
<%-- ////////////////////////////////////////////////
	<c:if test="${users.authority eq 1}">
	<h1>${users.userId}관리자 계정으로 로그인됨</h1>
	</c:if>
		<h3>Restaurant List</h3>
	
		<form action="admin_rtrt_search" method="post">
			<input type="text" name="rName" placeholder="가게 이름 검색...">
			<input type="submit" value="검색">
		</form>
			
		<c:if test="${empty restaurant}">
			<hr />
			검색된 결과가 존재하지 않습니다
			<hr />
		</c:if>
		<c:if test="${!empty restaurant}"></c:if>
		
		<table>
			<thead>
				<tr>
					<td>가게이름</td>
					
					<td>/  전화번호</td>
					
					<td>/  평균별점</td>
					
					<td>/  주소</td>
				</tr>
			</thead>
				
		<c:forEach var="restaurant" items="${restaurant}">
			<tr>
				<td><a href="admin_rtrt_detail?rNum=${restaurant.rNum}">${restaurant.rName}</a></td>
				<td>${restaurant.rPhoneNum}</td>
				<td>${restaurant.starAvg}</td>
				<td>${restaurant.rAddr}</td>
			</tr>	
		</c:forEach>
		</table>

   		<button type="button" onclick="location.href='index.jsp'" >처음화면으로</button>
   		<c:if test="${users.authority eq 1}">
   	 	<button type="button" onclick="location.href='restaurant_add'">가게 정보 추가</button>
		</c:if> --%>
	</body>
</html>