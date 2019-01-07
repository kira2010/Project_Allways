<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Main Page</title>
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
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
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
</style>
</head>
<body>

	<nav class="navbar navbar-inverse" id="header">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.jsp"><img
					src="/resources/images/allways.png" class="center-block" id="mainLogo"></a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="d-flex justify-content-center bg-secondary mb-3">
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
										<button type="button" class="btn" data-dismiss="modal"
											>아니오</button>
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
											data-dismiss="modal" style="margin-left: 435px"
											>취소</button>
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
											required class="form-control"/> <br/>
										<input type="password" name="userPwds" placeholder="새 비밀번호 확인"
										required class="form-control"/> <br/>
										<input type="text" name="userName" required class="form-control"/><br/>
										<input type="email" name="userEmail" required class="form-control"/><br/>
										<input type="submit" value="취소" class="btn btn-danger" style="margin-left: 435px"/>

										<input type="submit" value="확인" class="btn btn-danger" style="margin-left: 15px"/>
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
										<button type="button" class="close" data-dismiss="modal">×</button>
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
											data-dismiss="modal" style="margin-left: 435px"
											>취소</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" style="margin-left: 20px"
											data-toggle="modal" data-target="#update">획인</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="memberWithdrawal">
							<div class="modal-dialog">
								<div class="modal-content"></div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row content">
			<!-- 왼 쪽 메뉴바 -->
			<div class="col-sm-2 sidenav">
				<ul id="leftlist">
					<li id="l1"><a href="mypage.jsp"><img alt="프로필"
							src="images/allways.png"></a></li>
					<li id="l2"><a href="allwaiser.jsp">Allwaiser 찾기</a></li>
					<li id="l3"><a href="">날씨</a></li>
				</ul>
			</div>
			<!-- 가운데 메뉴바 -->
			<div class="col-sm-8 text-left">
				<div id="boardMake">
					<div>
						게시물 만들기
						<div></div>
					</div>
				</div>
			</div>
			<!-- 오른쪽 메뉴바 -->
			<div class="col-sm-2 sidenav">
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
</html>















