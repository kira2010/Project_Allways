<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입환영" />
<meta name="Description" content="회원가입환영" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원가입이 완료되었습니다.</title>
<script type="text/javascript">
//<![CDATA[
//]]>
</script>    
</head>
<body>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>
					<a href="/allways"><img src="/allways/resources/images/login.png" /></a>
				</h3>
			</div>
			<div>
				<form action="/allways/users/login" method="post">
					<h1>환영합니다.</h1>
					친구들과 친구를 맺고 다양한 소통과 일상을 공유해주세요!!<br />
					이제 로그인하시면 회원 메뉴를 이용하실 수 있습니다.<br />
					<p class="w3-center"> 
						<input class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" id="loginBtn" type="button" value="로그인" href=""/>	
					<input type="hidden" name="queryString" value="${targetUrl}" />
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>