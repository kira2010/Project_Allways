<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
#jb-container {
	width: 1100px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#jb-header {
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #bcbcbc;
}

#jb-sidebar-left {
	width: 160px;
	padding: 20px;
	margin-right: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-content {
	width: 550px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-sidebar-right {
	width: 300px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}

#jb-footer {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

label {
	margin-top: 7.5px;
	margin-bottom: 7.5px;
}

button {
	 background-color: white;
  color: black;
  border: 2px solid #4CAF50;
}

</style>
<title>CSS</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<h1>3-Column Layout</h1>
		</div>
		<div id="jb-sidebar-left">
			<h2>Sidebar</h2>
			<ul>
				<li>Lorem</li>
				<li>Ipsum</li>
				<li>Dolor</li>
			</ul>
		</div>
		<div id="jb-content">
			<h2>검색 조건</h2>
			<hr>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<form class="form-inline">

					<input id="name" class="form-control mr-sm-2" type="text" placeholder="이름">
					<input id="graduation" class="form-control mr-sm-2" type="text" placeholder="학교">
					<button id="search" type="button"
						class="btn btn-outline-light text-dark">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</form>
			</nav>

			<h2>검색 확인</h2>
			<div id="searchs">
			
			</div>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js">
			</script>
			<script id="search-template" type="text/x-handlebars-template" >
			<div class="search-item">
				<div class="boardItemHeader">
					<div style="display: inline-block;">
					<img src="/allways/resources/images/default_profile_img.jpg" height="40px" width="40px" class="img-circle">
						<a id="userName" >{{userName}}</a>
						<span id="graduation" style:"font-size: x-small; color: gray;">{{graduation}}</span>
					</div>
					<div class="insert" style="float: right;">	
						<input id="uno" value="{{uno}}" type="hidden"/>
						<button class="btnInsert">구독추가</button>
					</div>
				</div>		
			</div>
			</script>
		</div>
		<div id="jb-sidebar-right">
			<h2>친구</h2>
				
				<form class="form-inline">

					<input id="allwaysName" class="form-control mr-sm-2" type="text" placeholder="친구 이름">
					<button id="btnallwaysSearch" type="button"
						class="btn btn-outline-light text-dark">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</form>
				
			<script id="allways-template" type="text/x-handlebars-template" >
			<div class="allways-item">
				<img src="/allways/resources/images/default_profile_img.jpg" height="30px" width="30px" class="img-circle">
				<a id="allwaysName" >{{allwaysName}}</a>
				<div class="delete" style="float: right;">	
						<input id="allways-uno" value="{{uno}}" type="hidden"/>
						<button class="btnDelete">구독끊기</button>
				</div>
			</div>
			</script>
		
			<script id="all-allways-template" type="text/x-handlebars-template" >
			<div class="all-allways-item">
				<input id="allways-uno" value="{{uno}}" type="hidden"/>
				<img src="/allways/resources/images/default_profile_img.jpg" height="60px" width="60px" class="img-circle">
				<a id="allwaysName" >{{allwaysName}}</a>
			</div>
			</script>
			
			<div id="allways-searchs" >
				
			</div>
		</div>
		<div id="jb-footer">
			<p>Copyright</p>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			var userName = $('#name').val();
			
			var graduation = $('#graduation').val();
			
			var division = $('#searchs');
			
			var source = $('#search-template').html();
			
			var template = Handlebars.compile(source);
			
	
			$('#search').click(function() {
				
				getSearch();
		
			});

			
			division.on('click', '.btnInsert', function() {
				
				var myUno = 9;
				
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
							alert('구독 추가 성공');
							getSearch();
							getAllAllways();
						} else {
							alert('구독 중 입니다.');
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
				
				var myUno = 9;
				
				var allwaiser_uno = parseInt($(this).prevAll('#allways-uno').val());
				
				
				console.log(allwaiser_uno);
				var result = confirm('친구를 삭제 하시겠습니까?');
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
								alert('삭제 성공');
								getAllAllways();
								getSearch();
							} else {
								alert('삭제 실패');
							}
							
						}
					});
				}
				
				
			});
			
			
			function getAllAllwaysSearch() {
				
				var allwaysName = $('#allwaysName').val();
				
				var myUno = 9;
				
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
										allwaysName: value.userName
								}
								
								console.log(content);
								
								var allwaysSearchItem = allwaysTemplate(content);
								
								allwaysDivision.append(allwaysSearchItem);
								
								
							});
							
							
						} else {
							alert('검색할 내용이 없습니다.');
							getAllAllways();
						}
					}
					
			
				});
				
				
			}
			
			function getAllAllways() {
				
				var myUno = 9;
				
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
											allwaysName: value.userName
									}
									
									var allwaysSearchItem = allwaysTemplate(content);
									
									allwaysDivision.append(allwaysSearchItem);
							})
						}
							
					})
				
				}
			
				function getSearch() {
					
					var myUno = 9;
					
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
										graduation: value.graduation
								}
								
								console.log(content);
								
								var searchItem = template(content);
								
								division.append(searchItem);
							});
							
							
						}
						
					});
				}	
			
			
			getAllAllways();
		
		});
	
	</script>
</body>
</html>



