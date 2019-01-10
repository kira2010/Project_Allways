<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="로그인페이지" />
<meta name="Description" content="로그인페이지" />
<link rel="stylesheet" href="resources/css/screen.css" type="text/css"
	media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>로그인</title>
</head>
<body>

	<div id="wrap">
	
		<div id="container">

			<div id="content">

				<!--본문시작  -->
				<form action="/allways/users/login" method="post">
					<input style="width: 50%;" type="text" name="userId" placeholder="아이디 입력" required /> <br /> 
					<input style="width: 50%" type="password" name="userPwd" placeholder="비밀번호 입력" required /> <br /> 
					<input style="width: 50%" type="submit" value="로그인" "/> 
					<input type="hidden" name="queryString" value="${targetUrl}" />
				</form>
				<!--본문끝  -->

			</div>
			<!-- content 끝 -->

		</div>
		<!--  container 끝 -->

		<div id="footer">
				<div style="text-align: center;;padding-bottom: 15px;">
					<ul>
						<a href="/allways/users/#" >아이디 찾기 |</a>
						<a href="/allways/users/#">비밀번호 찾기 |</a>
						<a href="/allways/users/signUp">회원가입</a>
					</ul>	
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>