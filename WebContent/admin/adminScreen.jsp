<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Multiple Item Product Carousel</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}
h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	margin: 30px 0 60px;
}
h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	border-radius: 1px;
	background: #7ac400;
	left: 0;
	right: 0;
	bottom: -20px;
}
.carousel {
	margin: 50px auto;
	padding: 0 70px;
}
.carousel .item {
	color: #747d89;
	min-height: 325px;
    text-align: center;
	overflow: hidden;
}
.carousel .thumb-wrapper {
	padding: 25px 15px;
	background: #fff;
	border-radius: 6px;
	text-align: center;
	position: relative;
	box-shadow: 0 2px 3px rgba(0,0,0,0.2);
}
.carousel .item .img-box {
	height: 120px;
	margin-bottom: 20px;
	width: 100%;
	position: relative;
}
.carousel .item img {	
	max-width: 100%;
	max-height: 100%;
	display: inline-block;
	position: absolute;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}
.carousel .item h4 {
	font-size: 18px;
}
.carousel .item h4, .carousel .item p, .carousel .item ul {
	margin-bottom: 5px;
}
.carousel .thumb-content .btn {
	color: #7ac400;
    font-size: 11px;
    text-transform: uppercase;
    font-weight: bold;
    background: none;
    border: 1px solid #7ac400;
    padding: 6px 14px;
    margin-top: 5px;
    line-height: 16px;
    border-radius: 20px;
}
.carousel .thumb-content .btn:hover, .carousel .thumb-content .btn:focus {
	color: #fff;
	background: #7ac400;
	box-shadow: none;
}
.carousel .thumb-content .btn i {
	font-size: 14px;
    font-weight: bold;
    margin-left: 5px;
}

.carousel .item-price {
	font-size: 13px;
	padding: 2px 0;
}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".wish-icon i").click(function(){
			$(this).toggleClass("fa-heart fa-heart-o");
		});
	});	
</script>
</head>
<body>
<div class="container">
<a href="admin_home_link">홈화면</a>
	<div class="row">
		<div class="col-md-12">
			<h2> <b>관리자화면</b></h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
				<div class="item carousel-item active">
					<div class="row">
						<div class="col-sm-3">
							<a href="admin_rtrt_list"><div class="thumb-wrapper">
								<div class="img-box">
									<img src="image/restaurant.png" class="img-responsive img-fluid" alt="">									
								</div>
								<div class="thumb-content">
									음식점 리스트
								</div>						
							</div></a>
						</div>
						<div class="col-sm-3">
							<a href="restaurant_add"><div class="thumb-wrapper">

								<div class="img-box">
									<img src="image/chicken.png" class="img-responsive img-fluid" alt="">
								</div>
								<div class="thumb-content">
									음식점 추가
								</div>						
							</div></a>
						</div>		
						<div class="col-sm-3">
							<a href="ybbs_req_list?reqPage=1"><div class="thumb-wrapper">
								<div class="img-box">
									<img src="image/board.jpg" class="img-responsive img-fluid" alt="">
								</div>
								<div class="thumb-content">
									Q/A 게시판
								</div>						
							</div></a>
						</div>								
						<div class="col-sm-3">
							<a href="ybbs_eventList?reqPage=1"><div class="thumb-wrapper">
								<div class="img-box">
									<img src="image/eventboard.jpg" class="img-responsive img-fluid" alt="">
								</div>
								<div class="thumb-content">
									이벤트 게시판
								</div>						
							</div></a>
						</div>
					</div>
				</div>						
			</div>
		</div>
	</div>
</div>
</div>
	
	
	
	
	
</body>
</html>