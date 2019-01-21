<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<h2>즐겨 찾기</h2>
			
			<div id="favorite-board"></div>
			
			<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
			
			<script id="favoriteBoardItem" type="text/x-handlebars-template">
<div class="boardItem">

	<div class="boardItemHead">

		<img id = "profile" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		<div style="display: inline-block;">
			<a href = "/allways">{{userId}}</a><br />
			<span style="font-size: x-small; color: gray;">{{regDate}}</span>
		</div>

	</div> <!-- BoardItemHead -->
	
	
	<details>
		<summary>{{content_T}}</summary>
    	<p>{{content}}</p>
	</details>
	
	<div class="imageArea" id="{{imageArea}}" data-bno="{{bno}}" style= "margin: 8px">
					
	</div>
	

<div class="container-fluid boardTail">
	<div class="row">
		<div class="col-xs-6" style="text-align: center;" >
			<input id="bno" value="{{bno}}" type="hidden"/>		
			<button id="{{bookMark}}" class = "btnBookmarkDelete" >북마크 끊기</button>
		</div>
		<div class="col-xs-6 " style="text-align: center;" >
			<button data-bno="{{bno}}" class="reply btn"  >댓글</button>
		</div>
	</div>

</div>


</div>

<div id= "{{replyArea}}" class= "replyArea">
</div>


</script>


		</div>
		<div id="jb-sidebar-right"></div>
		<div id="jb-footer">
			<p>Copyright</p>
		</div>
	</div>

<script>
$(document).ready(function() {
	
	var myUno = 2;
		
	var division = $('#favorite-board');
	
	var source = $('#favoriteBoardItem').html();
	
	var templete = Handlebars.compile(source);
	
	getFavorite();
	
	
	function getFavorite() {
	
	division.empty();
	
	$.ajax({
		type : 'post',
		url : '/allways/favorite/list',
		headers : {
			'Content-Type' : 'application/json',
			'X-HTTP-Method-Override' : 'post'
		},
		data: JSON.stringify({
			'uno' : myUno
		}),
		success : function(data) {
			
			

				
				$(data).each(function(index, value) {
					
					var date = new Date(value.regDate);
					var dateString = date.toLocaleDateString();
					var topContent;
					var subContent;
					
					if(this.content.length >= 14){
						topContent = this.content.substr(0,15)+"...";
						subContent = this.content.substr(15, this.content.length);
					}else{
						topContent = this.content
					}
					
					var content = {
							userId: value.userId,	
							regDate: dateString,
							content_T: topContent,
							content: subContent,
							imageArea: value.bno+"imgArea",
							bookMark:value.bno+"-bookMark",
							bno: value.bno,
							replyArea: value.bno+"replyArea",
							boardDeleteBtn: value.bno+"-boardDeleteBtn",
							boardUpdate: value.bno+"boardUpdate",
							boardDelete: value.bno+"boardDelete"
						};
					console.log(content);
					var favoriteBoardItem = templete(content);
					division.append(favoriteBoardItem);
				});
			}

	});
	
	}
	
	
	division.on('click', '.btnBookmarkDelete', function() {
		
		var bno = $(this).prevAll('#bno').val();
		
		$.ajax({
			type: 'post',
			url: '/allways/favorite/delete',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'post'
			},
			data: JSON.stringify({
				'uno' : myUno,
				'bno' : bno
			}),
			success: function(data) {
				
				if (data == 1) {
					alert('삭제 성공');
					getFavorite();
				} else {
					alert('삭제 실패');
				}
				
			}
			
		});
		
	})
	
});

</script>

</body>
</html>