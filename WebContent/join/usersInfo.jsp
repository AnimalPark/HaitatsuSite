<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<title>회원 정보 수정</title>

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
	.info-form{
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.info-form h3{
		color: #636363; 
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.info-form h3:before, .info-form h3:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.info-form h3:before{
		left: 0;
	}
	.info-form h3:after{
		right: 0;
	}
    .info-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .info-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.info-form .form-group{
		margin-bottom: 5px;
	}
	.info-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }	
    .info-form a{
		color: #636363;
		text-decoration: underline;
	}
    .info-form a:hover{
		text-decoration: none;
	}
	.info-form form a{
		color: #636363; 
		text-decoration: none;
	}	
	.info-form form a:hover{
		text-decoration: underline;
	}  
</style>

</head>
<body>
<div class = "info-form">
<h3>회원정보</h3>
	<div class="form-group">
		아이디 : ${users.userId}
	</div>
	<div class="form-group">
		이름 : ${users.uName}
	</div>
	<div class="form-group">
		주소 : ${users.uAddr}
	</div>
	<div class="form-group">
		연락처 : ${users.uPhonenum}
	</div>
	<div class="text-center">
		<a href="findId_link">개인정보 수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="findPwd_link">비밀번호 변경</a>
	</div>
</div>
</body>
</html>