<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<title>인증 코드 확인</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form>
				<div class="w3-center w3-large w3-margin-top">
					<h2 class="pwdConfirm">인증 코드 확인</h2>
				</div>
				<div>
					<p>
						<input class="w3-input" type="text" id="confirm" name="confirm" placeholder="인증 코드 입력" required />
						<div id="ViewTimer"></div>
						<!-- 
						<input type="hidden" name="queryString" value="${targetUrl}" />
						 -->
					</p>
					<p class="w3-center">
						<button type="button" id="okBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">확인</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
					</p>
				</div>
			</form>
		</div>
	</div>
<script>
		var SetTime = 300;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	 
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				alert("입력시간을 초과하여 이전 페이지로 이동합니다.\n다시 진행해 주세요!");
				location="../users/findPwdForm";
			}	
		}
		window.onload = function TimerStart() { 
			tid=setInterval('msg_time()', 1000);
		};	
</script>
<script>
$(document).ready(function(){
	$('#okBtn').click(function(){
		var confirm = $('#confirm').val();
		
		console.log('입력한 인증키 : ' + confirm);
		
		$.ajax({
			url: '../users/pwdConfirm',
			type: 'post',
			data: {
				'confirm' : confirm
			},	
			success: function(result) {
				alert('인증 성공하였습니다.');
				location='../users/resetPwd';
			},
			error: function(result) {
				alert('인증 실패하였습니다.');
				$('#confirm').val('');
			}
		});

	});
});
</script>
</body>
</html>