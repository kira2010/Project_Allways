<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	padding: 15px;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}

}

#drop {
	margin-top: 9px;
}

#text {
	width: 400px;
	margin-top: 9px;
	max-width: 400px;
}

#rightlist {
	margin-top: 30px;
}

#leftlist {
	margin-top: 20px;
}

#l1 {
	margin-bottom: 30px;
}

#l2, #l3 {
	margin-top: 20px;
}

#backImg {
	width: 100%;
	position: relative;
}

#profile {
	position: relative;
	left: 10px;
	top: -100px;
	border-radius: 60px;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

#menubar {
	border: solid 1px grey;
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#userInfo {
	border: solid 1px grey;
	margin-bottom: 15px;
	
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse" id="header">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.jsp"><img
					src="/allways/resources/images/allways.png" id="mainLogo"
					height="30px" width="30px"></a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li>
						<form action="/action_page.php">
							<div class="input-group" id="text">
								<input type="text" class="form-control" placeholder="Search"
									name="search">
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a>딴따라님 안녕하세요!</a></li>
					<li>
						<div class="dropdown" id="drop">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
								회원정보 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-toggle="modal" data-target="#logout">로그아웃</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-toggle="modal" data-target="#updateInfo">개인정보 수정</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-toggle="modal" data-target="#memberWithdrawal">회원탈퇴</a></li>
							</ul>
						</div> <!-- dropDown아이템 다이얼로그 -->
						<div class="modal fade" id="logout">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">로그아웃</h4>
									</div>

									<!-- Modal body -->
									<div class="modal-body">정말 로그아웃하시겠습니까?</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" class="btn" data-dismiss="modal">아니오</button>
										<button type="button" class="btn" data-dismiss="modal"
											onclick="location.href='login.jsp'">예</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="updateInfo">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">개인정보 수정</h4>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<!-- 모델클래스에 저장된 아이디 불러오기 -->
										<input class="form-control" type="text" name="userId" readonly />
										<br /> <input class="form-control" type="password"
											name="userPwd" placeholder="비밀번호" required /> <br /> <input
											class="form-control" type="password" name="userPwds"
											placeholder="비밀번호 확인" required /> <br />
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" style="margin-left: 435px">취소</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" style="margin-left: 15px"
											data-toggle="modal" data-target="#update">확인</button>
									</div>
								</div>
							</div>
						</div> <!-- 로그인정보 확인 후 정보수정 창 -->
						<div class="modal fade" id="update">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">개인정보 수정</h4>
									</div>
									<div class="modal-body">
										<input type="password" name="userPwd" placeholder="새 비밀번호 입력"
											required class="form-control" /> <br /> <input
											type="password" name="userPwds" placeholder="새 비밀번호 확인"
											required class="form-control" /> <br /> <input type="text"
											name="userName" required class="form-control" /><br /> <input
											type="email" name="userEmail" required class="form-control" /><br />
										<input type="submit" value="취소" class="btn btn-danger"
											style="margin-left: 435px" data-dismiss="modal" /> <input
											type="submit" value="확인" class="btn btn-danger"
											style="margin-left: 15px" data-dismiss="modal" />
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="memberWithdrawal">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">회원탈퇴</h4>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<!-- 모델클래스에 저장된 아이디 불러오기 -->
										<input class="form-control" type="text" name="userId" readonly />
										<br /> <input class="form-control" type="password"
											name="userPwd" placeholder="비밀번호" required /> <br /> <input
											class="form-control" type="password" name="userPwds"
											placeholder="비밀번호 확인" required /> <br />
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" style="margin-left: 435px">취소</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" style="margin-left: 20px"
											data-toggle="modal" data-target="#withdrawal">획인</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="withdrawal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-body">Allways를 탈퇴하시겠습니까?</h4>
										<br /> <br /> <input type="submit" value="취소"
											class="btn btn-danger" style="margin-left: 435px"
											data-dismiss="modal" /> <input type="submit" value="확인"
											class="btn btn-danger" style="margin-left: 15px"
											data-dismiss="modal" onclick="location.href='login.jsp'" />
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row content">
			<div class="col-sm-10">
				<div class="row content">
					<!-- 배경사진 -->
					<div>
						<img id="backImg"
							src="/allways/resources/images/background_pro.jpg"
							onclick="location.href='#'">
					</div>
					<div class="btn-group btn-group-toggle" data-toggle="buttons" id="menubar">
						<label class="btn btn-secondary active">
							<input type="radio" name="options" id="option1"
							autocomplete="off" checked/>타임라인
						</label>
						 <label class="btn btn-secondary">
							<input type="radio" name="options" id="option2"
							autocomplete="off"/>포스팅
						</label>
					</div>
					<!-- 헤더 밑 프로필사진 -->
					<img id="profile"
						src="/allways/resources/images/default_profile_img.jpg"
						width="120px" height="120px">
					<div class="col-sm-4" style="padding: 0px;">
						<!-- 왼쪽 정보 및 상태 -->
						<div id="userInfo">
							<label style="margin-top: 5px;">생년 월일 :</label> <br /> 
							<label >이메일 :</label> <br /> 
							<label>학교 :</label> <br />
							<div class="dropdown" id="drop"
								style="text-align: right; margin: 5px;">
								<button class="btn btn-default dropdown-toggle" type="button"
									id="menu1" data-toggle="dropdown">
									내 상태 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1"
									style="float: right;">
									<li role="presentation"><img
										src="/allways/resources/images/happy.jpg"></li>
									<li role="presentation"><img
										src="/allways/resources/images/soso.jpg"></li>
									<li role="presentation"><img
										src="/allways/resources/images/sentimental.jpg"></li>
									<li role="presentation"><img
										src="/allways/resources/images/sad.jpg"></li>
									<li role="presentation"><img
										src="/allways/resources/images/dangerous.jpg"></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 가운데 메뉴바 -->
					<div class="col-sm-6 text-left">
						<div id="boardMake">
							<div>
								<div id="boards">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 오른쪽 메뉴바 -->
			<div class="col-sm-2 sidenav" style="height: 100%;">
				<form action="/action_page.php">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
				<table class="table table-hover" id="rightlist">
					<tbody>
						<tr>
							<td><a href="#">John</a></td>
						</tr>
						<tr>
							<td><a href="#">Mary</a></td>
						</tr>
						<tr>
							<td><a href="#">July</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>


</body>

<script id="" type="text/x-handlebars-template">
<div class="boardItem">

<div>
	
	<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg" style="border-radius: 30px; float: left;
					 padding: 8px" onclick="location.href='/'>
	<div style="display: inline-block;">
		<label style="font-size: small;">{{userId}}</label><br />
		<span style="font-size: x-small; color: gray;">0000년 00월 00일</span>	
	</div>

</div>
	
<details>
	<summary>진달래꽃 - 엄마야 누나야 (김소월)</summary>
	<p>엄마야 누나야, 강변 살자.<br />
	뜰에는 반짝이는 금모래 빛<br />
	뒷문 밖에는 갈잎의 노래<br />
	엄마야 누나야, 강변 살자.</p>
</details>

</script>




</html>















