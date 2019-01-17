$(document).ready(function(){
	
	var fileBuffer = [];/*파일 리스트*/
	var page = 0;
	
	drowBoardInsert();
	
	$('#boards').empty();
	
	drowBoardItems();
	
	var boardInsertSource = $('#boardInsert').html();
	var boardInsertTemplate = Handlebars.compile(boardInsertSource);

	function drowBoardInsert(){
		var boardInsertForm = boardInsertTemplate();
		$('#boardMake').empty();
		$('#boardMake').append(boardInsertForm);
	};

	var boardItemSource = $('#boardItem').html();
	
	var boardItemTem = Handlebars.compile(boardItemSource);

	

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

///////////////////////////////////////////////////////////////
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
///////////////////////////////////////////////////////////////
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
	
});



