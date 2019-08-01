<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var f_selbox = new Array('1', '2', '3', '4');

	var s_selbox = new Array();
	s_selbox[0] = new Array('1-1', '1-2', '1-3', '1-4', '1-5');
	s_selbox[1] = new Array('2-1', '2-2', '2-3', '2-4', '2-5');
	s_selbox[2] = new Array('3-1', '3-2', '3-3', '3-4', '3-5');
	s_selbox[3] = new Array('4-1', '4-2', '4-3', '4-4', '4-5');

	function init(f) {
		var f_sel = f.first;
		var s_sel = f.second;

		f_sel.options[0] = new Option("선택", "");
		s_sel.options[0] = new Option("선택", "");

		for (var i = 0; i < f_selbox.length; i++) {
			f_sel.options[i + 1] = new Option(f_selbox[i], f_selbox[i]);
		}
	}

	function itemChange(f) {
		var f_sel = f.first;
		var s_sel = f.second;

		var sel = f_sel.selectedIndex;
		for (var i = s_sel.length; i >= 0; i--) {
			s_sel.options[i] = null;
		}

		s_sel.options[0] = new Option("선택", "")
		if (sel != 0) {
			for (var i = 0; i < s_selbox[sel - 1].length; i++) {
				s_sel.options[i + 1] = new Option(s_selbox[sel - 1][i],
						s_selbox[sel - 1][i]);
			}
		}
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#checkid").click(function() {
			var input_val = $("#id").val();
			if (!input_val) {
				alert("아이디를 입력하세요");
				return false;
			}

			var url = "idcheck";
			$.get(url, {"id" : input_val}, function(xml) {
				var result = $(xml).find("result").text();
				$(".console").html(result);
			});
		});
	});
</script>

<meta charset="utf-8">
</head>
<body onload="init(this.form);">
	
	<form name="form">
		${msg}
		<select id="first" onchange="itemChange(this.form);"></select> <select
			id="second"></select>
	</form>
		<h1>아이디 중복검사</h1>
	<form action="idcheck">
		<input type="text" name="id" id="id" /> <input type="button"
			id="checkid" value="중복검사" />
	</form>
	<div class="console"></div>
	<p>${msgs}<p>
	<p1>미구현입니다.</p1>
</body>
</html>