<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
        for (var i = 0; i < join.uPwd.value.length; i++)
        {
             ch = join.uPwd.value.charAt(i)
             if (!(ch >= '0' && ch <= '9') &&! (ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z'))
             {
                 alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                 join.uPwd.focus();
                 join.uPwd.select();
                 return false;
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
        //우편번호 입력여부 체크
        if (join.postcode.value == "")
        {
            alert("주소를 입력하세요.")
            join.postcode.focus();
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
        alert("회원가입이 완료되었습니다.");
    }
/*     function registerCheckFunction()
    {
    	var userId = ${'#userId'}.val();
    	$.ajax({
    		type : 'POST',
    		url : './UserRegisterheckServlet',
    		data : {userId : userId},
    		success : function(result)
    		{
    			if(result == 1)
    			{
    				$('checkMessage').html('사용할 수 있는 아이디입니다.');
    				$('checkType').attr('class', 'modal-content panel-success');
    			}
    			else
    			{
    				$('checkMessage').html('사용할 수 없는 아이디입니다.');
    				$('checkType').attr('class', 'modal-content panel-warning');
    			}
    			$('#checkModal').modal("show");
    		}
    	})
    } */

</script>
<title>회원가입</title>
</head>
<body>
	<div class="container">
		<form method="post" action="user_join" name="join" onsubmit="return validation();">

					아이디 :
					<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">&nbsp;
					<button class="btn btn-primary" type="button" id="idcheck" name="idcheck" value ="중복확인">중복 확인</button>※6~12자리의 영문 소문자, 숫자를 조합하여 사용하실 수 있습니다.<br />

					비밀번호 :
					<input type="password" id="uPwd" name="uPwd" placeholder="비밀번호를 입력해주세요.">※6~18자리의 영문 대소문자, 숫자를 조합하여 사용하실 수 있습니다.<br />

					비밀번호 확인 :
					<input type="password" id="uPwd1" name="uPwd1" placeholder="비밀번호를 다시 한 번 입력해주세요."><br />

					이름 :
					<input type="text" id="uName" name="uName" placeholder="이름을 입력해주세요."><br />

					주소 :
					
						<input type="text" name="postcode" id="sample4_postcode" placeholder="우편번호">&nbsp;
						<input type="button" onclick="sample4_execDaumPostcode()" value="주소 검색"><br>
						<input type="text" name="roadAddress" id="sample4_roadAddress" placeholder="도로명 주소"><br />
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" name="detailAddress" id="sample4_detailAddress" placeholder="상세주소를 입력하세요."><br />
					

					연락처 :
					<input type="text" id="uPhonenum" name="uPhonenum" placeholder="연락처를 입력해주세요. (010-0000-0000)"><br />

					<button class="btn btn-primary" type="submit" value="회원가입">회원가입</button>
		</form>
	</div>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
</body>
</html>