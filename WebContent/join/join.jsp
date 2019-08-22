<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
		$(function() { $("#btn_userId").click(function() {
							id_check();

							function id_check() {
								var input_val = $("input:eq(0)").val();
								if(!input_val){
									alert("아이디를 입력하세요");
									return false;
								}

								var url = "id_check";
								$.get(url, {"id" : input_val}, function(xml){
									var result = $(xml).find("result").text();
									alert(result);
									$(".console").html(result);
								});
							};
						});
	});
</script>

<script type="text/javascript">
    function validation()
    {
       //아이디 입력여부 검사
		if (join.userId.value == "")
		{
			alert("아이디를 입력하세요.")
			join.userId.focus();
			return false;
		}
        //아이디 유효성 검사 (영문소문자, 숫자만 허용)
		for (var i = 0; i < join.userId.value.length; i++)
		{
            ch = join.userId.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z'))
            {
                alert("아이디는 영문 소문자, 숫자만 입력 가능합니다.")
                join.userId.focus();
                join.userId.select();
                return false;
            }
        }
        //아이디 공백 체크
        if (join.userId.value.indexOf(" ") >= 0)
        {
            alert("아이디에 공백을 사용할 수 없습니다.")
            join.userId.focus();
            join.userId.select()
            return false;
        }
        //아이디 길이 체크 (6~12자)
		if (join.userId.value.length < 6 || join.userId.value.length > 12)
		{
			alert("아이디를 6~12자까지 입력해주세요.")
            join.userId.focus();
            join.userId.select();
            return false;
		}
        //비밀번호 입력여부 체크
        if (join.uPwd.value == "")
        {
            alert("비밀번호를 입력하세요.")
            join.uPwd.focus();
            return false;
        }
        //비밀번호 유효성 검사 (영문 대소문자, 숫자만 허용)
        var numChk = 0;
        var engChk = 0;
        var tfchk = 1;
        for (var i = 0; i < join.uPwd.value.length; i++)
        {
             ch = join.uPwd.value.charAt(i);
             
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
            join.uPwd.focus();
            join.uPwd.select();
            return false;
        }
        else{
        	if(!(numChk != 0 && engChk != 0)){
        		alert("숫자와 영문자(대소문자 무관) 각각 하나 이상을 입력하세요.")
                join.uPwd.focus();
                join.uPwd.select();
                return false;
        	}
        	else{
        		;
        	}
        }
        //비밀번호 공백 체크
        if (join.uPwd.value.indexOf(" ") >= 0)
        {
            alert("비밀번호에 공백을 사용할 수 없습니다.")
            join.uPwd.focus();
            join.uPwd.select()
            return false;
        }
        //비밀번호 길이 체크(6~18자 까지 허용)
        if (join.uPwd.value.length < 6 || join.uPwd.value.length > 18)
        {
            alert("비밀번호를 6~18자까지 입력해주세요.")
            join.uPwd.focus();
            join.uPwd.select();
            return false;
        }
        //비밀번호와 비밀번호 확인 일치여부 체크
        if (join.uPwd.value != join.uPwd1.value)
        {
            alert("비밀번호가 일치하지 않습니다")
            join.uPwd1.value = ""
            join.uPwd1.focus();
            return false;
        }
        //이름 입력여부 체크
        if (join.uName.value == "")
        {
            alert("이름을 입력하세요.")
            join.uName.focus();
            return false;
        }
        //상세주소 입력여부 체크
        if (join.detailAddress.value == "")
        {
            alert("주소를 입력하세요.")
            join.detailAddress.focus();
            return false;
        }
        //연락처 입력여부 체크
        if (join.uPhonenum.value == "")
        {
            alert("연락처를 입력하세요.")
            join.uPhonenum.focus();
            return false;
        }
        //연락처 특수문자 제외 체크
        if (join.uPhonenum.value.indexOf("-") >= 0)
        {
            alert("비밀번호에 -표시를 사용할 수 없습니다.")
            join.uPhonenum.focus();
            join.uPhonenum.select()
            return false;
        }
        if ('${chkid}' == 1){
        	alert("회원가입이 완료되었습니다.");
        }
        else{
        	alert("사용 가능한 아이디가 아니거나 아이디 중복검사를 실행하지 않았습니다.")
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

<title>회원가입</title>

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
	.signup-form{
		width: 550px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.signup-form h3{
		color: #636363;
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.signup-form h3:before, .signup-form h3:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.signup-form h3:before{
		left: 0;
	}
	.signup-form h3:after{
		right: 0;
	}
    .signup-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .signup-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form .form-group{
		margin-bottom: 5px;
	}
	.signup-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }
	.signup-form .row div:first-child{
		padding-right: 10px;
	}
	.signup-form .row div:last-child{
		padding-left: 100px;
	}    	
    .signup-form a{
		color: #636363;
		text-decoration: underline;
	}
    .signup-form a:hover{
		text-decoration: none;
	}
	.signup-form form a{
		color: #636363;
		text-decoration: none;
	}	
	.signup-form form a:hover{
		text-decoration: underline;
	}  
</style>

</head>
<body>
	<div class="signup-form">
		<form method="post" action="user_join" name="join"
			onsubmit="return validation();">
			<h3>회원가입</h3>
			<p class="hint-text">회원가입을 위한 정보를 입력해 주세요.</p>
			<div class="form-group">
				<h5>아이디</h5>
				<div class="row">
				<div class="col-xs-6"><input type="text" id="userId" name="userId" class="form-control" placeholder="6~12자의 영문 소문자와 숫자를 조합하여 사용하세요."></div>
				<div class="col-xs-6"><input type="button" class="btn" value="중복 확인 " id="btn_userId"></div>
			</div>       
			<div class="form-group">
				<h5>비밀번호</h5>
				<input type="password" id="uPwd" name="uPwd" class="form-control" placeholder="6~18자의 숫자와 영문 대소문자를 조합하여  사용하세요.">
			</div>
			<div class="form-group">
				<h5>비밀번호 확인</h5>
				<input type="password" id="uPwd1" name="uPwd1" class="form-control" placeholder="비밀번호를 다시 한 번 입력해주세요."><br />
			</div>
			<div class="form-group">
				<h5>이름</h5>
				<input type="text" id="uName" name="uName" class="form-control" placeholder="이름을 입력해주세요."><br /> 
			</div>
			<div class="form-group">
				<h5>주소</h5>
				<div class="row">
					<div class="col-xs-6"><input type="text" name="roadAddress" id="sample4_roadAddress" class="form-control" placeholder="도로명 주소"></div>
					<div class="col-xs-3"><input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="주소 검색"></div>
				</div>       
			</div>
			<div class="form-group">	
				<span id="guide" style="color: #999; display: none"></span> 
			</div>
			<div class="form-group">	
				<input type="text" name="detailAddress" id="sample4_detailAddress" class="form-control" placeholder="상세주소를 입력하세요."><br /> 
			</div>
			<div class="form-group">
				<h5>연락처</h5>
				<input type="text" id="uPhonenum" name="uPhonenum" class="form-control" placeholder="연락처를 입력해주세요.(-제외)"><br />
			</div>
			<div class="form-group">
				<button class="btn btn-success btn-lg btn-block" type="submit" value="회원가입">회원가입</button>
			</div>
		</form>
	</div>
	<div class="text-center">이미 회원이십니까? <a href="login_link">로그인</a></div>
</body>
</html>