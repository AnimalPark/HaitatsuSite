<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    function validation()
    {
		if (change.uPwd.value == "")
		{
			alert("비밀번호를 입력하세요.")
			change.uPwd.focus();
			return false;
		}
        //비밀번호 유효성 검사 (영문 대소문자, 숫자만 허용)
        var numChk = 0;
        var engChk = 0;
        var tfchk = 1;
        for (var i = 0; i < change.uPwd.value.length; i++)
        {
             ch = change.uPwd.value.charAt(i);
             
             if ((ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')){
             	if((ch >= '0' && ch <= '9')){
             		numChk++;
             	}
             	else if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')){
             		engChk++;
             	}
             }
             else{
            	 tfchk = 0;
             }
        }
        if(tfchk == 0){
        	alert("비밀번호는 영문 대소문자, 숫자만 입력가능합니다.")
            change.uPwd.focus();
        	change.uPwd.select();
            return false;
        }
        else{
        	if(!(numChk != 0 && engChk != 0)){
        		alert("숫자와 영문자(대소문자 무관) 각각 하나 이상을 입력하세요.")
                change.uPwd.focus();
        		change.uPwd.select();
                return false;
        	}
        	else{
        		;
        	}
        }
        if (change.uPwd.value.indexOf(" ") >= 0)
        {
            alert("비밀번호에 공백을 사용할 수 없습니다.")
            change.uPwd.focus();
            change.uPwd.select()
            return false;
        }
        if (change.uPwd.value.length < 6 || change.uPwd.value.length > 18)
        {
            alert("비밀번호를 6~18자까지 입력해주세요.")
            change.uPwd.focus();
            change.uPwd.select();
            return false;
        }
        if (change.uPwd.value != change.uPwd1.value)
        {
            alert("비밀번호가 일치하지 않습니다")
            change.uPwd1.value = ""
            change.uPwd1.focus();
            return false;
        }
        alert("비밀번호가 정상적으로 변경되었습니다.");
    }
</script>
<title>비밀번호 변경</title>

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
		width: 550px;
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
	<form method="post" action="change_uPwd2?userId=${users.userId}" name="change" onsubmit="return validation();">
		<h3>비밀번호 변경</h3>
		<p class="hint-text">주기적인(6개월) 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.<br />
		6~18자리의 영문 대소문자, 숫자를 조합하여 사용하실 수 있습니다.</p>
		<br />
		<div class="form-group">
			<input type="password" id="uPwd" name="uPwd" class="form-control" placeholder="비밀번호를 입력해주세요."><br />
		</div>
		<div class="form-group">
			<input type="password" id="uPwd1" name="uPwd1" class="form-control" placeholder="비밀번호를 다시 한 번 입력해주세요."><br />
		</div>
		<div class="form-group">
			<button class="btn btn-success btn-lg btn-block" type="submit" value="변경">변경</button><br />
			<!-- <input type="submit" value="변경하기"> -->
		</div>
	</form>
</div>
</body>
</html>