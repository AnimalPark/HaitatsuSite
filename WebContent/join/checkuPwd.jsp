<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<title>비밀번호 확인</title>

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
	.chkuPwd-form{
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.chkuPwd-form h3{
		color: #636363; 
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.chkuPwd-form h3:before, .chkuPwd-form h3:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.chkuPwd-form h3:before{
		left: 0;
	}
	.chkuPwd-form h3:after{
		right: 0;
	}
    .chkuPwd-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .chkuPwd-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.chkuPwd-form .form-group{
		margin-bottom: 5px;
	}
	.chkuPwd-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }	
    .chkuPwd-form a{
		color: #636363;
		text-decoration: underline;
	}
    .chkuPwd-form a:hover{
		text-decoration: none;
	}
	.chkuPwd-form form a{
		color: #636363; 
		text-decoration: none;
	}	
	.chkuPwd-form form a:hover{
		text-decoration: underline;
	}  
</style>

</head>
<body>
<div class = "chkuPwd-form">
	<form method="post" action="check_uPwd?userId=${users.userId}">
	<h3>비밀번호 확인</h3>
	<p class="hint-text">본인확인을 위해 비밀번호를 입력해 주세요.<br />
	비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</p>
		<div class="form-group">
			<input type="password" id="uPwd" name="uPwd" class="form-control" placeholder="비밀번호 입력"><br />
		</div>
		<div class="form-group">
			<button class="btn btn-success btn-lg btn-block" type="submit" value="비밀번호 확인">비밀번호 확인</button><br />
			<!-- <input type="submit" value="비밀번호 확인"> -->
		</div>
		${message}<br />
	</form>
</div>
</body>
</html>