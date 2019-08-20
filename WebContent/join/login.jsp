<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<title>로그인 페이지</title>

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
	.login-form{
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.login-form h3{
		color: #636363; 
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.login-form h3:before, .login-form h3:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.login-form h3:before{
		left: 0;
	}
	.login-form h3:after{
		right: 0;
	}
    .login-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .login-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.login-form .form-group{
		margin-bottom: 5px;
	}
	.login-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }	
    .login-form a{
		color: #636363;
		text-decoration: underline;
	}
    .login-form a:hover{
		text-decoration: none;
	}
	.login-form form a{
		color: #636363; 
		text-decoration: none;
	}	
	.login-form form a:hover{
		text-decoration: underline;
	}  
</style>

</head>
<body>
	<div class="login-form">
		<form method="post" action="user_login" >
		<h3>로그인</h3>
			<div class="form-group">
				<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디"/> <br />
			</div>
			<div class="form-group">
				<input type="password" name="uPwd" id="uPwd" class="form-control" placeholder="비밀번호"/> <br />
			</div>
			<div class="form-group">
				<button class="btn btn-success btn-lg btn-block" type="submit" value="로그인">로그인</button><br />
				<!-- <input type="submit" value="로그인 하기"> -->
			</div>
	
		<div class="form-group">
			${message}<br /><br />
		</div>
		<div class="text-center">
			<a href="findId_link">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="findPwd_link">비밀번호 찾기</a>
		</div>
		</form>
		<div class="text-center">아직 회원이 아니시면 <a href="join_link">회원가입</a>을 눌러주세요.</div>
	</div>
</body>
</html>