<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
			location.href = "users_delete?userId=${users.userId}"; 
			return false;
		}
		else
		{
			alert("정상적으로 탈퇴가 안됨."); 
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

<title>회원 정보</title>
</head>
<body>
	<div class="container">
		<form method="post" action="users_update?userId=${users.userId}" name="update" onsubmit="return validation();"> 

			아이디 : ${users.userId}<br />	
			비밀번호 : <a href="changewPwd_mp_link">비밀번호 변경하기</a><br />	
			이름 : <input type="text" id="uName" name="uName" value="${users.uName}"><br />
			주소 : <input type="text" name="postcode" id="sample4_postcode" placeholder="주소를 검색해주세요.">&nbsp;
			<input type="button" onclick="sample4_execDaumPostcode()" value="주소 검색"><br />
			<input type="text" name="roadAddress" id="sample4_roadAddress" placeholder="도로명 주소"><br />
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" name="detailAddress" id="sample4_detailAddress" placeholder="상세주소를 입력하세요."><br /> 
			연락처 : <input type="text" id="uPhonenum" name="uPhonenum" value="${users.uPhonenum}"><br />
			<button class="btn btn-primary" type="submit" value="수정하기">수정하기</button>

		</form>
	</div>
	<button onclick="delete_check();">탈퇴하기</button> 	
	<%-- <a href="users_delete?userId=${users.userId}" onclick="delete_check();">탈퇴하기</a> --%>
	
</body>
</html>