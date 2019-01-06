<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>jQuery(제이쿼리) 강좌와 예제모음 : 중급예제 : 이미지 파일을 업로드하기전 미리보기, 업로드전 파일정보 보기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>


<!-- 예제 시작 -->

<div style="text-align:center;">
	<!-- multiple 속성 제거하여 한번에 하나의 파일만 업로드 하도록 -->
	<input id="file1" type="file" style="width:500px;" accept="image/*" onchange="fileInfo(this)" /><br>
	<div id="img_box"></div>
</div>

<script>

	function fileInfo(f){
		var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

		var reader = new FileReader(); // FileReader 객체 사용
		reader.onload = function(rst){ // 이미지를 선택후 로딩이 완료되면 실행될 부분
			$('#img_box').html('<img src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
			// 이미지는 base64 문자열로 추가
			// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		}
		reader.readAsDataURL(file[0]); // 파일을 읽는다, 배열이기 때문에 0 으로 접근
	}

</script>

<!-- 예제 종료 -->


</body>
</html>