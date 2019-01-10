
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
	width: 940px;
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
	width: 160px;
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

					<input id="name" class="form-control mr-sm-2" type="text" value="${user.userName}"
						placeholder="이름,학교">
					<button id="search" type="button"
						class="btn btn-outline-light text-dark">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</form>
			</nav>

			<h2>검색 확인</h2>
			<div id="replies">
			
			</div>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js">
			</script>
			<script id="reply-template" type="text/x-handlebars-template" >
			<div class="reply-item">
				<a id="userName" >{{userName}}</a>
				<a id="graduation">{{graduation}}</a>
				<button id="friendInsert">친구추가</button>
			</div>
			</script>
		</div>
		<div id="jb-sidebar-right">
			<h2>Sidebar</h2>
			<ul>
				<li>Lorem</li>
				<li>Ipsum</li>
				<li>Dolor</li>
			</ul>
		</div>
		<div id="jb-footer">
			<p>Copyright</p>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			var name = $('#name').val();
			
			var division = $('#replies');
			
			var source = $('#reply-template').html();
			
			var template = Handlebars.compile(source);
			
			function getAllSearch() {
				console.log('/allways/replies/all/' + name);
				
				$.getJSON('/allways/replies/all/' + name, function(data) {
					
					division.empty();
					
					console.log(data);
				
					$(data).each(function() {
						
						console.log(this);
						
						var content = {
							userName: this.userName,
							graduation: this.graduation
						};
						
						var replyItem = template(content);
						
						division.append(replyItem);

					});
				});

			}

			$('#search').click(function() {

				name = $('#name').val();
				
				
				if (name == "") {
					alert('이름이나 아이디를 입력하세요');
				}
				
				getAllSearch();
				
			});

		});
	</script>
</body>
</html>
