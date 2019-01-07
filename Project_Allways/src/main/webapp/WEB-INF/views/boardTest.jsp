<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.boardItem {
	border: solid 1px gray;
}
</style>

<meta name = "viewport" content = "width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
</head>
<body>

<div class="boardItem">
		
	<div>
		<img src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px">
		<div style="display: inline-block;">
			<a style="font-size: small;">아이디</a><br />
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
	
	
	<div class="imageArea">
	
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg" style="width:100%" alt="First slide">
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
		<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
	</div>
	
	
	</div>
	
<div class="container-fluid" style="margin: 8px">
	<div class="row">
		<div class="col-xs-6" style="text-align: center;" ><a>북마크</a></div>
		<div class="col-xs-6 " style="text-align: center;" ><a>댓글</a></div>
	</div>
</div>

</div>


<script>	


</script>


</body>



</html>