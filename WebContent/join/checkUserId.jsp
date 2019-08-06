<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:useBean id="UsersDAOImpl" class="dao.UsersDAOImpl"/>

<% request.setCharacterEncoding("utf-8"); %>
<% String userId = request.getParameter("userId"); %>
<% boolean result = UsersDAOImpl.check_userId(userId); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>아이디 중복 검사</title>
</head>
<body>
<b><%=userId %></b>
<%
	if(result){
%>
		는(은) 이미 사용중인 아이디입니다.<p/>
		<a href="#" onclick = "opener.document.join.userId.focus(); window.close();">닫기</a>
		<!-- opener : window.open으로 현재 창을 호출한 부모 페이지 -->
<%
	}
	else
	{
%>
		는(은) 사용 가능한 아이디입니다.<p/>
		<a href="#" onclick = "opener.document.join.pass.focus(); window.close();">닫기</a>
<%
	}
%>
</body>
</html>