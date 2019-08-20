<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트 게시판</title>
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
		margin: 0 auto;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px 53px 25px;
        margin: 30px auto;
		border-radius: 3px;
        box-shadow: 0 3px 5px rgba(0,0,0,.05);
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
    table.table {
        table-layout: fixed;
        margin-top: 15px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
    }
    table.table th i {
        font-size: 15px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table th:first-child {
        width: 100px;
    }
    table.table th:nth-child(2) {
        width: 350px;
    }
    table.table th:nth-child(3) {
        width: 150px;
    }
    table.table th:last-child {
        width: 60px;
    }
    table.table td a {
        color: #08298A;
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
    .navbar-header.col {
	padding: 0 !important;
}

.navbar {
	font-size: 12px;
	background: #fff;
	padding-left: 16px;
	padding-right: 16px;
	border-bottom: 1px solid #d6d6d6;
	box-shadow: 0 0 4px rgba(0, 0, 0, .1);
}

.navbar .navbar-brand {
	color: #555;
	padding-left: 0;
	font-size: 20px;
	padding-right: 50px;
	font-family: 'Raleway', sans-serif;
	text-transform: uppercase;
}

.navbar .navbar-brand b {
	font-weight: bold;
	color: #f04f01;
}

.navbar ul.nav li {
	font-size: 96%;
	font-weight: bold;
	text-transform: uppercase;
}

.navbar ul.nav li.active a, .navbar ul.nav li.active a:hover, .navbar ul.nav li.active a:focus
	{
	color: #f04f01 !important;
	background: transparent !important;
}

.navbar .nav-item i {
	font-size: 18px;
	navbar-form: pull-right;
}

.navbar .dropdown-item i {
	font-size: 16px;
	min-width: 22px;
}

.navbar .nav-item.open>a {
	background: none !important;
}

.navbar .dropdown-menu {
	border-radius: 1px;
	border-color: #e5e5e5;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .05);
}

.navbar .dropdown-menu li a {
	color: #777;
	padding: 8px 20px;
	line-height: normal;
	font-size: 14px;
}

.navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:active {
	color: #333;
}
.navbar .navbar-form {
	border: none;
	justify-content-end;
}
</style>
<script type="text/javascript">
function delchk(){
		return confirm("글 삭제시 복구가 불가능합니다.");
}
</script>
</head>
<body>
<nav class="navbar navbar-default navbar-expand-lg navbar-light">
		<div class="navbar-header d-flex col">
			<a class="navbar-brand" href="index.jsp">Haitatsu<b>Site</b></a>
		</div>
		<div id="navbarCollapse"
			class="collapse navbar-collapse justify-content-start">
			<ul class="nav navbar-nav">
				<c:if test="${users.authority eq 1}">
					<li class="nav-item"><a href="admin_home_link"
						class="nav-link">관리자 화면으로</a></li>
				</c:if>
				<c:if test="${users == null}">
					<li class="nav-item"><a href="login_index_link"
						class="nav-link">로그인</a></li>
					<li class="nav-item"><a href="join_link" class="nav-link">회원가입</a></li>
				</c:if>
				<li class="nav-item dropdown"><a data-toggle="dropdown"
					class="nav-link dropdown-toggle" href="#">게시판 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="ybbs_eventList?reqPage=1">이벤트 게시판</a></li>
						<li><a href="ybbs_req_list?reqPage=1">Q/A 게시판</a></li>
					</ul></li>
				<c:if test="${users != null}">
					<li class="nav-item"><a href="user_logout" class="nav-link">로그아웃</a></li>

					<li class="nav-item dropdown"><a data-toggle="dropdown"
						class="nav-link dropdown-toggle" href="myPage_link">마이페이지 <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">주문내역</a></li>
							<li><a href="#">개인정보 수정</a></li>
							<li><a href="#">비밀번호 변경</a></li>
						</ul>
				</c:if>
			</ul>
		</div>
	</nav>
<br />
	<div class="container">
        <div class="table-wrapper">			
            <div class="table-title">
                <div class="row">
					<div class="col-sm-6">
						<h2>이벤트 게시판 <b>목록</b></h2>
					</div>
                    <div class="col-sm-6">	
                    </div>
                </div>
            </div>
            <table class="table table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회</th>
		</tr>
	</thead>	
			<c:forEach var="ybbsList" items="${ybbsList}">
			<tbody>
				<tr>
					<td>${ybbsList.evNumber}</td>
					<td><a href="ybbs_eventDetail.do?evNumber=${ybbsList.evNumber}">${ybbsList.evSubject}</a></td>
					<td>${ybbsList.evDate}</td>
					<td>${ybbsList.evVisited}</td>
				</tr>
			</tbody>
			</c:forEach>
	</table>
	<c:if test="${users.authority eq 1}">
		<a href="ybbs_go_to_insert_event.ad">글쓰기</a>
	</c:if>
</div>
</div>	
	
<div class="text-center">
  <ul class="pagination justify-content-center">
    		<c:if test="${pageGroupResult.beforePage}">
    			<li class="page-item">
    				<a class="page-link" href="ybbs_eventList?reqPage=${pageGroupResult.groupStartNumber-1}">
    				<i class="fa fa-long-arrow-left"></i>Previous</a>
    			</li>
    		</c:if>
  			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>	
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
   						 <li class="page-item active"><a class="page-link" href="ybbs_eventList?reqPage=${index}">${index}</a></li>
    				</c:when>
					<c:otherwise>
				  	  <li class="page-item"><a class="page-link" href="ybbs_eventList?reqPage=${index}">${index}</a></li>
					</c:otherwise>		 
 				</c:choose>
		</c:forEach>
		 <c:if test="${pageGroupResult.afterPage}">
		 	<li class="page-item"><a class="page-link" href="ybbs_eventList?reqPage=${pageGroupResult.groupEndNumber+1}">
			Next<i class="fa fa-long-arrow-right"></i></a></li>
		 </c:if>
		</ul>
	</div>
</body>
</html>