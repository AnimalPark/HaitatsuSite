<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true"%>
<?xml version="1.0" encoding="utf-8" ?>


<comments> 
		<result>${result}</result>
		<message>${message}</message>
		<item> 
			<commnum>${recentComment.commnum}</commnum> 
			<rnum>${recentComment.rnum}</rnum> 
			<userid>${recentComment.userid}</userid> 
			<commcontents>${recentComment.commcontents}</commcontents>
			<star>${recentComment.star}</star> 
			<commaddr>${recentComment.commaddr}</commaddr>
			<order_str>${recentComment.order_str}</order_str>
		</item>
</comments>