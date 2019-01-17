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


<style>


</style>

</head>

<body>

<nav class="navbar-inverse" id="header">
		<div class="container-fluid">
			<div class="content">
			
			<div class="col-sm-3">
				<a class="navbar-brand" href="/allways/"><img
					src="/allways/resources/images/allways.png" id="mainLogo"
					height="px" width="140px"></a>
			</div>
			
			<div class="col-sm-6">
				<form action="/action_page.php">
					<div class="input-group" id="text" >
							<input type="text" class="form-control" placeholder="Search"
								name="search">
						<div class="input-group-btn">
							<button class="btn btn-default">
							<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>		
			
			<div class = "col-sm-3">				
				<div class="dropdown input-group" id="drop">
					<input type="text" class="form-control" value="${check.userId} 님 안녕하세요!" readonly>
					<div class="input-group-btn">
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
				<a class="btn btn-default form-control left-menu-a" href="/allways/userPage?uno=${check.uno}">
				<img alt="프로필" src="/allways/resources/images/default_profile_img.jpg" class="img-circle">
				</a>
			</div>
			<div class="left-menu">
				<a class="btn btn-default form-control left-menu-a" id ="allwaiserSearchForm" >Allwaiser 찾기</a>
			</div>
			<div class="left-menu">
				<a class="btn btn-default form-control left-menu-a" href="">날씨</a>
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
			
			<form class="form-inline">

				<input id="allwaysName" class="form-control mr-sm-2" type="text" placeholder="친구 이름">
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
				<br />
				<input class="form-control" type="password"
				name="userPwd" placeholder="비밀번호" required /> <br /> <input
				class="form-control" type="password" name="userPwds"
				placeholder="비밀번호 확인" required />
				<br />
				<button type="button" class="btn btn-danger"
				data-dismiss="modal" style="margin-left: 435px">취소</button>
				<button type="button" class="btn btn-danger"
				data-dismiss="modal" style="margin-left: 15px"
				data-toggle="modal" data-target="#update">확인</button>
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
				<br />
				<input class="form-control" type="password"
				name="userPwd" placeholder="비밀번호" required /> <br />
				<input class="form-control" type="password" name="userPwds"
				placeholder="비밀번호 확인" required /> <br />
				<button type="button" class="btn btn-danger"
				data-dismiss="modal" style="margin-left: 435px">취소</button>
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
<!-- 게시믈 상세 페이지 -->
<div class="modal fade" id="board-detail" role="dialog">
	<div class="modal-dialog board-dialog" >
		<div class="modal-content">
			
			<div class="row">
					<div class="col-xs-7">
						<div id="boardCarousel" class="carousel slide"> 

							<ol class="carousel-indicators" id = "carouselOl">
							</ol>
	
							<div class="carousel-inner" id = "carouselDiv">
							</div>
 
						</div>
					</div>
					
					<div class="col-xs-5">
						
						<div class="modal-header">
							<div>게시물 상세 페이지</div>
						</div>
						
						<div class="boardItemHead">

						<img id = "writer-img" src="/allways/resources/images/default_profile_img.jpg"
						style="border-radius: 30px; float: left; padding: 8px"
						onclick="location.href='/allways'">
						
						<div style="display: inline-block;">
						<a href = "/allways" id="writer-userId"></a><br />
						<span style="font-size: x-small; color: gray;" id="writer-regDate"></span>
						</div>

						<div class="dropdown" style="float: right;">
	  	 				<span class="glyphicon glyphicon-align-justify dropdown-toggle btn" id="menu1" data-toggle="dropdown"></span>
	
		  				  	<ul class="dropdown-menu" role="menu" aria-labelledby="menu1" style="right: 0; left: auto;">
			   			 		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">북마크</a></li>
			     			 	<li role="presentation" id="modalBoardUpdate"><a role="menuitem" tabindex="-1" href="#">수정</a></li>
			     			 	<li role="presentation" class="divider"></li>
			     	 			<li role="presentation" id="modalBoardDelete"><a role="menuitem" tabindex="-1"  id="{{boardDeleteBtn}}" class="boardDeleteBtn">삭제</a></li>
			    			</ul>
						</div>

						</div> <!-- BoardItemHead -->
						
						<div>	
	    					<p id="writer-content"></p>
						</div>
						
						<div class="container-fluid boardTail">
							<div class="row">
							<div class="col-xs-6" style="text-align: center;" >
							<a id="{{bookMark}}" class = "btn" >북마크</a>
							</div>
							<div class="col-xs-6 " style="text-align: center;" >
							<a data-bno="{{bno}}" class="reply btn" >댓글</a>
							</div>
							</div>
						</div>
						
						<div id="replyInsertForm" class="clearfix">
							<div class="replyProfileImg">
								<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
								class = "img-circle"
								onclick="location.href='/allways'" />
							</div>

							<div class="input-group replyInsertContent">
								<textarea id="replyTextModal" class="autosize form-control" rows="1" placeholder="내용 입력" style="resize: none; margin: 8px; width = 100%"></textarea>
		
								<div class="input-group-btn">
								<button id= "replyInsertModal" data-bno="" class="replyInsertBtn btn btn-default ">
								<i class="glyphicon glyphicon-edit"></i>
								</button>
								</div>
							</div>	
						</div>
						
						<div id= "modalReplyArea" class= "replyArea">
						
						</div>
						
					</div>
				</div>
			
			
		</div>
	</div>
</div>					

	
<footer class="container-fluid text-center">
	<p>Footer Text</p>
</footer>


<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>

<script  id="boardInsert" type="text/x-handlebars-template">

<div class = "boardInsertForm">
	<div class = "boardInsertTitle">게시물 작성하기</div>

	<div class="clearfix boardHead">
		<img id= "InsertprofileImg" src="/allways/resources/images/default_profile_img.jpg"
			class = "img-circle"
			onclick="location.href='/allways'">
		<textarea id="boardInsertcontent" class="autosize" placeholder="내용 입력"></textarea>
	</div>


	<div id="fileList">
	</div>

<div class="boardTail">

<form id="uploadForm" method="post" enctype="multipart/form-data">
	<label class = "addImg" for="files">사진</label>
	
	<input id="files" type="file" class="files" style="display: none" />	

	<span id="boardUploadBtn" class = "btn btn-default" >올리기</span>			

	<select id="privacyBounds">
		<option value="0">전체 공개</option>
		<option value="1">친구 공개</option>
		<option value="2">나만 보기</option>

	</select>	

</form>
</div>
	
</div>

</script>

<script id="boardItem" type="text/x-handlebars-template">
<div class="boardItem">

	<div class="boardItemHead">

		<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
			style="border-radius: 30px; float: left; padding: 8px"
			onclick="location.href='/allways'">
		<div style="display: inline-block;">
			<a href = "/allways">{{userId}}</a><br />
			<span style="font-size: x-small; color: gray;">{{regDate}}</span>
		</div>

	
		<div class="dropdown" style="float: right;">
  	 	<span class="glyphicon glyphicon-align-justify dropdown-toggle btn" type="button" id="menu1" data-toggle="dropdown"></span>

  	  	<ul class="dropdown-menu" role="menu" aria-labelledby="menu1" style="right: 0; left: auto;">
    		<li role="presentation"><a role="menuitem" tabindex="-1" href="#">북마크</a></li>
     	 	<li role="presentation" id="{{boardUpdate}}"><a role="menuitem" tabindex="-1" href="#">수정</a></li>
     	 	<li role="presentation" class="divider"></li>
     	 	<li role="presentation" id="{{boardDelete}}"><a role="menuitem" tabindex="-1"  id="{{boardDeleteBtn}}" class="boardDeleteBtn">삭제</a></li>
    	</ul>
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
			<a id="{{bookMark}}" class = "btn" >북마크</a>
		</div>
		<div class="col-xs-6 " style="text-align: center;" >
			<a data-bno="{{bno}}" class="reply btn" >댓글</a>
		</div>
	</div>

</div>


</div>

<div id= "{{replyArea}}" class= "replyArea">
</div>


</script>

<script id="replyInsert" type="text/x-handlebars-template">

<div id="replyInsertForm" class="clearfix">
	<div class="replyProfileImg">
	<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
		class = "img-circle"
		onclick="location.href='/allways'" />
	</div>

	<div class="input-group replyInsertContent">
		<textarea id="{{replyText}}" class="autosize form-control" rows="1" placeholder="내용 입력" style="resize: none; margin: 8px; width = 100%"></textarea>

		<div class="input-group-btn">
			<button id= {{replyInsertBtn}} class="replyInsertBtn btn btn-default ">
			<i class="glyphicon glyphicon-edit"></i>
			</button>
		</div>
	</div>	
</div>
	
</script>

<script id="replyItem" type="text/x-handlebars-template">

<div class= "replyItem clearfix">	
	<div class="replyProfileImg">
	<img id = "profileImg" src="/allways/resources/images/default_profile_img.jpg"
		class = "img-circle";
		onclick="location.href='/allways'">
	</div>

	<div class="replyContent">			
		<div style="display: inline-block;">
			<a href = "/allways">{{userId}}</a>
			<span style="font-size: x-small; color: gray;">{{regDate}}</span>
			<span class = "replayUpdate" id = {{BRno}}>
			<span style="font-size: x-small" class="btn replyUpdate">수정</span>
			<span style="font-size: x-small">|</span>
			<span style="font-size: x-small" data-rno ="{{rno}}" data-bno ="{{bno}}" class="btn replyDelete" >삭제</span>
			</span>
		</div>
	<textarea id="{{replyText}}" class="autosize form-control" rows="1" readonly style="resize: none; margin-right: 8px"">{{replyContent}}</textarea>
	</div>
</div>

</script>

<script id="search-condition-template" type="text/x-handlebars-template" >
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
		


<script>

$(document).ready(function(){

	var fileBuffer = [];/*파일 리스트*/
	
	var boardInsertSource = $('#boardInsert').html();
	var boardInsertTemplate = Handlebars.compile(boardInsertSource);

	function drowBoardInsert(){
		var boardInsertForm = boardInsertTemplate();
		$('#boardMake').empty();
		$('#boardMake').append(boardInsertForm);
	};

	drowBoardInsert();

	var boardItemSource = $('#boardItem').html();
	
	var boardItemTem = Handlebars.compile(boardItemSource);

	var page = 0;

	function drowBoardItems(){
			
		$.getJSON('/allways/board/selectBoard/'+page, function(data){
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
					imageArea: this.bno+"imgArea",
					bookMark:this.bno+"-bookMark",
					bno: this.bno,
					replyArea: this.bno+"replyArea",
					boardDeleteBtn: this.bno+"-boardDeleteBtn",
					boardUpdate: this.bno+"boardUpdate",
					boardDelete: this.bno+"boardDelete"
				};
				
				var boardItem = boardItemTem(content);
				$('#boards').append(boardItem);
				
				var divList = "";
				
				if(this.photo){
					var photoList = this.photo.split(',');
					
					for(i = 0; i < photoList.length; i++){
						if(i<3){
						divList += '<div class="boardImg">'	
								+'<img src="/allways'+photoList[i]+'" style="width: 100%">'
								+'</div>';
						}else if(photoList.length > 3){
							console.log(photoList.length);
							divList += '<div class="boardImg clearfix ">'	
								+'<span>'+(photoList.length-3)+'+'+'<span>'
								+'</div>';
							break;
						}
							
						
					}
				}
				
				$('#'+this.bno+'imgArea').append(divList);
				
				// 게시물 삭제 관련
				if(this.userId != '${check.userId}'){
					$('#'+this.bno+'boardUpdate').hide();
					$('#'+this.bno+'boardDelete').hide();
				}
				
									
			});
			
		});
			
	
	};

	$('#boards').empty();
	drowBoardItems();
	
	$(window).scroll(function() { // 스크롤 이벤트가 발생할 때마다 인식
		if ( $(window).scrollTop() == $(document).height() - $(window).height() ) { // 스크롤이 끝에 닿는걸 인식
			console.log("스크롤 인식");
			page++;
			
	        drowBoardItems();

	        var height = $(document).scrollTop();
			$('html, body').animate({scrollTop : height+400}, 600);
			}
	});//end of 무한스크롤
	
	//boardInsert
	$(document).on("click",'#boardUploadBtn',function() {
		
		var content = $("#boardInsertcontent").val();
		var privacyBounds = $("#privacyBounds").val();
		
		boardUpload(content, privacyBounds);
	
	});
	
	$(document).on("click",'.boardDeleteBtn',function(event){

		var bno = this.id.split('-')[0];	

		console.log(bno);
		
 		$.ajax({
			type: 'delete',
			url: '/allways/board/' + bno,
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'delete'
			},
			success: function(result) {
				alert('보드 삭제 결과: ' + result);
				endBoardInsert();
			}
		});
 	
	});
	
	function endBoardInsert(){
		fileBuffer = [];
		page = 0;
		drowBoardInsert();
		$('#boards').empty();
		drowBoardItems();
	};
	
//////////////////////////////////////////////////////////////////////////////

	var replyInsertSource = $('#replyInsert').html();
	var replyInsertTemplate = Handlebars.compile(replyInsertSource);
	
	var replyItemSource = $('#replyItem').html();
	var replyItemTemplate = Handlebars.compile(replyItemSource);
	
function drowReply(event, bno){
	
	if(bno == undefined){	
		bno = $(this).data('bno');
	}
		
	var content = {
		replyText: bno + "-replyText",
		replyInsertBtn: bno + "-replyInsertBtn"
	}
	
	var replyInsert = replyInsertTemplate(content);
		
	$('#'+bno+'replyArea').empty(); 
	
	$('#'+bno+'replyArea').append(replyInsert);

	$.getJSON('/allways/replies/all/' + bno, function(data) {
		
		$(data).each(function() {
			var date = new Date(this.regDate);
			var dateString = date.toLocaleDateString()
				
			var content = {
				rno: this.rno,
				bno: bno,
				replyContent: this.reply_content,
				userId: this.userId,
				regDate: dateString,
				BRno : bno+'-'+this.rno+'-no'
			};
			var replyItem = replyItemTemplate(content);
			$('#'+bno+'replyArea').append(replyItem);
			
			if(this.userId == '${check.userId}'){
				$('#'+bno+'-'+this.rno+'-no').show();
			}else{
				$('#'+bno+'-'+this.rno+'-no').hide();
			}
		});
	 
	});
}

$(document).on("click", '#replyInsertBtn', function(event){
	
});

	$(document).on("click",'.reply', drowReply);	
		
	$(document).on("click",'.replyInsertBtn',function(event){
		var bno = (this.id).split('-')[0];
		var content = $('#'+bno+'-replyText').val();
		
		if(bno == 'replyInsertModal'){
			return;
		}
		
		$.ajax({
			type: 'post',
			url: '/allways/replies',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'bno': bno,
				'reply_content': content,
				
			}),
			success: function(result) {
				alert('댓글 추가 결과: ' + result +'bno :'+bno);
				drowReply({}, bno);
			}
		});
	
	});
		
	$(document).on("click",'.replyDelete',function(event){

		var rno = $(this).data('rno');
		var bno = $(this).data('bno');
		
 	 	$.ajax({
			type: 'delete',
			url: '/allways/replies/' + rno,
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'delete'
			},
			success: function(result) {
				alert('댓글 삭제 결과: ' + result);
				if( $('body').attr('class') == 'modal-open'){
					drowReplyModal(bno);					
				}else{
					drowReply({}, bno);					
				}
			}
		});
 	 
	});

//////////////////////////////////////////////////////////////////////////////

	$(document).on('change', '.files', function() {
		const target = document.getElementById('uploadForm');
		
		console.log(target);
		
		Array.prototype.push.apply(fileBuffer, target[0].files);
		var html = '';
			
		$.each(fileBuffer, function(index, file) {
			const fileName = file.name;

			html += '<div class="file" style="display: inline-block">';
			html += '<img width="150px" height="150px"  src="'+ URL.createObjectURL(file)+ '">'
			html += '</br><span id="removeImg" style="float: right" > 취소 X </span>';
			html += '</div>';
			const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			if (fileEx != "jpg"	&& fileEx != "png" && fileEx != "gif" && fileEx != "bmp") {
					alert("파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
					resetFile();
					return false;
			}

			$('#fileList').html(html);
		});

	});

	$(document).on('click', '#removeImg', function() {
				
		const fileIndex = $(this).parent().index();
		fileBuffer.splice(fileIndex, 1);
		console.log(fileIndex);
		console.log($(this).parent());
		$('#fileList > div:eq(' + fileIndex + ')').remove();

		console.log(fileBuffer);
	});
	
//////////////////////////////////////////////////////////////////////////////

	// modal 창 정보
	$(document).on('click', '.imageArea', function(){
			var bno = $(this).data('bno');
			console.log(bno);
			$('#replyInsertModal').attr("data-bno", bno);
			
			$.getJSON('/allways/board/selectBoard/detail/' + bno, function(data){
				
				$('#carouselOl').empty();
				$('#carouselDiv').empty();
				$('#boardCarousel > #prev').remove();
				$('#boardCarousel > #next').remove();

				
				if(data.userId != '${check.userId}'){
					$('#modalBoardUpdate').hide();
					$('#modalBoardDelete').hide();
				}
				
				if(data.photo){
					var photoList = data.photo.split(',');
					
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
							
							
						$('#carouselOl').append(loList);
						$('#carouselDiv').append(divList);
					};
					
					
					btn ='<a id= "prev" class="left carousel-control" href="#boardCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> '
					+'<a id= "next" class="right carousel-control" href="#boardCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>'
					
					$('#boardCarousel').append(btn);
					
				};
	
				
				var date = new Date(data.regDate);
				var dateString = date.toLocaleDateString();
				//$('#writer-img').attr("","");
				$('#writer-userId').empty();
				$('#writer-regDate').empty();
				$('#writer-content').empty();

				$('#writer-userId').append(data.userId);
				$('#writer-regDate').append(dateString);
				$('#writer-content').append(data.content);
				
				drowReplyModal(bno);
				
				$('#board-detail').modal('show');
			});
			
			
			
	});
	
	$(document).on("click",'#replyInsertModal',function(event){
		var bno = $(this).data('bno');

		var content = $('#replyTextModal').val();
			
		$.ajax({
			type: 'post',
			url: '/allways/replies',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'bno': bno,
				'reply_content': content,
				
			}),
			success: function(result) {
				alert('댓글 추가 결과: ' + result +'bno :'+bno);
				drowReplyModal(bno);
			}
		});
	
	});
	
	function drowReplyModal(bno){
			
		$('#modalReplyArea').empty(); 
		
		$.getJSON('/allways/replies/all/' + bno, function(data) {
			
			$(data).each(function() {
				var date = new Date(this.regDate);
				var dateString = date.toLocaleDateString()
					
				var content = {
					rno: this.rno,
					bno: bno,
					replyContent: this.reply_content,
					userId: this.userId,
					regDate: dateString,
					BRno : bno+'-'+this.rno+'-no'
				};
				
				var replyItem = replyItemTemplate(content);
				$('#modalReplyArea').append(replyItem);
				
				if(this.userId == '${check.userId}'){
					$('#'+bno+'-'+this.rno+'-no').show();
				}else{
					$('#'+bno+'-'+this.rno+'-no').hide();
				}
			});
		 
		});
	}
	
//////////////////////////////////////////////////////////////////////////////
	
	function boardUpload(content, privacyBounds) {
		
		var form = new FormData();

		for (i = 0; i < fileBuffer.length; i++) {
			form.append("uploadfile", fileBuffer[i]);
			console.log(form.length);
		};
			
		form.append("content", content);
		form.append("privacy_bounds", privacyBounds);
		
		var url;
		
		$.ajax({
			type : 'post',
			url : '/allways/image/upload',
			data : form,
			processData : false,
			contentType : false,
			success : function(data) {
				console.log(data + "경로에 파일 업로드하였습니다.");
				boardAjax(content, privacyBounds, data);
			},
			error : function(error) {
				alert("파일 업로드에 실패하였습니다.");
				console.log(error);
				console.log(error.status);
			}
		});
			
	};

	function boardAjax(content, privacyBounds, data) {
		
		console.log(data);
		$.ajax({
			type: 'post',
			url: '/allways/board/insert',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'post'
			},
			data: JSON.stringify({
				'content': content,
				'privacy_bounds': privacyBounds,
				'photo': data.toString()
			}),
			success: function(result) {
				endBoardInsert();
			}
		});
	}
	
	$("textarea.autosize").on('keydown keyup', function () {
		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});

	
});

</script>

<script>
$(document).ready(function(){
	
	var source = $('#search-condition-template').html();
	var template = Handlebars.compile(source);

	function drowSearchAllwaiserCondition(){
		var templateItem = template();
		$('#searchForm').empty();
		$('#searchForm').append(templateItem);
	};
	
	$(document).on("click", '#allwaiserSearchForm', function () {
		$('#boardMake').empty();
		$('#boards').empty();
		drowSearchAllwaiserCondition();	
	});
		
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
	
	
/* 	$('#search').click(function() {
				
		getSearch();
		
	});
 */
			
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


<!-- <script type="text/javascript" src="/allways/resources/js/board.js"></script>
 -->
</body>

</html>















