<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<?xml version="1.0" encoding="utf-8" ?>


<comments> 
	<c:forEach var="comment" items="${comments}">
		<comment> 
			<commnum>${comment.commnum}</commnum> 
			<rnum>${comment.rnum}</rnum> 
			<userid>${comment.userid}</userid> 
			<commcontents>${comment.commcontents}</commcontents>
			<star>${comment.star}</star> 
			<commaddr>${comment.commaddr}</commaddr> 
			<order_str>${comment.order_str}</order_str>
		</comment>
	</c:forEach> 
</comments>