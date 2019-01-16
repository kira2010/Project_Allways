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
	height: 800px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #ffffff;
	height: 100%;
}
body {
	background-color: #f1f1f1;
	min-width: 600px;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (min-width: 350px) and (max-width: 767px) {
	.row.content {
		height: auto;
	}
}
#user {
	color: white;
	margin-top: 9px;
}

#drop {
	margin-top: 9px;
}

#text {
	width: 450px;
	margin-top: 9px;
	max-width: 450px;
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
	position: relative;
	
}

#profile {
	position: absolute;
	left: 7%;
	top: 70%;
}

#userName {
	position: absolute;
	left: 25%;
	top: 86%;
}

#btnSub {
	position: absolute;
	left: 83%;
	top: 86%;
}

#menubar {
	border: solid 1px grey;
	width: 100%;
	background-color: #ffffff;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#user-Info {
	border: solid 1px grey;
	margin-bottom: 15px;
	margin-top: 15px;
	background-color: #ffffff;
}

#emotion {
	width: 130px;
	height: 130px;
	margin-left: 40px;
}

.subscribe {
	display: none;
	margin-left: 10px;
}

.cancel {
	display: none;
	margin-left: 10px;
}

#option3 {
	visibility: visible;
}

.dropdown-menu {
	float: right;
}

</style>
</head>
<body>

<nav class="navbar navbar-inverse" id="header">
		<div class="container-fluid">
			<div class="content">
			
			<div class="navbar-header col-sm-4">
				<a class="navbar-brand" href="/allways"><img
					src="/allways/resources/images/allways.png" id="mainLogo"
					height="px" width="140px"></a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			
			<div id="myNavbar">
			<div class="navbar-collapse col-sm-5">
				<form action="/action_page.php">
					<div class="input-group" id="text" >
							<input type="text" class="form-control" placeholder="Search"
								name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>		
			
			<div class = "nav navbar-nav navbar-right col-sm-3">				
				<div class="dropdown input-group" id="drop">
					<input type="text" class="form-control" value="${check.userId} 님 안녕하세요!" readonly>
					<div class="input-group-btn">
					<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
					<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						<li role="presentation"><a role="menuitem" tabindex="-1"
							data-toggle="modal" data-target="#logout">로그아웃</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							data-toggle="modal" data-target="#updateInfo">개인정보 수정</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							data-toggle="modal" data-target="#memberWithdrawal">회원탈퇴</a></li>
					</ul>

					</div>
					
				</div>	
			
			</div>
			
			</div>
			</div>
		</div>
</nav>
	 <!-- dropDown아이템 다이얼로그 -->
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
										<input class="form-control" type="text" name="userId" value="${check.userId}" readonly />
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
										<input type="submit" value="취소" class="btn btn-danger" style="margin-left: 435px"
										data-dismiss="modal"/>

										<input type="submit" value="확인" class="btn btn-danger" style="margin-left: 15px"
										data-dismiss="modal"/>
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
										<input class="form-control" type="text" name="userId" value="${check.userId}" readonly />
										<br /> <input class="form-control" type="password"
											name="userPwd" placeholder="비밀번호" required /> <br /> <input
											class="form-control" type="password" name="userPwds"
											placeholder="비밀번호 확인" required /> <br />
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" style="margin-left: 435px"
											>취소</button>
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
										<br/>
										<br/>
										<input type="submit" value="취소" class="btn btn-danger" style="margin-left: 435px"
										data-dismiss="modal"/>
										<input type="submit" value="확인" class="btn btn-danger" style="margin-left: 15px"
										data-dismiss="modal" onclick="location.href='login.jsp'"/>
									</div>
								</div>
							</div>
						</div>

	<div class="container">
		<div class="row content">
			<div class="col-sm-9">
				<div class="content">				
					<div>
					<!-- 배경사진 -->
						<div id="backImg">	
							<img style="width: 100%;"
								src="/allways/resources/images/background_pro.jpg"
								onclick="location.href='#'">
							<div id="userName">
								<label id="name" style="font-size: 30px; color: white;"></label>										
							</div>
							<div id="btnSub">
								<input class="subscribe btn btn-light text-dark" type="submit" value="구독하기" />
								<input class="cancel btn btn-light text-dark" type="submit" value="구독취소하기" />
							</div>
							<!-- 헤더 밑 프로필사진 -->
							<div id="profile">
								<img 
									src="/allways/resources/images/default_profile_img.jpg"
									width="120px" height="120px" style="border-radius: 60px;">					
							</div>
						</div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons"
							id="menubar">
							<label class="btn btn-secondary active"> <input
								type="radio" name="options" id="option1" autocomplete="off"
								checked />타임라인	</label>
								<label class="btn btn-secondary"> <input type="radio"
								name="options" id="option2" autocomplete="off" />포스팅</label>
								<label class="btn btn-secondary" id="option3"> <input type="radio"
								name="options" autocomplete="off" />즐겨찾기
							</label>
						</div>
						
					</div>
					<div class="col-sm-3" style="padding: 0px;">
						<!-- 왼쪽 정보 및 상태 -->
						<div id="user-Info">
							<label style="margin-top: 5px;">생년 월일 :</label> 
							<fmt:formatDate value="${userInfo.birthDay}" pattern="yyyy년 MM월 dd일" var="birthDay"/>
							<label id="birth"></label> <br /> 
							<label>이메일:</label> <label id="email"></label><br />
							<label>학교 :</label> <label id="school"></label><br />
							<div class="dropdown" id="drop"
								style="text-align: right; margin: 5px;">
								<button class="btn btn-default dropdown-toggle"
									id="menu2" data-toggle="dropdown">
									내 상태 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1"
									style="float: right;" onselect="thisSelected()">
									<li role="presentation" value="1" id="img1"><img
										src="/allways/resources/images/happy.jpg"></li>
									<li role="presentation" value="2" id="img2"><img
										src="/allways/resources/images/soso.jpg"></li>
									<li role="presentation" value="3" id="img3"><img
										src="/allways/resources/images/sentimental.jpg"></li>
									<li role="presentation" value="4" id="img4"><img
										src="/allways/resources/images/sad.jpg"></li>
									<li role="presentation" value="5" id="img5"><img
										src="/allways/resources/images/dangerous.jpg"></li>
								</ul>
							</div>
							<div>
								<c:choose>
									<c:when test="${userInfo.emotion == '1'}">
										<img id="emotion" src="/allways/resources/images/happy.jpg">
									</c:when>
									<c:when test="${userInfo.emotion == '2'}">
										<img id="emotion" src="/allways/resources/images/soso.jpg">
									</c:when>
									<c:when test="${userInfo.emotion == '3'}">
										<img id="emotion" src="/allways/resources/images/sentimental.jpg">
									</c:when>
									<c:when test="${userInfo.emotion == '4'}">
										<img id="emotion" src="/allways/resources/images/sad.jpg">
									</c:when>
									<c:when test="${userInfo.emotion == '5'}">
										<img id="emotion" src="/allways/resources/images/dangerous.jpg">
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>

					<!-- 가운데 메뉴바 -->
					<div class="col-sm-6 text-left">
						<div id="boardMake">
							<div>
								<div id="boards"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 오른쪽 메뉴바 -->
			<div class="col-sm-3 sidenav">
			
			<form class="allwaiserForm">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-default">
						<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			
			<div id="myAllwayiserList">
			
				
			</div>
				
		</div>
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>


</body>



<script>
$(document).ready(function() {
	
	var emotion = null;
	var uno = ${userInfo.uno};
	console.log(uno);
	$('#img1').click(function() {
		$('#emotion').attr("src", "/allways/resources/images/happy.jpg");
		emotion = $('#img1').val();
		$.ajax({
			type: 'put',
			url: '/allways/userPage',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({
				'uno': uno,
				'emotion': emotion
			}),
			success: function(result) {
				alert('성공');
			}
		}); 
	});
	$('#img2').click(function() {
		$('#emotion').attr("src", "/allways/resources/images/soso.jpg");
		emotion = $('#img2').val();
		
		$.ajax({
			type: 'put',
			url: '/allways/userPage',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({
				'uno': uno,
				'emotion': emotion
			}),
			success: function(result) {
				alert('성공');
				$('#emotion').attr("src", "/allways/resources/images/soso.jpg");
			}
		}); 
	});
	$('#img3').click(function() {
		$('#emotion').attr("src", "/allways/resources/images/sentimental.jpg");
		emotion = $('#img3').val();
		$.ajax({
			type: 'put',
			url: '/allways/userPage',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({
				'uno': uno,
				'emotion': emotion
			}),
			success: function(result) {
				alert('성공');
			}
		}); 
	});
	$('#img4').click(function() {
		$('#emotion').attr("src", "/allways/resources/images/sad.jpg");
		emotion = $('#img4').val();
		$.ajax({
			type: 'put',
			url: '/allways/userPage',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({
				'uno': uno,
				'emotion': emotion
			}),
			success: function(result) {
				alert('성공');
			}
		}); 
	});
	$('#img5').click(function() {
		$('#emotion').attr("src", "/allways/resources/images/dangerous.jpg");
		emotion = $('#img5').val();
		$.ajax({
			type: 'put',
			url: '/allways/userPage',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'put'
			},
			data: JSON.stringify({
				'uno': uno,
				'emotion': emotion
			}),
			success: function(result) {
				alert('성공');
			}
		}); 
	});

	
	
	// MyPage
	if (${userInfo.uno} == ${check.uno}) {
		$('#user').append("${userInfo.userId}님 안녕하세요!");
		$('#name').append("${userInfo.userId}");
		$('#birth').append("${birthDay}");
		$('#email').append("${userInfo.userEmail}");
		
		if("${userInfo.graduation}" != null) {
			$('#school').append("${userInfo.graduation}");
		}
	// AllwaiserPage
	} else {
		$('#name').append("${userInfo.userId}");
		$('#birth').append("${birthDay}");
		$('#email').append("${userInfo.userEmail}");
		$('#menu2').html("<label>Allwaiser 상태</label>");
		$('.dropdown-menu').css('display', 'none');
		$('#option3').css("display", "none");
		if("${userInfo.graduation}" !== null) {
			$('#school').append("${userInfo.graduation}");
		}
		// 구독을 한 경우와 안한 경우
		// 구독버튼을 누르면 버튼이 사라지고 취소버튼 생성
		var uno = ${check.uno};
		var allwaiser_uno = ${userInfo.uno};
		console.log(uno);
		console.log(allwaiser_uno);
		$.ajax({
			type: 'post',
			url: '/allways/userPage',
			headers: {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'post'
			},
			data: JSON.stringify({
				'uno' : uno,
				'allwaiser_uno' : allwaiser_uno
			}),
			success: function(data) {
				console.log(data);
				if(data == 1) {
					$('.cancel').css("display", "inline");
				} else {
					$('.subscribe').css("display", "inline");
				}
			}
		});
	}
	
		$('.subscribe').click(function () {
			var uno = ${check.uno};
		
			var allwaiser_uno = ${userInfo.uno};
			$.ajax({
				type: 'post',
				url: '/allways/search/allwaysInsert',
				headers: {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'post'
				},
				data: JSON.stringify({
					'uno' : uno,
					'allwaiser_uno' : allwaiser_uno
				}),
				success: function(data) {
					if (data == 1) {
						alert('구독성공');
						$('.cancel').css("display", "inline");
						$('.subscribe').css("display", "none");
					} 
				}
			});
		});


		$('.cancel').click(function () {
			var uno = ${check.uno};
		
			var allwaiser_uno = ${userInfo.uno};
			$.ajax({
				type: 'post',
				url: '/allways/search/allwaysDelete',
				headers: {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'post'
				},
				data: JSON.stringify({
					'uno' : uno,
					'allwaiser_uno' : allwaiser_uno
				}),
				success: function(data) {
					if (data == 1) {
						alert('구독취소');
						$('.subscribe').css("display", "inline");
						$('.cancel').css("display", "none");
					} 
				}
			});
		});
		
});

</script>




</html>















