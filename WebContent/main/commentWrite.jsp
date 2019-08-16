<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#comment_form").submit(function() {
			if (!$("#user_name").val()) {
				alert("입력하세요");
				return false;
			}

			if (!$("#comment").val()) {
				alert("내용을 입력하세요");
				return false;
			}

			$.post("comment_add", $(this).serialize(), function(xml) {
				location.href = "user_orderlist";
				
			}).fail(function() {
				alert("실패");
			});
			return false
		});
	});
</script>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:30px;padding:10px;line-height:20px;}
.star-input>.input{display:inline-block;width:100px;background-size:100px;height:18px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:18px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 100px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:20px;z-index:5;}
.star-input>.input>label[for="p2"]{width:40px;z-index:4;}
.star-input>.input>label[for="p3"]{width:60px;z-index:3;}
.star-input>.input>label[for="p4"]{width:80px;z-index:2;}
.star-input>.input>label[for="p5"]{width:100px;z-index:1;}
.star-input>output{display:inline-block;width:40px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<h3>후기 남기기</h3>
	</div>
	<form id="comment_form">
		<input type="hidden" name="rn" id="rn" value="${rnum}" /> 
		<input type="hidden" name="on" id="on" value="${onum}" /> 
		<input type="hidden" name="order_string" id="order_string" value="${order_str}"/>
		<input type="hidden" name="userid" id="userid" value="${users.userId}" />  
		<label for="user_name">작성자</label> 
		<input type="text" name="user_name" id="user_name" value="${users.userId}" disabled="disabled" /> 
		<br />
		
		<span class="star-input">
			<span class="input">
		    	<input type="radio" name="star-input" value="1" id="p1">
		    	<label for="p1">1</label>
		    	<input type="radio" name="star-input" value="2" id="p2">
		    	<label for="p2">2</label>
		    	<input type="radio" name="star-input" value="3" id="p3">
		    	<label for="p3">3</label>
		    	<input type="radio" name="star-input" value="4" id="p4">
		    	<label for="p4">4</label>
		    	<input type="radio" name="star-input" value="5" id="p5">
		    	<label for="p5">5</label>
	  		</span>
	  		<output for="star-input"><b>0</b>점</output>						
		</span><br />
		<label for="comment">덧글 내용</label><br />
		<textarea name="comment" id="comment"></textarea>
		<input type="submit" value="저장하기" />
	</form>
	${onum}${order_str}
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/star.js"></script>
</body>
</html>