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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body {
	background-color: #f1f1f1;
}

.findID {
	font-weight: bolder;
	font-famliy : arial, helvetica, sans-serif;
	text-align: left;
	margin-top: 10%;
	margin-bottom: 2%;
}
</style>
<title>아이디 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form>
				<div class="w3-center w3-large w3-margin-top">
				<h3><a href="/allways"><img src="/allways/resources/images/login.png" /></a></h3>
					<h2 class="findID">ID 찾기</h2>
				</div>
				<div>
					<p>
						<input class="w3-input" type="text" id="userName" name="userName" placeholder="이름" required>
						<input class="w3-input" type="text" id="userEmail" name="userEmail" placeholder="Email 주소" required>
						<input type="hidden" name="queryString" value="${targetUrl}" />
					</p>
					<p class="w3-center">
						<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
					</p>
				</div>
			</form>
		</div>
	</div>
<script>
$(document).ready(function() {	
	
	$('#findBtn').click(function() {
		var userName = $('#userName').val();
		var userEmail = $('#userEmail').val();
		
		if(userEmail == '' || userName == '') {
			alert('이름과 Email 을 모두 입력해주세요.');
		} else {
			getConfirm();
		}
	});
	
	function getConfirm() {
		
		var userName = $('#userName').val();
		var userEmail = $('#userEmail').val();
		
		console.log('userName' + userName);
		console.log('userEmail' + userEmail);
		
		$.ajax({
			type: 'post',
			url: '../users/findId',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify ({
				'userName' : userName,
				'userEmail': userEmail
			}),	
			success: function(result) {
				if(result != '') {
					alert('찾으시는 ID는 ' + '"' + result + '"' + ' 입니다. \n' +'확인버튼 클릭시 "로그인" 페이지로 이동합니다.');
					location="../users/login";
				} else {
					alert('찾으시는 ID가 존재하지 않습니다!');
					$('#userName').val('');
					$('#userEmail').val('');
				}
			}
		});
	}
	
	
});
</script>
</body>

</html>