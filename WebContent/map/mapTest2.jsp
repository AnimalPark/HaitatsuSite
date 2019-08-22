<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: 'Varela Round', sans-serif;
}

.modal-confirm {
	color: #434e65;
	width: 525px;
}

.modal-confirm .modal-content {
	padding: 20px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
}

.modal-confirm .modal-header {
	background: #47c9a2;
	border-bottom: none;
	position: relative;
	text-align: center;
	margin: -20px -20px 0;
	border-radius: 5px 5px 0 0;
	padding: 35px;
}

.modal-confirm h4 {
	text-align: center;
	font-size: 36px;
	margin: 10px 0;
}

.modal-confirm .form-control, .modal-confirm .btn {
	min-height: 40px;
	border-radius: 3px;
}

.modal-confirm .close {
	position: absolute;
	top: 15px;
	right: 15px;
	color: #fff;
	text-shadow: none;
	opacity: 0.5;
}

.modal-confirm .close:hover {
	opacity: 0.8;
}

.modal-confirm .icon-box {
	color: #fff;
	width: 95px;
	height: 95px;
	display: inline-block;
	border-radius: 50%;
	z-index: 9;
	border: 5px solid #fff;
	padding: 15px;
	text-align: center;
}

.modal-confirm .icon-box i {
	font-size: 64px;
	margin: -4px 0 0 -4px;
}

.modal-confirm.modal-dialog {
	margin-top: 80px;
}

.modal-confirm .btn {
	color: #fff;
	border-radius: 4px;
	background: #eeb711;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border-radius: 30px;
	margin-top: 10px;
	padding: 6px 20px;
	border: none;
}

.modal-confirm .btn:hover, .modal-confirm .btn:focus {
	background: #eda645;
	outline: none;
}

.modal-confirm .btn span {
	margin: 1px 3px 0;
	float: left;
}

.modal-confirm .btn i {
	margin-left: 1px;
	font-size: 20px;
	float: right;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
<style>
div.fixed {
	position: fixed;
	top: 100px;
	left: 290px;
	width: 300px;
	border: 3px solid #73AD21;
}
</style>
</head>
<body>
	<div class="text-center">
		<!-- Button HTML (to Trigger Modal) -->
		<h2>결제가 완료 되었습니다.</h2>

		<div id="map" style="width: 50%; height: 250px;" class="fixed"></div>
	</div>
	<div class="container">
		<a href="home_link">홈화면</a>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31095fd2e33c6f2895cb07cd88db3e44&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var jusopoint = "${juso}";
		alert(jusopoint);
		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						jusopoint,
						function(result, status) {

							//정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">주문 식당위치</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
</body>
</html>