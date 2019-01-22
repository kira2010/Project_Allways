<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>비밀번호 재설정</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form action="resetPwd" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h2 class="resetPwd">비밀번호 변경</h2>
				</div>
				<div>
					<p>
						<input class="w3-input" type="password" id="resetPwd1" name="userPwd" placeholder="새로운 비밀번호를 입력하세요!" required />
						<div id="resetPwd1"></div>
						<input class="w3-input" type="password" id="resetPwd2" placeholder="다시 입력해주세요!" required />
						<div id="resetPwd2"></div>					
					</p>
					<p class="w3-center">
						<button type="submit" id=pwdBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경 확인</button>
					</p>
				</div>
			</form>
		</div>
	</div>
<script>
$(document).ready(function(){
	
	$('#resetPwd').focusout(function(){
		var first = $('#resetPwd1').val();
		var second = $('#resetPwd2').val();
		if($("#reset1").val().length < 8){	
			$("#resetPwd1").html("비밀번호는 8자 이상으로 설정해야 합니다.")
			$("#resetPwd1").css('color', 'red');
			$("#resetPwd1").val('');
			$("#resetPwd1").focus();
		} else if((first != '' || second != '') && first !== second){
			$("#resetPwd2").html("비밀번호가 일치하지 않습니다.");
			$("#resetPwd2").css('color', 'red');
			$('#resetPwd2').val('');
			$('#resetPwd2').focus();
		} else  {
			$('#resetPwd1').html("");
			$('#resetPwd2').html("확인 되었습니다.");
			$("#resetPwd2").css('color', 'green');
		}
	});
	
});
</script>
</body>
</html>