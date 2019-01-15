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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

<style>
.field-container {
    display: inline-block;
}
</style>

</head>
<body>

<!-- 본문 시작 -->
<form id="signUpForm" action="signUp" method="post" >
<!-- <input type="hidden" name="birthDay" /> -->


<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3" style="margin-top: 15%; margin-left: 15%; " ><a href="/allways"><img src="/allways/resources/images/allways.png" /></a></div>
		<div class="col-sm-6" style="margin-top: 10%;">
			<table>
				<tr><td><h1>회원가입</h1></td></tr>
				<tr>
    				<td><input style="width: 200%" type="text" name="userId" placeholder="아이디" required /></td>
				</tr>
				<tr>
    				<td><input style="width: 200%; margin-top: 15px;" type="password" name="userPwd" placeholder="비밀번호" required /></td>
    			</tr>
				<tr>
    				<td><input style="width: 200%; margin-top: 15px;" type="password" name="confirm" placeholder="비밀번호 확인" required /></td>
    			</tr>
				<tr>
    				<td><input style="width: 200%; margin-top: 15px;" type="text" name="userName" placeholder="이름"  required /></td>
    			</tr>
				<tr>
					<td><input style="width: 200%; margin-top: 15px;" type="text" name="userEmail" placeholder="이메일" required /></td> 
				</tr>
				<tr>
					<td><div id="birthDay" style="margin-top: 15px;">생일</div></td>
				</tr>
				<tr>
					<td><div class="field-container" style="margin-right: 4px; margin-top: 5px;" >
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
						</div> </td>
			
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
				</tr>
				
				<tr>
					<td><input style="width: 200%; margin-top: 15px;" type="text" name="graduation" placeholder="출신 학교" required />
					</td>
				</tr>
			
    			<tr style="text-align: center; padding-bottom: 20px;">
    				<td>
    					<input style="float: left; margin-top: 10px;" type="submit" value="취소"/> 
    					<input style="margin-left: -40%; margin-top: 10px;" type="submit" value="가입" />
    					<input type="hidden" name="queryString" value="${targetUrl}" />
    				</td>
    			</tr>		
			</table>
			
			<div class="col-sm-3"></div>
			
			
		</div> <!-- end <div class="col-sm-6"> -->
		
	</div> <!-- end <div class="row"> -->
</div> <!-- end <div class="container-fluid"> -->

</form>

</body>
</html>