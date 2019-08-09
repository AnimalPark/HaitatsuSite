<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
    function validation()
    {
       //아이디 입력여부 검사
		if (check.uPwd.value == "")
		{
			alert("비밀번호를 입력하세요.")
			join.uPwd.focus();
			return false;
		}
    }
</script>
<title>비밀번호 확인</title>
</head>
<body>
	<form method="post" action="check_uPwd?userId=${users.userId}"
		name="check" onsubmit="return validation();">>  
		비밀번호를 확인해주세요.<br />
		비밀번호 : <input type="password" id="uPwd" name="uPwd"><br />	
		<button class="btn btn-primary" type="submit" value="다음으로">다음으로</button>
	</form>
</body>
</html>