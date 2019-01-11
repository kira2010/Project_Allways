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

<style>


</style>

</head>

<body>

<nav class="navbar navbar-inverse" id="header">
		<div class="container-fluid">
			<div class="content">
			
			<div class="navbar-header col-sm-3">
				<a class="navbar-brand" href="main.jsp"><img
					src="/allways/resources/images/allways.png" id="mainLogo"
					height="px" width="140px"></a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			
			<div id="myNavbar">
			<div class="navbar-collapse col-sm-6">
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
			
			<div class = "nav navbar-nav navbar-right col-sm-3 container">
				
					
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
		<div class="row content ">
			<!-- 왼 쪽 메뉴바 -->
			<div class="col-sm-2 sidenav">
				<div class="left-menu">
					<a class="btn btn-default form-control" href="/allways/userPage/?uno=${check.uno}">
					<img alt="프로필"src="/allways+${check.pf_photo}"></a>
				</div>
				<div class="left-menu">
					<a class="btn btn-default form-control" id ="allwaiserSearchForm" >Allwaiser 찾기</a>
				</div>
				<div class="left-menu">
					<a class="btn btn-default form-control" href="">날씨</a>
				</div>
				
			</div>
			<!-- 가운데 메뉴바 -->
			<div class="col-sm-7 text-left">
				<div>
					<div id="boardMake">
						
					</div>
					<div id ="boards">		
					</div>
				</div>
			</div>
			<!-- 오른쪽 메뉴바 -->
			<div class="col-sm-3 sidenav">
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
				
				<div id="myAllwayiserList">
				
				
				</div>
				
			</div>
		</div>
	</div>
	
<footer class="container-fluid text-center">
	<p>Footer Text</p>
</footer>


<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>

<script  id="boardInsert" type="text/x-handlebars-template">

<div class = "boardInsertForm" style = "margin: 8px">
<span>게시물 작성하기</span></br>
<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
		style="border-radius: 30px; float: left; padding: 4px"
		onclick="location.href='/allways'">

<div style="margin-left: 40px">
<textarea id="content" class="autosize" placeholder="내용 입력" style="resize: none; border: 0; width: 100%;"></textarea>
</div>

<div id="fileList">
</div>

<div>
<form id="uploadForm" method="post" enctype="multipart/form-data">
	<label for="files" style="margin: 8px;">사진</label>
	
	<input id="files" type="file" style="display: none" />	

	<select id= privacyBounds>
		<option value="0">전체 공개</option>
		<option value="1">친구 공개</option>
		<option value="2">나만 보기</option>

	</select>	

	<span id="fileUploadBtn" style=" float:right; margin: 8px;">올리기</span>			
</form>
</div>
	
</div>

</script>

<script  id="boardItem" type="text/x-handlebars-template">
<div class="boardItem" style="border: solid 1px gray; margin: 8px">

	<div>
		<form>
		<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		<div style="display: inline-block;">
			<a href = "/allways">{{userId}}</a><br />
			<span style="font-size: x-small; color: gray;">{{regDate}}</span>
		</div>
		</form>
	</div>

	<details>
    	<summary>{{content_T}}</summary>
    	<p>{{content}}</p>
	</details>


	<div class="imageArea" style= "">

		<div id={{carousel}} class="carousel slide" data-ride="carousel"> 

			<ol class="carousel-indicators" id = {{uno_ol}}>
			</ol>

			<div class="carousel-inner" id = {{uno_div}}>
			</div>
 
		</div>
		
	</div>
	
<div class="container-fluid" style="margin: 8px">
	<div class="row">
		<div class="col-xs-6" style="text-align: center;" ><a>북마크</a></div>
		<div class="col-xs-6 " style="text-align: center;" ><a>댓글</a></div>
	</div>
</div>

</script>


<script>

$(document).ready(function(){
	
	
	var boardinsertsource = $('#boardInsert').html();
	var boardInsertTemplate = Handlebars.compile(boardinsertsource);

	function drowBoardInsert(){
		var boardInsertForm = boardInsertTemplate();
		$('#boardMake').append(boardInsertForm);
	};

	drowBoardInsert();

	
	var boardItemSource = $('#boardItem').html();
	console.log(boardItemSource);
	
	var boardItemTem = Handlebars.compile(boardItemSource);

	function getBoard(){	
	};

	function drowBoardItems(){
			
		$.getJSON('/allways/board/selectBoard', function(data){
			console.log(data);
			
			$(data).each(function(){
				var date = new Date(this.regDate);
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
					userId: this.userId,	
					regDate: dateString,
					content_T: topContent,
					content: subContent,
					carousel: this.bno+"Carousel",
					uno_ol: this.bno+"ol",
					uno_div: this.bno+"div"
				};
				
				var boardItem = boardItemTem(content);
				$('#boards').append(boardItem);
				
				if(this.photo){
					var photoList = this.photo.split(',');
					
					for(i = 0; i < photoList.length; i++){
					
					if(i == 0){
					loList = '<li data-target="#myCarousel" data-slide-to='+i+' class="active"></li>';
					divList = '<div class="item active">'	
							+'<img src="/allways'+photoList[i]+'" style="width: 100%" alt="First slide">'
							+'</div>'
					}else{
						loList = '<li data-target="#myCarousel" data-slide-to='+i+'></li>';
						divList = '<div class="item">'	
								+'<img src="/allways'+photoList[i]+'" style="width: 100%" alt="First slide">'
								+'</div>'
					}
							
							
						$('#'+this.bno+'ol').append(loList);
						$('#'+this.bno+'div').append(divList);
					};
					
					
					btn ='<a class="left carousel-control" href="#'+this.bno+'Carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> '
					+'<a class="right carousel-control" href="#'+this.bno+'Carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>'
					
					$('#'+this.bno+'Carousel').append(btn);
					
					
				};
				
				
			});
			
		});
			
	
	};

	drowBoardItems();
	
	$('#fileUploadBtn').click(function () {
		
		var content = $("#content").val();
		var privacyBounds = $("#privacyBounds").val();
		
		boardUpload(content, privacyBounds);
			
	});

	
	function drowAllwaiser(){
		
	}
	
});

</script>

<script type="text/javascript" src="/allways/resources/js/board.js"></script>

</body>

</html>















