<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<form id="uploadForm" method="post" enctype="multipart/form-data">
<label for="files">파일 올리기</label>
<input id="files" type="file" style="display:none"/>
</form>
    
<button id="fileUploadBtn">올리기</button>

<div class = "fileList">

</div>



</body>

<script>
	
var fileBuffer = [];/*파일 리스트*/

$('#files').change(function(){
        
	const target = document.getElementById('uploadForm');
	
    Array.prototype.push.apply(fileBuffer, target[0].files);
    var html = '';
    
    console.log(target[0].files);
    console.log(fileBuffer);
    
    $.each(fileBuffer, function(index, file){
        const fileName = file.name;
        html += '<div class="file">';
        html += '<img width="200px" height="200px"  src="'+URL.createObjectURL(file)+'">'
        html += '<span>'+fileName+'</span>';
        html += '<a href="#" id="removeImg">╳</a>';
        html += '</div>';
        
        const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
        if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
            alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
            resetFile();
            return false;
        }
        
        $('.fileList').html(html);
    });
      
});

$(document).on('click', '#removeImg', function(){
    const fileIndex = $(this).parent().index();
    fileBuffer.splice(fileIndex,1);
    form.splice(fileIndex,1);
    $('.fileList > div:eq('+fileIndex+')').remove();
    
    console.log(fileBuffer);
});

$('#fileUploadBtn').click(function(){

	var form = new FormData();

	for(i = 0; i<fileBuffer.length; i++){
		form.append("uploadfile", fileBuffer[i]);
		console.log(form.length);
	};
	 
	 $.ajax({
         type : 'post',
         url : '/allways/image/upload',
         data : form,
         processData : false,
         contentType : false,
         success : function(html) {
             alert("파일 업로드하였습니다.");
         },
         error : function(error) {
             alert("파일 업로드에 실패하였습니다.");
             console.log(error);
             console.log(error.status);
         }
     });
 
});



</script>

</html>