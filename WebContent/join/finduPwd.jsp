<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<title>비밀번호 찾기</title>


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
	.finduPwd-form{
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.finduPwd-form h3{
		color: #636363; 
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.finduPwd-form h3:before, .finduPwd-form h3:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.finduPwd-form h3:before{
		left: 0;
	}
	.finduPwd-form h3:after{
		right: 0;
	}
    .finduPwd-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .finduPwd-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.finduPwd-form .form-group{
		margin-bottom: 5px;
	}
	.finduPwd-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }	
    .finduPwd-form a{
		color: #636363;
		text-decoration: underline;
	}
    .finduPwd-form a:hover{
		text-decoration: none;
	}
	.finduPwd-form form a{
		color: #636363; 
		text-decoration: none;
	}	
	.finduPwd-form form a:hover{
		text-decoration: underline;
	}  
</style>

</head>
<body>
<div class = "finduPwd-form">
	<a href="login_link">로그인 화면으로</a>
	<form method="post" action="find_uPwd" >
	<h3>비밀번호 찾기</h3>
	<p class="hint-text">비밀번호를 찾기 위한 정보를 입력해주세요.</p>
		<div class="form-group">
			<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디"/><br />
		</div>
		<div class="form-group">
			<input type="text" name="uName" id="uName" class="form-control" placeholder="이름"/><br />
		</div>
		<div class="form-group">
			<input type="text" name="uPhonenum" id="uPhonenum" class="form-control" placeholder="연락처(-제외)"/><br />
		</div>
		<div class="form-group">
			<button class="btn btn-success btn-lg btn-block" type="submit" value="비밀번호 찾기">비밀번호 찾기</button><br />
		</div>
		<!-- <input type="submit" value="비밀번호 찾기"> -->
		${message}<br />
		${users.uPwd}<br />
	</form>
</div>
</body>
</html>