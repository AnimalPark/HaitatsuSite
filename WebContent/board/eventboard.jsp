<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<table data-text-content="true" class="table_board" spellcheck="false">
		<tbody>
			<tr>
				<th>No.</th>
				<th>Name</th>
				<th>Value</th>
			</tr>
			<c:forEach var="ybbsList" items="${ybbsList}">
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>