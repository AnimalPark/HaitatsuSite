<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>안녕하세요</title>
<style>
div {
	border: 1px solid #bcbcbc;
	width : 10%
}

</style>
</head>
<body>
	<h2>상세보기</h2>
	<c:if test="${ybbs.id == member.id}">
		<form action="ybbs_update.do" method="post">
			<div>작성자 :${ybbs.id}</div>
			<input type="hidden"  name="no" value="${ybbs.no}"/><br />
			<input type="text"  name="subject" value="${ybbs.subject}" /><br />
			<input type="text"  name="content" value="${ybbs.content}" /><br />
			<input type="submit" class="btn btn-primary" value="수정">
		</form>
			<a href="ybbs_delete.do?no=${ybbs.no}">삭제</a><br />
			<a href="ybbs_list">뒤로가기</a>	
	</c:if>
	
	<c:if test="${ybbs.id != member.id}">
		
	<form action="ybbs_reply_form.do" method="post">
		<div>작성자 :${ybbs.id}</div>
		
		<input type="hidden"  name="no" value="${ybbs.no}"/><br />
		<input type="text"  name="subject" value="${ybbs.subject}" disabled="disabled"/><br />
		<input type="text"  name="content" value="${ybbs.content}" disabled="disabled"/><br />
		
		<a href="ybbs_req_list?reqPage=1">페이징처리된 뒤로가기ㅎ</a>
		<c:if test="${member.id != null}">
			<input type="submit" class="btn btn-primary" value="응답쓰러가기">
		</c:if>
	
	 </form>
	
	</c:if>

</body>
</html>