<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        for (var i = 0; i < change.uPwd.value.length; i++)
        {
             ch = change.uPwd.value.charAt(i)
             if (!(ch >= '0' && ch <= '9') &&! (ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z'))
             {
                 alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                 change.uPwd.focus();
                 change.uPwd.select();
                 return false;
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
<title>비밀번호 재설정</title>
</head>
<body>
	<h3>비밀번호 재설정</h3>
	비밀밀호를 변경해주세요.
	<form method="post" action="change_uPwd" name="change" onsubmit="return validation();">
		<input type="hidden" id="userId" name="userId"/>
		비밀번호 <input type="password" id="uPwd" name="uPwd" placeholder="비밀번호를 입력해주세요.">※6~18자리의 영문 대소문자, 숫자를 조합하여 사용하실 수 있습니다.<br />
		비밀번호 확인 <input type="password" id="uPwd1" name="uPwd1" placeholder="비밀번호를 다시 한 번 입력해주세요."><br />
		<input type="submit" value="변경하기">
	</form>
</body>
</html>