<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>


	<textarea rows="10" cols="50"></textarea>
	<form id="uploadForm" method="post" enctype="multipart/form-data">
		<label for="files">사진</label> <input id="files" type="file"
			style="display: none" />
	</form>

	<div class="fileList"></div>

	<button id="fileUploadBtn">올리기</button>



</body>

<script>
var fileBuffer = [];/*파일 리스트*/

$('#files').change( function() {
	const target = document.getElementById('uploadForm');

	Array.prototype.push.apply(fileBuffer, target[0].files);
	var html = '';

	console.log(target[0].files);
	console.log(fileBuffer);

	$.each(fileBuffer, function(index, file) {
		const fileName = file.name;

		html += '<div class="file">';
		html += '<img width="200px" height="200px"  src="'+ URL.createObjectURL(file)+ '">'
		html += '<span>' + fileName+ '</span>';
		html += '<a href="#" id="removeImg">╳</a>';
		html += '</div>';
		const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
		if (fileEx != "jpg"	&& fileEx != "png" && fileEx != "gif" && fileEx != "bmp") {
					alert("파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
					resetFile();
					return false;
		}

		$('.fileList').html(html);
	});

});

	$(document).on('click', '#removeImg', function() {
		const fileIndex = $(this).parent().index();
		fileBuffer.splice(fileIndex, 1);
		form.splice(fileIndex, 1);
		$('.fileList > div:eq(' + fileIndex + ')').remove();

		console.log(fileBuffer);
	});

	$('#fileUploadBtn').click(function() {

		var form = new FormData();

		for (i = 0; i < fileBuffer.length; i++) {
			form.append("uploadfile", fileBuffer[i]);
			console.log(form.length);
		};
		

		$.ajax({
			type : 'post',
			url : '/allways/image/upload',
			data : form,
			processData : false,
			contentType : false,
			success : function(data) {
				console.log(data + "경로에 파일 업로드하였습니다.");

			},
			error : function(error) {
				alert("파일 업로드에 실패하였습니다.");
				console.log(error);
				console.log(error.status);
			}
		});

		function boardInsert(data) {
			
		}

	});
</script>

</html>