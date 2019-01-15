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
	width: 1000px;
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
	width: 450px;
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
				<input id="uno" value="{{uno}}" type="hidden"/>
				<a id="userName" >{{userName}}</a>
				<a id="graduation">{{graduation}}</a>
				<button class="btnInsert">친구추가</button>
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
				<input id="allways-uno" value="{{uno}}" type="hidden"/>
				<a id="allwaysName" >{{allwaysName}}</a>
				<button class="allwaysDelete">친구끊기</button>
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
		
			});

			
			division.on('click', '.search-item .btnInsert', function() {
				
				var uno = 9;
				
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
						'uno' : uno,
						'allwaiser_uno' : allwaiser_uno
					}),
					success : function(data) {
						if (data == 1) {
							alert('친구 추가 성공');
						} else {
							alert('친구 추가 실패');
						}

					}
				});

			});

			var allwaysDivision = $('#allways-searchs');

			var allwaysSource = $('#allways-template').html();

			var allwaysTemplate = Handlebars.compile(allwaysSource);

			$('#btnallwaysSearch').click(function() {
			
				var allwaysName = $('#allwaysName').val();
				
				var uno = 9;
				
				allwaysDivision = $('#allways-searchs');

				allwaysSource = $('#allways-template').html();

				allwaysTemplate = Handlebars.compile(allwaysSource);
				
				allwaysDivision.empty();
				
				$.ajax({
					type: 'post',
					url: '/allways/search/allwaysSearch',
					headers: {
						'Content-Type': 'application/json',
						'X-HTTP-Method-Override': 'post'
					},
					data: JSON.stringify({
						'uno' : uno,
						'userName' : allwaysName
					}),
					success: function(data) {
						console.log(data)
						if (data != null) {
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
							alert('검색 실패');
						}
					}
					
			
				});
				
				
			});
			
			
			allwaysDivision.on('click', '.allways-item .allwaysDelete', function() {
				
				var uno = 9;
				
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
							'uno' : uno,
							'allwaiser_uno' : allwaiser_uno
						}),
						success: function(data) {
							
							if (data == 1) {
								alert('삭제 성공');
							} else {
								alert('삭제 실패');
							}
							
						}
					});
				}
				
				
			});
			
			
		
		});
	
	</script>
</body>
</html>



