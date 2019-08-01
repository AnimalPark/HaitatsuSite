<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta content="utf-8">
<title>멤 버 수 정 창</title>
<meta charset="utf-8">

</head>
<body>
	<a href="login_link">로그인</a>
	<a href="sign_link">회원가입</a>
	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="ybbs_eventlist">이벤트 게시판</a>

	<br />
	<br />
	<p>${detailR.rNum}</p>
	<p>${detailR.cNum}</p>
	<p>${detailR.starAvg}</p>
	<p>${detailR.townNum}</p>
	<p>${detailR.rNum}</p>
	<p>${detailR.rAddr}</p>
	<p>${detailR.rPhoneNum}</p>

		<a href="member_return">리스트로 돌아가기</a>
		<form method="post" action="member_update?memno=${mem.memno}">
			Memno: <input type="text" class="form-control"
				placeholder="Memno을 입력하세요." name="memno" value="${mem.memno}"
				disabled="disabled" /><br /> Id: <input type="text"
				class="form-control" placeholder="Id을 입력하세요." name="id"
				value="${mem.id}" /><br /> Pwd: <input type="password"
				class="form-control" placeholder="Pwd을 입력하세요." name="pwd"
				value="${mem.pwd}" /><br /> Name: <input type="text"
				class="form-control" placeholder="이름을 입력하세요." name="name"
				value="${mem.name}" /><br /> Gender: <input type="text"
				class="form-control" placeholder="Gender 입력하세요." name="gender"
				value="${mem.gender}" /><br /> Birth: <input type="text"
				class="form-control" placeholder="Birth 입력하세요." name="birth"
				value="${mem.birth}" /><br /> <input type="submit"
				class="btn btn-primary" name="Commit" />
		</form>
		<a href="member_delete?memno=${mem.memno}">삭제</a>
</body>
</html>