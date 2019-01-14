<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>
<body>

<h1>댓글 테스트 페이지</h1>

<div id="replies" style="border-top: 1px solid gray;">
		
	<div id="replyInsert" class="container">
	<div class="row">
		<div class="col-xs-1  clearfix">
		<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		</div>
		<div class="col-xs-11">			
		<form class="input-group">
		
			<textarea id="content" class="autosize form-control" rows="1" placeholder="내용 입력" style="resize: none; margin: 8px"></textarea>
	
			<div class="input-group-btn">
				<button class="btn btn-default">
				<i class="glyphicon glyphicon-edit"></i>
				</button>
			</div>
		</form>
		</div>
	</div>	
	</div>
	
	<hr style="width: 95%; color: grey; height: 1px; background-color:grey; margin-bottom: 5px; margin-top: 5px" />
	
	
	<div id="replyItem" class="container" style="margin-bottom: 8px;">
	<div class="row">
		<div class="col-xs-1  clearfix">
		<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		</div>
		<div class="col-xs-11">			
			<div style="display: inline-block; margin-left: 8px">
				<a href = "/allways">{{userId}}</a>
				<span style="font-size: x-small; color: gray;">{{regDate}}</span>
			</div>
		<textarea id="content" class="autosize form-control" rows="1" placeholder="댓글 내용....." style="resize: none; margin-right: 8px; margin-left: 8px"></textarea>
		</div>
	</div>
	</div>

	<div id="replyItem" class="container" style="margin-bottom: 8px;">
	<div class="row">
		<div class="col-xs-1  clearfix">
		<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		</div>
		<div class="col-xs-11">			
			<div style="display: inline-block; margin-left: 8px">
				<a href = "/allways">{{userId}}</a>
				<span style="font-size: x-small; color: gray;">{{regDate}}</span>
			</div>
		<textarea id="content" class="autosize form-control" rows="1" placeholder="댓글 내용....." style="resize: none; margin-right: 8px; margin-left: 8px"></textarea>
		</div>
	</div>
	</div>	
	
	<div id="replyItem" class="container" style="margin-bottom: 8px;">
	<div class="row">
		<div class="col-xs-1  clearfix">
		<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		</div>
		<div class="col-xs-11">			
			<div style="display: inline-block; margin-left: 8px">
				<a href = "/allways">{{userId}}</a>
				<span style="font-size: x-small; color: gray;">{{regDate}}</span>
			</div>
		<textarea id="content" class="autosize form-control" rows="1" placeholder="댓글 내용....." style="resize: none; margin-right: 8px; margin-left: 8px"></textarea>
		</div>
	</div>
	</div>
	
</div>


<script>

$(document).ready(function(){
	
	$("textarea.autosize").on('keydown keyup', function () {
		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
		});
	
});

</script>


</body>
</html>