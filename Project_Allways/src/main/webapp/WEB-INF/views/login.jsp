<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="로그인페이지" />
<meta name="Description" content="로그인페이지" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#footer {
	clear: both;
	width: 1000px;
	height: 70px;
	font-size: 11px;
	color: #8d8d8d;
	letter-spacing: -1px;
	border-top: 1px solid #DAEAAA;
	position: relative;
	top: 7px;
}

#footer > ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	position: relative;
	left: 8px;
}
body {
	background-color: #f1f1f1;
}
</style>

<title>로그인</title>
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
					<p>
						<input class="w3-input" type="text" id="userId" name="userId" placeholder="아이디 입력" required /> 
						<span id="id_check" class="w3-text-red"></span>
					</p>
					<p>
						<input class="w3-input" id="userPwd" name="userPwd" type="password" placeholder="비밀번호 입력" required />
					</p>
					<p class="w3-center"> 
						<input class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" type="submit" value="로그인" href=""/>	
					<input type="hidden" name="queryString" value="${targetUrl}" />
					</p>
				</form>
			</div>
		</div>
	</div>
	<div style="text-align: center;;padding-bottom: 15px; margin-top: 15px;">
		<ul>
			<a href="/allways/users/findIdForm" >아이디 찾기 |</a>
			<a href="/allways/users/findPwdForm">비밀번호 찾기 |</a>
			<a href="/allways/users/signUp">회원가입</a>
		</ul>
</div>
	
</body>
</html>