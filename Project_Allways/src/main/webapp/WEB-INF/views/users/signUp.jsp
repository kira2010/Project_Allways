<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>회원가입</title>
<script type="text/javascript">
//<![CDATA[
	function check() {
		var form = document.getElementById("signUpForm");
		var year = $("select[name='birthY']").val();
		var month = $("select[name='birthM']").val();
		var day = $("select[name='birthD']").val();
		
		$("input[name='birthDay']").val(year + month + day);
		console.log($("input[name='birthDay']").val());
		// TODO : 유효성 검사
		
		return true;
		
	}
//]]>
</script>
<script>
$(document).ready(function() {	

	$("#userId").focusout(function() {
		var registId = $('#userId').val();
		$.ajax({
			url : "../users/checkId",
			type : "POST",
			data : {
				userId : registId
			},
			success : function(result) {
				if (result == 'existed') {
					$("#id_check").html("중복된 ID가 있습니다.");
					$("#id_check").css('color', 'red');
					$("#joinBtn").attr("disabled", "disabled");
				} else {
					$("#id_check").html("사용가능한 ID 입니다.");
					$("#id_check").css('color', 'green');
					$("#joinBtn").removeAttr("disabled");
				}
			},
		});
	});
	
	$('#confirm').focusout(function(){
		var first = $('#userPwd').val();
		var second = $('#confirm').val();
		if($("#userPwd").val().length < 8){	
			$("#pwCheck").html("비밀번호는 8자 이상으로 설정해야 합니다.")
			$("#pwCheck").css('color', 'red');
			$("#userPwd").val('');
			$("#userPwd").focus();
		} else if(first != '' && second != '' && first !== second){
			$("#pw_check").html("비밀번호가 일치하지 않습니다.");
			$("#pw_check").css('color', 'red');
			$('#confirm').val('');
			$('#confirm').focus();
		} else {
			$('#pwCheck').html("");
			$('#pw_check').html("확인 되었습니다.");
			$("#pw_check").css('color', 'green');
		}
	});
	
	$("#userEmail").focusout(function() {
		var registEmail = $('#userEmail').val();
		$.ajax({
			url : "../users/checkEmail",
			type : "POST",
			data : {
				userEmail : registEmail
			},
			success : function(result) {
				if (result == 'existed') {
					$("#email_check").html("중복된 EMAIL이 있습니다");
					$("#email_check").css('color', 'red');
					$("#joinBtn").attr("disabled", "disabled");
				} else {
					$("#email_check").html("사용 가능한 EMAIL 입니다.");
					$("#email_check").css('color', 'green');
					$("#joinBtn").removeAttr("disabled");
				}
			},
		});
	});
})
</script>
<style>
.field-container {
    display: inline-block;
}
body {
	background-color: #f1f1f1;
}

.signUp {
	font-weight: bolder;
	font-famliy : arial, helvetica, sans-serif;
	text-align: left;
	margin-top: 10%;
	margin-bottom: 2%;
}
</style>

</head>
<body>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3><a href="/allways"><img src="/allways/resources/images/login.png" /></a></h3>
				<h2 class="signUp">회원 가입</h2>
			</div>
			<div>
				<form id="signUpForm" action="signUp" method="post" onsubmit="return check()" >
					<p> 
						<input class="w3-input" type="text" id="userId" name="userId" placeholder="아이디" required /> 
						<div id="id_check"></div>
					</p>
					<p>
						<input class="w3-input" id="userPwd" name="userPwd" type="password" placeholder="비밀번호" required />
						<div id="pwCheck"></div>
					</p>
					<p>
						<input class="w3-input" id="confirm" name="confirm" type="password" placeholder="비밀번호 확인" required />
						<div id="pw_check"></div>
					</p>
					<p>
						<input type="text" id="userName" name="userName" class="w3-input" placeholder="이름" required />
					</p>
					<p>
						<input type="email" id="userEmail" name="userEmail" class="w3-input" placeholder="이메일" required />
						<div id="email_check"></div>
					</p>
					
					<p>
						<label>생년월일</label>
						<div class="field-container" style="margin-right: 4px; margin-top: 5px;" >
							<select name="birthY" class="dobYear"></select>
						</div>
						<div class="field-container month" style="margin-right: 4px;">
							<select name="birthM" class="dobMonth">
								<option value="">Month</option>
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</div>
						<div class="field-container">
							<select name="birthD" class="dobDay">
                    			<option value="">Day</option>
							</select>
						</div> 
			
				<script>
				
					var month = 1;
					var year = 2019;
					var day, seq, daysInMonth, prevDaysInMonth=-1;

					// 현재 연도에서 현재 연도로 연도 드롭 다운을 초기화. -100
					var yearOption = '<option value="">Year</option>';
					for(i=year; i >= year-100; i--) {
						yearOption = yearOption + '<option value='+i+'>'+i+'</option>';
					}
					$('.dobYear').append(yearOption);

					// 월 / 연도 드롭 다운에서 "dayInAMonth"함수를 호출하여 일 수를 계산하고 필요할 경우 다시 생성.
					$('.dobMonth').change(function(){
						month = $(this).val();
						daysInAMonth();
					});
					$('.dobYear').change(function(){
						year = $(this).val();
						daysInAMonth();
					});

					function daysInAMonth() {
					// 주어진 월과 일의 일수를 계산.
			    		daysInMonth = new Date(year,month,1,-1).getDate();
			    	// 일수가 이전 드롭 다운 (일수) 값과 같지 않으면 Days DropDown을 다시 채움.
					if(daysInMonth != prevDaysInMonth) {
			        	prevDaysInMonth = daysInMonth;
						day = '<option value="">Day</option>';
						$('.dobDay').html('');
					for(i=1; i<= daysInMonth; i++) {
						day = day + '<option value='+i+'>'+(i < 10 ? "0"+i : i) +'</option>';
					} // end for
						$('.dobDay').append(day);
					} // end if
				};  	// end function
				</script>
					</p>
					<p>
						<input type="text" id="graduation" name="graduation" class="w3-input" placeholder="출신학교" required />
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" onclick="check();" >가입</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
					</p>
				</form>
			</div>
		</div>
	</div>

</body>
</html>