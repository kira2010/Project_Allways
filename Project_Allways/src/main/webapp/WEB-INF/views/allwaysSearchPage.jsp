<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<link rel="stylesheet" type="text/css" href="/allways/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="/allways/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/allways/resources/css/allwaiserSearch.css">

<style>


</style>

</head>

<body>

<nav class="navbar-inverse" id="header">
		<div class="container-fluid">
			<div class="row">
			
			<div class="col-sm-3">
				<a class="navbar-brand" href="/allways/"><img
					src="/allways/resources/images/allways.png" id="mainLogo"
					height="px" width="140px"></a>
			</div>
			
		<div class="col-sm-6">
			<div style="padding: 13px">
				<form class="form-inline boardSearchForm" action="/allways/board/searchPage" method="get">
					<select class="btn" id="searchBounds" name ="searchBounds" style="display: inline-block;">
						<option value="1">내용 검색</option>
						<option value="2">ID 검색</option>
						<option value="3">태그검색</option>
					</select>
					
					<input id="searchKeyword" name="searchKeyword" class="form-control" type="text" placeholder="search">
					<button id="searchKeywordBtn" type="submit" class="btn btn-outline-light text-dark">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</form>
			</div>
		</div>		
			
			<div class = "col-sm-3">				
				<div class="dropdown input-group" id="drop">
					<input type="text" class="form-control" style="width:auto; " value="${check.userId} 님 안녕하세요!" readonly>
					<div class="input-group-btn" style="float: left;">
					<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
					<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="menu1" style="right: 0; left: auto;">
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
</nav>

				
<div class="container">
	<div class="row content ">
		<!-- 왼 쪽 메뉴바 -->
		<div class="col-sm-2 sidenav">
			<div class="left-menu">
				<a class="btn" href="/allways/userPage?uno=${check.uno}">
				<img alt="프로필" id="sidProfile" src="/allways/resources/images/default_profile_img.jpg"
				 class="img-circle"
				 style="width: 60%;">
				 <span style="vertical-align: bottom;">내 페이지</span>
				</a>
			</div>
			<div class="left-menu">
				<a class="btn btn-default form-control left-menu-a" id ="allwaiserSearchForm" href="/allways/search/allwaysSearchPage" >Allwaiser 찾기</a>
			</div>
			<div class="left-menu">
				<a class="btn btn-default form-control left-menu-a" href="">추천 Allwaiser</a>
				<div id="add-recommended">
				</div>
			</div>
				
		</div>

		<!-- 가운데 메뉴바 -->
		<div class="col-sm-7 text-left">
			<div>
				<div id="boardMake">	
				</div>
				
				<div id ="boards">		
				</div>
				
				<div id="jb-content">
					<div id="searchForm">
					</div>
					
					<div id="searchs">
					</div>
				</div>
				
				
			</div>
		</div>
		
		<!-- 오른쪽 메뉴바 -->
		<div class="col-sm-3 sidenav">
			<div style="font-size:large; background-color: #ffffff; margin-bottom: 1px; margin-left: 8px;">
					Following 리스트
			</div>
			
			<form class="form-inline myAllayierSearch">
				<input id="searchAllwaysName" class="form-control" type="text" placeholder="Allwaiser 이름">
				<button id="btnallwaysSearch" type="button"
				class="btn btn-outline-light text-dark">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
			
			<div id="allways-searchs" >
				
			</div>
				
		</div>
	</div>
</div>

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
					<button type="button" class="btn" data-dismiss="modal">아니오</button>
					<button type="button" class="btn" data-dismiss="modal" id="checkLogout">예</button>
				</div>

			</div>
		</div>
</div>

<div class="modal fade" id="updateInfo">
	<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 확인</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<!-- 모델클래스에 저장된 아이디 불러오기 -->
					<h5>확인을 위해 비밀번호를 입력해 주세요!</h5>
					<input class="form-control" type="text" name="userId"
						value="${check.userId}" id="Id" readonly /> <br /> <input
						class="form-control" type="password" name="userPwd"
						placeholder="비밀번호" required id="pwd" /><br />
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						style="margin-left: 435px">취소</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						style="margin-left: 15px" data-toggle="modal" id="checkUser">확인</button>
				</div>
			</div>
		</div>
</div>
	
<!-- 로그인정보 확인 후 정보수정 창 -->
<div class="modal fade" id="update">
	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">개인정보 수정</h4>
				</div>

				<div class="modal-body">
					<h5>비밀번호를 수정하지 않는다면 회원님의 비밀번호를 다시 기입해 주세요.</h5>
					<input type="password" name="userPwd" id="newPwd"
						placeholder="새 비밀번호 입력" required class="form-control" /> <br />
					<input type="password" name="userPwds" id="newPwds"
						placeholder="새 비밀번호 확인" required class="form-control" /> <br />
					<input type="email" name="userEmail" id="newEmail" required
						class="form-control" value="${check.userEmail}" /><br /> <input
						type="text" name="graduation" id="newGrad" required
						class="form-control" value="${check.graduation}" /><br /> <input
						type="submit" value="취소" class="btn btn-danger"
						style="margin-left: 435px" data-dismiss="modal" /> <input
						type="button" value="확인" class="btn btn-danger"
						style="margin-left: 15px" data-dismiss="modal" id="nUpdate" />
				</div>
			</div>
		</div>
</div>

<div class="modal fade" id="memberWithdrawal">
	<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 확인</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<!-- 모델클래스에 저장된 아이디 불러오기 -->
					<h5>확인을 위해 비밀번호를 입력해 주세요!</h5>
					<input class="form-control" type="text" name="userId"
						value="${check.userId}" id="userId" readonly /> <br /> <input
						class="form-control" type="password" name="userPwd"
						placeholder="비밀번호" required id="userPwd" /> <br />
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						style="margin-left: 435px">취소</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						style="margin-left: 20px" data-toggle="modal" id="userCheck">획인</button>
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
						data-dismiss="modal" id="checkDelete" />
				</div>
			</div>
		</div>
</div>
	
<footer class="container-fluid text-center">
	<p>Footer Text</p>
</footer>


<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>

<script id="search-condition-template" type="text/x-handlebars-template" >
<nav class="search-condition">
	<div class="search-condition-title" >Allwaiser 검색하기</div>
	<form class="form-inline">
		<input id="name" class="form-control mr-sm-2" type="text" placeholder="이름">
		<input id="graduation" class="form-control mr-sm-2" type="text" placeholder="학교">
		<button id="search" type="button"
		class="btn btn-outline-light text-dark">
		<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
	</form>
</nav>
</script>

<script id="search-template" type="text/x-handlebars-template" >
	<div class="search-item">
		<div class="boardItemHeader">
			<div style="display: inline-block;">
				<img class="img-circle myAllaiserProfile" data-uno = "{{uno}}" src="/allways/resources/images/default_profile_img.jpg" height="40px" width="40px">
				<a id="searchUserName" href="/allways/userPage?uno={{uno}}">{{userName}}</a>
				<span style:"font-size: x-small; color: #f1f1f1;">({{userId}})</span>
				<span id="graduation" style:"font-size: x-small; color: gray;">{{graduation}}</span>
			</div>
			<div class="insert" style="float: right;">	
				<input id="uno" value="{{uno}}" type="hidden"/>
				<a class="btn btn-default btnInsert">Follow 추가</a>
			</div>
		</div>		
	</div>
</script>

<script id="allways-template" type="text/x-handlebars-template" >
	<div class="allways-item">
		<img class="img-circle myAllaiserProfile" data-uno = "{{uno}}" src="/allways/resources/images/default_profile_img.jpg" height="45px" width="45px">
		<a id="allwaysName" href="/allways/userPage?uno={{uno}}">{{allwaysName}}</a>
		<span style:"font-size: x-small; color: #f1f1f1">({{userId}})</span>
		<div class="delete" style="float: right;">	
				<input id="allways-uno" value="{{uno}}" type="hidden"/>
				<button class="btn btn-default btnDelete">Follow 해제</button>
		</div>
	</div>
</script>
		
<script id="all-allways-template" type="text/x-handlebars-template" >
	<div class="all-allways-item">
		<input id="allways-uno" value="{{uno}}" type="hidden"/>
		<img class="img-circle myAllaiserProfile" data-uno = "{{uno}}" src="/allways/resources/images/default_profile_img.jpg" height="45px" width="45px">
		<a id="allwaysName" href="/allways/userPage?uno={{uno}}" >{{allwaysName}}</a>
		<span style:"font-size: x-small; color: #f1f1f1;">({{userId}})</span>
	</div>
</script>
		
<script id="recommended-template" type="text/x-handlebars-template" >
	<div class="all-allways-item">
		<input id="allways-uno" value="{{uno}}" type="hidden"/>
		<img data-uno = "{{uno}}" src="/allways/resources/images/default_profile_img.jpg" height="45px" width="45px" class="img-circle recommendedProfile">
		<a id="allwaysName" href="/allways/userPage?uno={{uno}}" >{{userName}}</a>
		<span style:"font-size: x-small; color: #f1f1f1;">({{userId}})</span>
	</div>
</script>


<script>
$(document).ready(function(){
	
	if('${check.pf_photo}'){	
		var url = '/allways'+'${check.pf_photo}';
		$('#sidProfile').attr('src', url);
	}
	
	var source = $('#search-condition-template').html();
	var template = Handlebars.compile(source);

	drowSearchAllwaiserCondition();	
	
	function drowSearchAllwaiserCondition(){
		var templateItem = template();
		$('#searchForm').empty();
		$('#searchForm').append(templateItem);
	};
			
});
</script>		

<script>
$(document).ready(function() {

	var userName = $('#name').val();			
	var graduation = $('#graduation').val();
	
	var division = $('#searchs');		
	
	var source = $('#search-template').html();
	var template = Handlebars.compile(source);
			
 	$(document).on("click", '#search', function () {
		getSearch();
	});
				
	division.on('click', '.btnInsert', function() {
				
		var myUno = ${check.uno};
				
		var allwaiser_uno = $(this).prevAll('#uno').val();
		console.log(allwaiser_uno);

		$.ajax({
			type : 'post',
			url : '/allways/search/allwaysInsert/',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'post'
			},
			data: JSON.stringify({
				'uno' : myUno,
				'allwaiser_uno' : allwaiser_uno
			}),
			success : function(data) {
				if (data == 1) {
					alert('Follow 되었습니다!');
					getSearch();
					getAllAllways();
				} else {
					alert('이미 Follow 중 입니다.');
				}

			}
		});

	});

	var allwaysDivision = $('#allways-searchs');

	var allwaysSource = $('#allways-template').html();

	var allwaysTemplate = Handlebars.compile(allwaysSource);

	$('#btnallwaysSearch').click(function() {
			
		getAllAllwaysSearch();
				
	});
			
			
	allwaysDivision.on('click', '.allways-item .btnDelete', function() {
				
		var myUno = ${check.uno};
				
		var allwaiser_uno = parseInt($(this).prevAll('#allways-uno').val());
				
				
		console.log(allwaiser_uno);
		var result = confirm('Follow 를 해제 하시겠습니까?');
		if (result == true) {
			$.ajax({
				type: 'post',
				url: '/allways/search/allwaysDelete',
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'post'
				},
				data: JSON.stringify({
					'uno' : myUno,
					'allwaiser_uno' : allwaiser_uno
				}),
				success: function(data) {
							
					if (data == 1) {
						alert('해제 되었습니다.');
						getAllAllways();
						getSearch();
					} else {
						alert('해제 실패하였습니다. 관리자에게 문의 주세요.');
					}
							
				}
			});
		}
				
				
	});
			
			
	function getAllAllwaysSearch() {
				
		var allwaysName = $('#searchAllwaysName').val();
				
		var myUno = ${check.uno};
				
		allwaysDivision = $('#allways-searchs');

		allwaysSource = $('#allways-template').html();

		allwaysTemplate = Handlebars.compile(allwaysSource);
				
		allwaysDivision.empty();
				
		if (allwaysName == "") {
			alert('이름을 작성해주세요');
		}	
				
		$.ajax({
			type: 'post',
			url: '/allways/search/allwaysSearch',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'uno' : myUno,
				'userName' : allwaysName
			}),
			success: function(data) {
				console.log(data)
				if (data != "") {
					alert('검색 성공');
							
					$(data).each(function(index, value) {
						console.log(value.uno);
								
						var content = {
								uno : value.uno,
								userId: value.userId,
								allwaysName: value.userName
						}
								
						console.log(content);
								
						var allwaysSearchItem = allwaysTemplate(content);
								
						allwaysDivision.append(allwaysSearchItem);
						
						if(this.pf_photo){
							var url = '/allways'+this.pf_photo;
							$('.myAllaiserProfile[data-uno='+this.uno+']').attr('src', url);
						}
								
					});
							
							
				} else {
					alert('검색할 내용이 없습니다.');
					getAllAllways();
				}
			}
					
			
		});
				
				
	}
			
	function getAllAllways() {
				
		var myUno = ${check.uno};
				
		var allwaysDivision = $('#allways-searchs');

		var allwaysSource = $('#all-allways-template').html();

		var allwaysTemplate = Handlebars.compile(allwaysSource);
				
		allwaysDivision.empty();
		$.ajax ({
			type: 'post',
			url: '/allways/search/allAllways',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'uno' : myUno
			}),
			success: function(data) {
				
				$(data).each(function(index, value) {
						
					var content = {
						uno : value.uno,
						userId: value.userId,
						allwaysName: value.userName
					}
									
					var allwaysSearchItem = allwaysTemplate(content);
									
					allwaysDivision.append(allwaysSearchItem);
									
					if(this.pf_photo){
						var url = '/allways'+this.pf_photo;
						$('.myAllaiserProfile[data-uno='+this.uno+']').attr('src', url);
					}
				});
			}
							
		});
				
	}
			
	function getSearch() {
					
		var myUno = ${check.uno};
					
		userName = $('#name').val();
					
		graduation = $('#graduation').val();
					
		division = $('#searchs');
					
		source = $('#search-template').html();
					
		template = Handlebars.compile(source);
					
		division.empty();
					
		$.ajax({
			type: 'post',
			url: '/allways/search/user',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'uno': myUno,
				'userName': userName,
				'graduation': graduation
			}),
			success: function(users) {
							
				console.log(users);
				$(users).each(function(index, value){
				console.log(index, value);
				var content = {
					uno : value.uno,
					userName: value.userName,
					userId: value.userId,
					graduation: value.graduation
					}
								
					console.log(content);
								
					var searchItem = template(content);
								
					division.append(searchItem);
								
					if(this.pf_photo){
						var url = '/allways'+this.pf_photo;
						$('.myAllaiserProfile[data-uno='+this.uno+']').attr('src', url);
					}
							
				});
							
							
			}
						
		});
	}	
						
	getAllAllways();
		
});
	
</script>

<script>
$(document).ready(function() {
	
	getremmended();
	
	function getremmended() {
	
	var myUno = ${check.uno};
	
	var graduation = '${check.graduation}';
	
	var division = $('#add-recommended');
	
	var source = $('#recommended-template').html();
	
	var template = Handlebars.compile(source);
	
	division.empty();
	
	$.ajax({
		type: 'post',
		url: "/allways/remmended/subscribe",
		headers : {
			'Content-Type' : 'application/json',
			'X-HTTP-Method-Override' : 'post'
		},
		data: JSON.stringify({
			'uno' : myUno,
			'graduation' : graduation
		}),
		success : function(data) {
			console.log(data);
			
			$(data).each(function(index, value) {
				
				var content = {
					uno : value.uno,
					userName : value.userName,
					userId : value.userId
				}
			
				var remmendedItem = template(content);
			
				division.append(remmendedItem);
			
				if(value.pf_photo){
					var url = '/allways'+value.pf_photo;
					$('.recommendedProfile[data-uno='+value.uno+']').attr('src', url);
				}
				
			});	
			
		}	
	});
	
	}
});
</script>

<script>
$(document).ready(function(){
$('#checkLogout').click(function() {
	alert('로그아웃 되었습니다!');
	location.href='/allways/logout';
});
	
$("#checkUser").on('click', function () {
	var userId = $('#Id').val();
	var userPwd = $('#pwd').val();
	
	$.ajax({
		type : 'post',
		url : '/allways/userCheck',
		contentType: 'application/x-www-form-urlencoded',
		data : {
			'userId' : userId,
			'userPwd' : userPwd,
		},
		success : function(result) {
			if (result) {
				alert('확인되었습니다!');
				$('#update').modal('show');
			} else {
				alert('잘못입력하였습니다. 비밀번호를 다시 입력해주세요.');
				$("#pwd").val('');
			}
		}
	});
});

$("#userCheck").on('click', function () {
	var userId = $('#userId').val();
	var userPwd = $('#userPwd').val();
	
	$.ajax({
		type : 'post',
		url : '/allways/userCheck',
		contentType: 'application/x-www-form-urlencoded',
		data : {
			'userId' : userId,
			'userPwd' : userPwd,
		},
		success : function(result) {
			if (result) {
				alert('확인되었습니다!');
				$('#withdrawal').modal('show');
			} else {
				alert('잘못입력하였습니다. 비밀번호를 다시 입력해주세요.');
				$("#userPwd").val('');
			}
		}
	});
});


$('#nUpdate').click(function() {
	var userPwd = $('#newPwd').val();
	var userPwds = $('#newPwds').val();
	
	console.log('수정할 pw1 : ', userPwd);
	console.log('수정할 pw2 : ', userPwds);
	
	if(userPwd.length < 8){	
		alert('8자 이상으로 입력해주세요!');
	} else if(userPwd != '' && userPwds != '' && userPwd !== userPwds){
		alert('비밀번호가 같지 않습니다!');
	} else {
		updateUser(userPwd);
	}
});

function updateUser(userPwd) {
	
	var userEmail = $('#newEmail').val();
	var graduation = $('#newGrad').val();
	var uno = ${check.uno};			
	
	$.ajax({
		type : 'post',
		url : '/allways/userUpdate',
		headers: {
			'Content-Type' : 'application/json',
			'X-HTTP-Method-Override' : 'post'
		},
		data : JSON.stringify({
			'userPwd' : userPwd,
			'userEmail' : userEmail,
			'graduation' : graduation,
			'uno' : uno
		}),
		success : function(data) {
			if (data == 1) {
				alert('회원정보 수정완료');
				location.replace('/allways');
			} else {
				alert('회원정보 수정실패');
			}
		}
	});
}
	$('#checkDelete').click(function() {
		alert('그 동안 Allways와 함께해 주셔서 감사합니다.');
		location.href='/allways/deleteUser';
	});

});
</script>



<!-- <script type="text/javascript" src="/allways/resources/js/board.js"></script>
 -->
</body>

</html>















