$(document).ready(function(){
	

$("textarea.autosize").on('keydown keyup', function () {
  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
});



$('#files').change( function() {
	const target = document.getElementById('uploadForm');

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





});

var fileBuffer = [];/*파일 리스트*/

function boardUpload(content, privacyBounds) {

	console.log(content);
	console.log(privacyBounds);
	
	var form = new FormData();

	for (i = 0; i < fileBuffer.length; i++) {
		form.append("uploadfile", fileBuffer[i]);
		console.log(form.length);
	};
		
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
			
		}
	});
}

