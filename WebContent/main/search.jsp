<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var citylist = new Array('영등포구', '동해시');
	var townlist = new Array();
	townlist[0] = new Array('영신로');
	townlist[1] = new Array('천곡동');

	function init(f) {
		var city_sel = f.selectCity;
		var town_sel = f.selectTown;

		city_sel.options[0] = new Option("선택", "");
		town_sel.options[0] = new Option("선택", "");

		for (var i = 0; i < citylist.length; i++) {
			city_sel.options[i + 1] = new Option(citylist[i], citylist[i]);
		}
	}

	function itemChange(f) {
		var city_sel = f.selectCity;
		var town_sel = f.selectTown;

		var selectedCity = city_sel.selectedIndex;
		for (var i = town_sel.length; i >= 0; i--) {
			town_sel.options[i] = null;
		}

		town_sel.options[0] = new Option("선택", "")
		if (selectedCity != 0) {
			for (var i = 0; i < townlist[selectedCity - 1].length; i++) {
				town_sel.options[i + 1] = new Option(
						townlist[selectedCity - 1][i],
						townlist[selectedCity - 1][i]);
			}
		}
	}
</script>
<meta charset="utf-8">
</head>
<body onload="init(this.form);">

	<a href="login_link">로그인</a>
	<a href="sign_link">회원가입</a>
	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="ybbs_eventlist">이벤트 게시판</a>

	<br />
	<br />

	<form method="post" name="form" action="addr_search?catego=${categ}">
		<select id="selectCity" name="selectCity"
			onchange="itemChange(this.form);"></select> <select id="selectTown"
			name="selectTown"></select> <input type="submit" name="Commit"
			value="검색" />
	</form>
	<c:if test="${!empty lists}">
		<table>
			<tr>
				<td>rName</td>
				<td>cNum</td>
				<td>starAvg</td>
				<td>rNum</td>
			</tr>
			<c:forEach var="list" items="${lists}">
				<tr>
					<td>${list.rName}</td>
					<td>${list.cNum}</td>
					<td>${list.starAvg}</td>
					<td><a href="restaurant_detail?rno=${list.rNum}">${list.rNum}</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>