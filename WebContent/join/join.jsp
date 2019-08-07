癤�<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
		$(function() { $("#btn_userId").click(function() {
							id_check();

							function id_check() {
								var input_val = $("input:eq(0)").val();
								if(!input_val){
									alert("�꾩씠�붾� �낅젰�섏꽭��");
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
       //�꾩씠�� �낅젰�щ� 寃��
		if (join.userId.value == "")
		{
			alert("�꾩씠�붾� �낅젰�섏꽭��.")
			join.userId.focus();
			return false;
		}
        //�꾩씠�� �좏슚�� 寃�� (�곷Ц�뚮Ц��, �レ옄留� �덉슜)
		for (var i = 0; i < join.userId.value.length; i++)
		{
            ch = join.userId.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z'))
            {
                alert("�꾩씠�붾뒗 �곷Ц �뚮Ц��, �レ옄留� �낅젰 媛�ν빀�덈떎.")
                join.userId.focus();
                join.userId.select();
                return false;
            }
        }
        //�꾩씠�� 怨듬갚 泥댄겕
        if (join.userId.value.indexOf(" ") >= 0)
        {
            alert("�꾩씠�붿뿉 怨듬갚�� �ъ슜�� �� �놁뒿�덈떎.")
            join.userId.focus();
            join.userId.select()
            return false;
        }
        //�꾩씠�� 湲몄씠 泥댄겕 (6~12��)
		if (join.userId.value.length < 6 || join.userId.value.length > 12)
		{
			alert("�꾩씠�붾� 6~12�먭퉴吏 �낅젰�댁＜�몄슂.")
            join.userId.focus();
            join.userId.select();
            return false;
		}
        //鍮꾨�踰덊샇 �낅젰�щ� 泥댄겕
        if (join.uPwd.value == "")
        {
            alert("鍮꾨�踰덊샇瑜� �낅젰�섏꽭��.")
            join.uPwd.focus();
            return false;
        }
        //鍮꾨�踰덊샇 �좏슚�� 寃�� (�곷Ц ��뚮Ц��, �レ옄留� �덉슜)
        for (var i = 0; i < join.uPwd.value.length; i++)
        {
             ch = join.uPwd.value.charAt(i)
             if (!(ch >= '0' && ch <= '9') &&! (ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z'))
             {
                 alert("�꾩씠�붾뒗 �곷Ц ��뚮Ц��, �レ옄留� �낅젰媛�ν빀�덈떎.")
                 join.uPwd.focus();
                 join.uPwd.select();
                 return false;
             }
         }
        //鍮꾨�踰덊샇 怨듬갚 泥댄겕
        if (join.uPwd.value.indexOf(" ") >= 0)
        {
            alert("鍮꾨�踰덊샇�� 怨듬갚�� �ъ슜�� �� �놁뒿�덈떎.")
            join.uPwd.focus();
            join.uPwd.select()
            return false;
        }
        //鍮꾨�踰덊샇 湲몄씠 泥댄겕(6~18�� 源뚯� �덉슜)
        if (join.uPwd.value.length < 6 || join.uPwd.value.length > 18)
        {
            alert("鍮꾨�踰덊샇瑜� 6~18�먭퉴吏 �낅젰�댁＜�몄슂.")
            join.uPwd.focus();
            join.uPwd.select();
            return false;
        }
        //鍮꾨�踰덊샇� 鍮꾨�踰덊샇 �뺤씤 �쇱튂�щ� 泥댄겕
        if (join.uPwd.value != join.uPwd1.value)
        {
            alert("鍮꾨�踰덊샇媛 �쇱튂�섏� �딆뒿�덈떎")
            join.uPwd1.value = ""
            join.uPwd1.focus();
            return false;
        }
        //�대쫫 �낅젰�щ� 泥댄겕
        if (join.uName.value == "")
        {
            alert("�대쫫�� �낅젰�섏꽭��.")
            join.uName.focus();
            return false;
        }
        //�고렪踰덊샇 �낅젰�щ� 泥댄겕
        if (join.postcode.value == "")
        {
            alert("二쇱냼瑜� �낅젰�섏꽭��.")
            join.postcode.focus();
            return false;
        }
        //�고렪踰덊샇 �낅젰�щ� 泥댄겕
        if (join.postcode.value == "")
        {
            alert("�고렪踰덊샇瑜� �낅젰�섏꽭��.")
            join.postcode.focus();
            return false;
        }
        //�꾨줈紐낆＜�� �낅젰�щ� 泥댄겕
        if (join.roadAddress.value == "")
        {
            alert("�꾨줈紐� 二쇱냼瑜� �낅젰�섏꽭��.")
            join.roadAddress.focus();
            return false;
        }
        //�곸꽭二쇱냼 �낅젰�щ� 泥댄겕
        if (join.detailAddress.value == "")
        {
            alert("二쇱냼瑜� �낅젰�섏꽭��.")
            join.detailAddress.focus();
            return false;
        }
        //�곕씫泥� �낅젰�щ� 泥댄겕
        if (join.uPhonenum.value == "")
        {
            alert("�곕씫泥섎� �낅젰�섏꽭��.")
            join.uPhonenum.focus();
            return false;
        }
        alert("�뚯썝媛�낆씠 �꾨즺�섏뿀�듬땲��.");
    }
    
	function sample4_execDaumPostcode()
	{
        new daum.Postcode(
        {
            oncomplete: function(data)
            {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[��濡�媛]$/g.test(data.bname))
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
                    guideTextBox.innerHTML = '(�덉긽 �꾨줈紐� 二쇱냼 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress)
                {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(�덉긽 吏踰� 二쇱냼 : ' + expJibunAddr + ')';
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
<title>�뚯썝媛��</title>
</head>
<body>
		<form method="post" action="user_join" name="join"
			onsubmit="return validation();">

			�꾩씠�� : <input type="text" id="userId" name="userId" placeholder="�꾩씠�붾� �낅젰�댁＜�몄슂.">&nbsp; 
			<input type="button" value="以묐났 �뺤씤 " id="btn_userId">
			��6~12�먮━�� �곷Ц �뚮Ц��, �レ옄瑜� 議고빀�섏뿬 �ъ슜�섏떎 �� �덉뒿�덈떎.<br /> 
			<div class="console"></div>
			
			</div>
			鍮꾨�踰덊샇 : <input type="password" id="uPwd" name="uPwd" placeholder="鍮꾨�踰덊샇瑜� �낅젰�댁＜�몄슂.">
			��6~18�먮━�� �곷Ц ��뚮Ц��, �レ옄瑜� 議고빀�섏뿬 �ъ슜�섏떎 �� �덉뒿�덈떎.<br /> 
			鍮꾨�踰덊샇 �뺤씤 : <input type="password" id="uPwd1" name="uPwd1" placeholder="鍮꾨�踰덊샇瑜� �ㅼ떆 �� 踰� �낅젰�댁＜�몄슂."><br />
			�대쫫 : <input type="text" id="uName" name="uName" placeholder="�대쫫�� �낅젰�댁＜�몄슂."><br /> 
			二쇱냼 : <input type="text" name="postcode" id="sample4_postcode" placeholder="二쇱냼瑜� 寃�됲빐二쇱꽭��.">&nbsp;
			<input type="button" onclick="sample4_execDaumPostcode()" value="二쇱냼 寃��"><br> 
			<input type="text" name="roadAddress" id="sample4_roadAddress" placeholder="�꾨줈紐� 二쇱냼"><br />
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" name="detailAddress" id="sample4_detailAddress" placeholder="�곸꽭二쇱냼瑜� �낅젰�섏꽭��."><br /> 
			�곕씫泥� : <input type="text" id="uPhonenum" name="uPhonenum" placeholder="�곕씫泥섎� �낅젰�댁＜�몄슂. (01000000000)"><br />
			<button class="btn btn-primary" type="submit" value="�뚯썝媛��">�뚯썝媛��</button>

		</form>
	</div>
</body>
</html>