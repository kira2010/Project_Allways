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
		
			
		</div>
		<div id="jb-sidebar-right">
			<h2>친구</h2>
			
			<div id="add-recommended"></div>
			
			<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
			
			<script id="recommended-template" type="text/x-handlebars-template" >
			<div class="all-allways-item">
				<input id="allways-uno" value="{{uno}}" type="hidden"/>
				<img src="/allways/resources/images/default_profile_img.jpg" height="60px" width="60px" class="img-circle">
				<a id="allwaysName" >{{userName}}</a>
			</div>
			</script>
		
		
		
		</div>
		<div id="jb-footer">
			<p>Copyright</p>
		</div>
	</div>
	
	
	<script>
	$(document).ready(function() {
		
		getremmended();
		
		function getremmended() {
		
		var myUno = 2;
		
		var graduation = "아이티윌";
		
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
						userName : value.userName
					}
				
					var remmendedItem = template(content);
				
					division.append(remmendedItem);
				
				});	
				
			}	
		});
		
		}
	});
	
	
	</script>
	
	
	</body>
	
	</html>
	