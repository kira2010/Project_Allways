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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
html, body {
    margin: 0;
    padding: 0;
    background-color: #FFF;
    font-family: "Noto Sans KR", "Liberation Sans", Helvetica, "돋움", dotum, sans-serif;
    font-size: 1em;
}
#wrap {
    margin: 0 auto;
    padding: 0;
    width: 1000px;
}
#header {
    width: 1000px;
    height: 48px;
    margin-top: 120px;
}
#container {
	float: center;
    width: 100%;
    border-top: 1px solid #DAEAAA;
}
#content {
	font-size: large;
    text-align: center;
    background: #DDD;
    height: 300px;     
}
#footer {
	clear: both;
    width: 1000px;
    height: 70px;
    font-size: 9px;
    color: #8d8d8d;
    letter-spacing: -1px;
    border-top: 1px solid #DAEAAA;
    position: relative;
    top: 7px;
}

#header h1{
	margin: 0;
	padding: 0;
	position: relative;
	top: 12px;
}

#footer > ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	position: relative;
	left: 8px;
}

#footer > ul > li {
	float: left;
	padding: 6px 12px 6px 8px;
}

#footer > ul > li > a {
    color: #8D8D8D;
    text-decoration: none;
}

#footer > ul > li > a:hover {
    text-decoration: underline;
}

#footer > ul > li#company-info {
    margin-left: 350px;
    letter-spacing: 0;
    background: none;
}

</style>

<title>로그인</title>
</head>
<body>

	<div id="wrap">
	
		<!--div id="header">
			<h1 style="float: center; width: 150px;">
				<a href="/allways"><img src="/allways/resources/images/allways.png" /></a>
			</h1>
		</div -->
	
		<div id="container">

			<div id="content">

				<!--본문시작  -->
				<form action="/allways/users/login" method="post">
					<input style="width: 50%;" type="text" name="userId" placeholder="아이디 입력" required /> <br /> 
					<input style="width: 50%" type="password" name="userPwd" placeholder="비밀번호 입력" required /> <br /> 
					<input style="width: 50%" type="submit" value="로그인" /> 
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