<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<a href="home_link">홈화면</a><br />
	<c:if test="${!empty order_list}">

		<c:forEach var="list" items="${order_list}">

			<span>${list.oNum} // ${list.userId} // ${list.oDate}</span><br />
			<span>${list.deliChk} // ${list.orderRName} //${list.orderListName} //${list.totalPrice}</span>
			<a href="restaurant_detail?rno=${list.orderRNum}">해당 가게에서 다시 주문하기</a>
			<c:if test = "${list.comment_chk eq 0}">
				<a href="commentWrite?rno=${list.orderRNum}&ono=${list.oNum}&order_str=${list.orderListName}">후기 남기기</a>	
			</c:if>
			<c:if test = "${list.comment_chk ne 0}">
				<span>이미 후기를 작성하셨습니다.</span>
			</c:if>
			<hr />
		</c:forEach>

	</c:if>
</body>
</html>