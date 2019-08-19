<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	function validation()
	{
	    //이름 입력여부 체크
	    if (update.uName.value == "")
	    {
	        alert("이름을 입력하세요.")
	        update.uName.focus();
	        return false;
	    }
	    //우편번호 입력여부 체크
	    if (update.postcode.value == "")
	    {
	        alert("주소를 입력하세요.")
	        update.postcode.focus();
	        return false;
	    }
	    //우편번호 입력여부 체크
	    if (update.postcode.value == "")
	    {
	        alert("우편번호를 입력하세요.")
	        update.postcode.focus();
	        return false;
	    }
	    //도로명주소 입력여부 체크
	    if (update.roadAddress.value == "")
	    {
	        alert("도로명 주소를 입력하세요.")
	        update.roadAddress.focus();
	        return false;
	    }
	    //상세주소 입력여부 체크
	    if (update.detailAddress.value == "")
	    {
	        alert("주소를 입력하세요.")
	        update.detailAddress.focus();
	        return false;
	    }
	    //연락처 입력여부 체크
	    if (update.uPhonenum.value == "")
	    {
	        alert("연락처를 입력하세요.")
	        update.uPhonenum.focus();
	        return false;
	    }
	    alert("회원정보 수정이 완료되었습니다.");
	}
	
	function delete_check()
	{
		if(confirm("정말 탈퇴하시겠습니까?") == true)
		{
			alert("정상적으로 탈퇴되었습니다.");
			location.href = "users_delete?userId=${users.userId}";
			return false;
		}
		else
		{
			alert("탈퇴에 실패하였습니다."); 
			location.href = "home_link"; 
			return false; 
		}
	}
	
	function sample4_execDaumPostcode()
	{
	    new daum.Postcode(
	    {
	        oncomplete: function(data)
	        {
	            var roadAddr = data.roadAddress;
	            var extraRoadAddr = '';
	
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
	            {
	                extraRoadAddr += data.bname;
	            }
	            if(data.buildingName !== '' && data.apartment === 'Y')
	            {
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if(extraRoadAddr !== '')
	            {
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	
	            var guideTextBox = document.getElementById("guide");
	            if(data.autoRoadAddress)
	            {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress)
	            {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else
	            {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'block';
	            }
	        }
	    }).open();	    
	}
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	body{
		color: #636363;
		background: #eeeeee;
		font-family: 'Roboto', sans-serif;
	}
    .form-control{
		height: 40px;
		box-shadow: none;
		color: #969fa4;
	}
	.form-control:focus{
		border-color: #5cb85c;
	}
    .form-control, .btn{        
        border-radius: 3px;
    }
	.updateInfo-form{
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.updateInfo-form h3{
		color: #636363; 
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.updateInfo-form h3:before, .updateInfo-form h3:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.updateInfo-form h3:before{
		left: 0;
	}
	.updateInfo-form h3:after{
		right: 0;
	}
    .updateInfo-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .updateInfo-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.updateInfo-form .form-group{
		margin-bottom: 5px;
	}
	.updateInfo-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }	
    .updateInfo-form a{
		color: #636363;
		text-decoration: underline;
	}
    .updateInfo-form a:hover{
		text-decoration: none;
	}
	.updateInfo-form form a{
		color: #636363; 
		text-decoration: none;
	}	
	.updateInfo-form form a:hover{
		text-decoration: underline;
	}  
</style>

<title>회원 정보 수정</title>
</head>
<body>
<div class = "updateInfo-form">
	<form method="post" action="users_update?userId=${users.userId}" name="update" onsubmit="return validation();"> 
		<h3>회원정보 수정</h3>
		<div class="form-group">
			<h5>아이디</h5>
			<input type="text" id="userId" name="userId" value="${users.userId}" class="form-control" readonly="readonly""><br />
		</div>
		<div class="form-group">
			<h5>이름</h5>
			<input type="text" id="uName" name="uName" value="${users.uName}" class="form-control" ><br />
		</div>
		<div class="form-group">
			<div class="row">
				<h5>주소</h5>
				<div class="col-xs-6"><input type="text" name="postcode" id="sample4_postcode" class="form-control" placeholder="주소를 검색해주세요." readonly="readonly"></div>
				<div class="col-xs-3"><input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="주소 검색"><br /></div>
			</div>
		</div> 
<!-- 		<div class="form-group">
			주소 <input type="text" name="postcode" id="sample4_postcode" class="form-control" placeholder="주소를 검색해주세요." readonly="readonly">
		</div>
		<div class="form-group">
			<input type="button" onclick="sample4_execDaumPostcode()" value="주소 검색"><br />
		</div> -->
		<div class="form-group">
			<input type="text" name="roadAddress" id="sample4_roadAddress" class="form-control" placeholder="도로명 주소" readonly="readonly"><br />
		</div>
		<div class="form-group">
			<span id="guide" style="color: #999; display: none"></span> 
		</div>
		<div class="form-group">
			<input type="text" name="detailAddress" id="sample4_detailAddress" class="form-control" placeholder="상세주소를 입력하세요."><br /> 
		</div>
		<div class="form-group">
			<h5>연락처</h5>
			<input type="text" id="uPhonenum" name="uPhonenum" class="form-control" value="${users.uPhonenum}"><br />
		</div>
		<div class="form-group">
			<button class="btn btn-success btn-lg btn-block" type="submit" value="수정">수정</button><br />
		</div>
	</form>
</div>
<button onclick="delete_check();">탈퇴하기</button>
</body>
</html>