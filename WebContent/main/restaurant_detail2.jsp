<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
<script type="text/x-jquery-tmpl" id="itemTemplate">
	<ul data_num = "{{= commnum}}" class = "comment_item">
		<li> 작성자: <span class="writer_user">{{= userid}}</span>
		작성 시간: <span class="date">{{= commaddr}}</span>
		</li>
		<li> 주문리스트: <span class="order_str">{{= order_str}}</span>	
		<li>평점: 
			{{if star == 1}}
				<img src="img/score_one.jpg" width="80" height="20">
			{{/if}}
			{{if star == 2}}
				<img src="img/score_two.jpg" width="80" height="20">
			{{/if}}
			{{if star == 3}}
				<img src="img/score_three.jpg" width="80" height="20">
			{{/if}}
			{{if star == 4}}
				<img src="img/score_four.jpg" width="80" height="20">
			{{/if}}
			{{if star == 5}}
				<img src="img/score_five.jpg" width="80" height="20">
			{{/if}}
		</li>		
		<li>내용: 
			<span class="contents">{{= commcontents}}</span>
		</li>
		
		
		{{if chk == true}}
		<li>
			<input type="button" value="삭제" class = "delete_btn" />
		</li>
		{{/if}}
	<hr />
	</ul>
	</script>
<script type="text/javascript">
	function addNewItem(commnum, userid, commcontents, star, commaddr, chk, order_str) {
		var li_data = {
			"commnum" : commnum,
			"userid" : userid,
			"commcontents" : commcontents,
			"star" : star,
			"commaddr" : commaddr,
			"chk" : chk,
			"order_str" : order_str
		};
		var new_li = $("#itemTemplate").tmpl(li_data);
		$("#comment_list").prepend(new_li);
	}

	$(function() {
		$.get("comment_list", {}, function(data) {
			$(data).find("comment").each(function() {
				var commnum = $(this).find("commnum").text();
				var userid = $(this).find("userid").text();
				var commcontents = $(this).find("commcontents").text();
				var star = $(this).find("star").text();
				var commaddr = $(this).find("commaddr").text();
				var order_str = $(this).find("order_str").text();
				var loginid = $("#user_name").val();
				var chk = false;
				
				if(userid == loginid){
					chk = true;
				}
				
				addNewItem(commnum, userid, commcontents, star, commaddr, chk,order_str);
			});
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주십시오.")
		});

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
				var result = $(xml).find("result").text();
				var message = $(xml).find("message").text();

				if (result) {
					alert(message);
					var commnum = $(xml).find("commnum").text();
					var userid = $(xml).find("userid").text();
					var commcontents = $(xml).find("commcontents").text();
					var star = $(xml).find("star").text();
					var commaddr = $(xml).find("commaddr").text();
					var loginid = $("#user_name").val();
					var chk = false;
					
					if(userid == loginid){
						chk = true;
					}
					alert(chk);
					addNewItem(commnum, userid, commcontents, star, commaddr, chk);

					$("#comment").val("");
				} else {
					alert(message);
				}
			}).fail(function() {
				alert("실패");
			});
			return false
		});

		$(document).on('click', '.delete_btn', function() {
			if (confirm("정말로 선택하신 댓글을 삭제하시겠습니까?")) {
				var num = $(this).parent().parent().attr("data_num");
				var target = $(this).parents(".comment_item");//$(this).find("num").text();
				target.remove();

				$.post("deleteComment", {
					"commnum" : num
				}, function(xml) {

				}).fail(function() {
					alert("삭제 실패");
				});
			}
		});
	});
</script>
<script>
	$(function() {
		$("#order_click1").click(function() {

			order_start1();

			function order_start1() {
				delivery = 1;

				url = "confirm_orders";
				$.get(url, {
					"delichk" : delivery
				}, function() {
					location.href = "order_final";
					return false;
				});
			}
		});
		$("#order_click2").click(function() {
			order_start2();

			function order_start2() {
				delivery = 0;

				url = "confirm_orders";
				$.get(url, {
					"delichk" : delivery
				}, function() {
					location.href = "order_final";
					return false;
				});
			}
			;
		});
		$("#change1").click(function() {
			mode_change1();

			function mode_change1() {

				location.href = "menu_mode";
				return false;
			}
			;
		});
		$("#change2").click(function() {
			mode_change2();

			function mode_change2() {
				location.href = "comment_mode";
				return false;
			}
			;
		});
	});
</script>

<meta charset="utf-8">

</head>
<body>
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
	<div class="container">
		<br /> <br /> <span>${detailR.rNum}</span> <span>${detailR.rName}</span>
		<span>${detailR.cNum}</span> <span><fmt:formatNumber value = "${detailR.starAvg}" pattern = ".0"/></span> <span>${detailR.townNum}</span>
		<span>${detailR.rAddr}</span> <span>${detailR.rPhoneNum}</span>
		<hr />

		<div style="width: 500px; height: 500px; float: left; margin-right: 10px;">
			<input type="button" value="메뉴" class="btn btn-secondary"
				id="change1"> <input type="button" value="댓글"
				class="btn btn-primary" id="change2">


			<div class="container mt-3">
				<h3>후기</h3>
			</div>

			<form id="comment_form">

				<input type="hidden" name="user_name" id="user_name" value="${users.userId}" />
			</form>
			<ul id="comment_list">
				<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
			</ul>
		</div>
		<div style="width: 500px; height: 500px; float: left;">

			<c:if test="${!empty order_lists}">
				<p>=============장바구니============</p>
				<c:forEach var="o_list" items="${order_lists}">
					<span>메뉴 : ${o_list.mName}</span>
					<span>${o_list.count} 개</span>
					<span>->${o_list.price}원</span>
					<br />
				</c:forEach>
				<p>--------------------------------------------------------</p>
				<span>총 ${total_price}원</span>
				<br />
				<span>=================================</span>
				<br />
				<input type="button" value="배달(+2000)" id="order_click1">
				<input type="button" value="방문포장" id="order_click2">
			</c:if>
		</div>
	</div>

</body>
</html>