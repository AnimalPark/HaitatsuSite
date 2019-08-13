<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var citylist = new Array('영등포구', '마포구','용산구');
	var townlist = new Array();
	townlist[0] = new Array('양산로','영신로','노들로');
	townlist[1] = new Array('와우산로','월드컵로');
	townlist[2] = new Array('회나무로','이태원로');
	
	function init(f) {
		var city_sel = f.selectCity;
		var town_sel = f.selectTown;

		city_sel.options[0] = new Option("전체", "");
		town_sel.options[0] = new Option("전체", "");

		for (var i = 0; i < citylist.length; i++) {
			city_sel.options[i + 1] = new Option(citylist[i], citylist[i]);
		}
		var userCity = '${userCity}';
		var index = -1;
		for (var i = 0; i < citylist.length; i++) {
			if(citylist[i] == userCity)
				index = i+1;
		}	
		$("#selectCity option:eq("+index+")").prop("selected", true);
		
		itemChange(f);
	}

	function itemChange(f) {
		var city_sel = f.selectCity;

		var town_sel = f.selectTown;

		var selectedCity = city_sel.selectedIndex;
		
		for (var i = town_sel.length; i >= 0; i--) {
			town_sel.options[i] = null;
		}

		town_sel.options[0] = new Option("전체", "")
		if (selectedCity != 0) {
			for (var i = 0; i < townlist[selectedCity - 1].length; i++) {
				town_sel.options[i + 1] = new Option(
						townlist[selectedCity - 1][i],
						townlist[selectedCity - 1][i]);
			}
		}
		var userTown = '${userTown}';
		var index = -1;
		for (var i = 0; i < townlist[selectedCity - 1].length; i++) {
			if(townlist[selectedCity - 1][i] == userTown){
				index = i + 1;
			}
		}
		$("#selectTown option:eq("+index+")").prop("selected", true);
	}
</script>
<meta charset="utf-8">
</head>
<body onload="init(this.form);">

	<c:if test="${users == null}">
		<a href="login_link">로그인</a>
		<a href="join_link">회원가입</a>
	</c:if>
	<c:if test="${users != null}">
		<form action="user_logout">
			<a href="logout_link">로그아웃</a>
		</form>
		<a href="myPage_link">마이페이지</a>
	</c:if>

	<a href="home_link">홈화면</a>
	<a href="qa_board_link">Q/A 게시판</a>
	<a href="ybbs_eventlist">이벤트 게시판</a>

	<br />
	<br />
	<input type="button" class="button button1" value="한식"
		onclick="category1()">
	<input type="button" class="button button1" value="중식"
		onclick="category2()">
	<input type="button" class="button button1" value="일식"
		onclick="category3()">
	<input type="button" class="button button1" value="피자"
		onclick="category4()">
	<input type="button" class="button button1" value="치킨"
		onclick="category5()">
	<input type="button" class="button button1" value="분식"
		onclick="category6()">
	<input type="button" class="button button1" value="족발"
		onclick="category7()">
	<input type="button" class="button button1" value="간식"
		onclick="category8()">
	<br />
	<form method="post" name="form" action="addr_search?catego=${categ}">
		<select id="selectCity" name="selectCity" onchange="itemChange(this.form);"></select> 
		<select id="selectTown" name="selectTown"></select> 
		<input type="submit" name="Commit" value="검색" />
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

	<script>
		function category1() {
			location.href = "search_link?category=1";
			return false;
		}
		function category2() {
			location.href = "search_link?category=2";
			return false;
		}
		function category3() {
			location.href = "search_link?category=3";
			return false;
		}
		function category4() {
			location.href = "search_link?category=4";
			return false;
		}
		function category5() {
			location.href = "search_link?category=5";
			return false;
		}
		function category6() {
			location.href = "search_link?category=6";
			return false;
		}
		function category7() {
			location.href = "search_link?category=7";
			return false;
		}
		function category8() {
			location.href = "search_link?category=8";
			return false;
		}
	</script>
</body>
</html>