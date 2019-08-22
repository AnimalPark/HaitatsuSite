<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>안녕하세요</title>
<style type="text/css">
a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	text-decoration: none;
	color: #333333;
}

a:active {
	text-decoration: none;
	color: #333333;
}

a:hover {
	text-d "WebContent/board/qaboardDetail.jsp"ecoration: underline;
	color: red;
}

body {
	color: #333;
	background: #fafafa;
	font-family: "Patua One", sans-serif;
}

.contact-form {
	padding: 20px;
	margin: 15px 0;
}

.contact-form h3 {
	color: #6dc97e;
	font-weight: bold;
	margin: 0 0 5px;
}

.contact-form .form-control, .contact-form .btn {
	min-height: 38px;
	border-radius: 2px;
}

.contact-form .form-control:focus {
	border-color: #6dc97e;
}

.contact-form .btn-primary {
	color: #fff;
	min-width: 150px;
	font-size: 16px;
	background: #6dc97e;
	border: none;
}

.contact-form .btn-primary:hover {
	background: #15a487;
}

.contact-form label {
	opacity: 0.7;
}

.contact-form textarea {
	resize: none;
}

.hint-text {
	font-size: 15px;
	padding-bottom: 20px;
	opacity: 0.6;
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

.container input[readonly] {
	background-color: white !important;
}

.container textarea[readonly] {
	background-color: white !important;
}
</style>
<script type="text/javascript">
	function delchk() {
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
						<li><a href="ybbs_QaList?reqPage=1">Q/A 게시판</a></li>
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
	<c:if test="${ybbs.userId == users.userId || users.authority eq 1}">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 m-auto">
					<div class="contact-form">
						<div class="container">
							<h3>Q/A 게시글</h3>
							<br />
							<form action="ybbs_goTo_update" method="post"
								style="display: inline;">
								<input type="hidden" name="qaNumber" value="${ybbs.qaNumber}" />
								<input type="hidden" name="qaGroup" value="${ybbs.qaGroup}" />
								<div class="form-group">
									<label for="inputName">작성자</label> <input type="text"
										class="form-control" id="inputName" name="userId"
										value="${ybbs.userId}" readonly style="width: 30%" />
								</div>
								<div class="form-group">
									<label for="inputSubject">제목</label> <input type="text"
										class="form-control" id="inputSubject" name="qaSubject"
										value="${ybbs.qaSubject}" style="width: 75%" readonly />
								</div>
								<div class="form-group">
									<label for="inputMessage">내용</label>
									<textarea class="form-control" id="inputMessage"
										name="qaComment" rows="20" style="width: 75%" readonly>${ybbs.qaComment}</textarea>
								</div>
								<button class="btn btn-primary"
									style="margin: 4px; min-width: 50px;">글 수정</button>
							</form>
							<a href="ybbs_delete?qaGroup=${ybbs.qaGroup}"
								onclick="return delchk();"><button class="btn btn-primary"
									style="margin: 4px; min-width: 50px;">글 삭제</button></a> <a
								href="ybbs_QaList?reqPage=1"><button class="btn btn-primary"
									style="margin: 4px; min-width: 50px;">목록으로</button></a>
							<c:if test="${users.authority eq 1 && ybbs.qaLevel != 1}">
								<a href="ybbs_reply_form.ad?qaNumber=${ybbs.qaNumber}"><button
										class="btn btn-primary" style="margin: 4px; min-width: 50px;">답변작성</button></a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if
		test="${ybbs.userId != users.userId && ybbs_id != users.userId && users.authority != 1}">
		<div class="form-group">
			<textarea class="form-control" rows="10"
				style="width: 100%; text-align: center;" readonly>글 작성자만 읽을 수 있습니다</textarea>
		</div>
		<a href="ybbs_QaList?reqPage=1"><button class="btn btn-primary"
				style="margin: 4px; text-align: center;">목록으로</button></a>
	</c:if>
	<c:if test="${ybbs_id == users.userId && ybbs.userId != users.userId }">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 m-auto">
					<div class="contact-form">
						<div class="container">
							<h1>QA 게시글</h1>
							<br />
							<div class="form-group">
								<label for="inputName">작성자</label> <input type="text"
									class="form-control" id="inputName" name="userId"
									value="${ybbs.userId}" readonly style="width: 30%" />
							</div>
							<div class="form-group">
								<label for="inputSubject">제목</label> <input type="text"
									class="form-control" id="inputSubject" name="qaSubject"
									value="${ybbs.qaSubject}" readonly />
							</div>
							<div class="form-group">
								<label for="inputMessage">내용</label>
								<textarea class="form-control" id="inputMessage"
									name="qaComment" rows="20" style="width: 100%" readonly>${ybbs.qaComment}</textarea>
							</div>
							<a href="ybbs_goTo_update?qaNumber=${ybbs.qaNumber}"><button
									class="btn btn-primary" style="margin: 4px; min-width: 50px;">글
									수정</button></a> <a href="ybbs_delete_reply?qaNumber=${ybbsList.qaNumber}"
								onclick="return delchk();"><button class="btn btn-primary"
									style="margin: 4px; min-width: 50px;">글 삭제</button></a> <a
								href="ybbs_QaList?reqPage=1"><button class="btn btn-primary"
									style="margin: 4px; min-width: 50px;">목록으로</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="ybbs_QaList?reqPage=1"><button class="btn btn-primary"
				style="margin: 4px; min-width: 50px;">목록으로</button></a>
	</c:if>
</body>
</html>