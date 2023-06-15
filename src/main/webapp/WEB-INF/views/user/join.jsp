<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원가입 페이지</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
	<style>
		input[type=button] {
			width: 120px;
		}
	</style>
</head>
<body>
	<div style="width: 60%; margin: 0 auto;">
		<h1>회원가입</h1>
		<hr/>
		<form id="join-form">
		  <div class="row mb-3">
		    <label for="loginId" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="loginId" name="loginId" autofocus>
		    </div>
		    <div class="col-sm-2 text-center">
		    	<input type="button" id="id-validate-btn" class="btn btn-outline-primary" value="중복 확인">
		    </div>
		    <input type="hidden" id="is-id-validated" value="no" />
		  </div>
		  <div class="row mb-3">
		    <label for="name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="name" name="name">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="phone" name="phone">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="email" class="col-sm-2 col-form-label">이메일</label>
		    <div class="col-sm-8">
		      <input type="email" class="form-control" id="email" name="email">
		    </div>
		    <div class="col-sm-2 text-center">
		    	<input type="button" id="generate-num-btn" class="btn btn-outline-primary" value="인증번호 받기">
		    </div>
		  </div>
		  <div class="row mb-3">
		  	<input type="hidden" id="email-verification-code" value="" />
		    <label for="emailConfirm" class="col-sm-2 col-form-label">이메일 인증</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="emailConfirm"  />
		    </div>
		    <input type="hidden" id="is-email-validated" value="no" />
		    <div class="col-sm-2 text-center">
		    	<input type="button" id="num-check-btn" class="btn btn-outline-primary" value="인증번호 확인">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="password" name="password">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="passwordConfirm" class="col-sm-2 col-form-label">비밀번호 확인</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="passwordConfirm">
		    </div>
		  </div>
		  <span id="guide" style="color:#999;display:none"></span>
		  <div class="row mb-3">
		    <label for="postcode" class="col-sm-2 col-form-label">주소</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="postcode" name="postcode">
		    </div>
		    <div class="col-sm-2 text-center">
		    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary">
		    </div>
		  </div>
		   <div class="row mb-3">
		    <label for="street" class="col-sm-2 col-form-label"></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="street" name="street">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="detailAddress" class="col-sm-2 col-form-label"></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="detailAddress" name="detailAddress">
		    </div>
		  </div>
		  
		  <button type="submit" id="joinBtn" class="btn btn-outline-success">가입</button>
		  <a href="/joo" class="btn btn-outline-danger">취소</a>
		</form>	
	</div>
	
	<script src="../static/js/userPage/user-create.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			const emailConfirm = $('#emailConfirm');
			emailConfirm.attr('disabled', true);
		});
	</script>
	<script>
		$(function() {
			$('#id-validate-btn').click(function() {
				const loginId = $('#loginId').val();
				const isIdValidated = $('#is-id-validated');
				if(loginId.trim().length === 0) {
					alert('아이디를 입력해주세요.');
					return;
				}
				
				$.ajax({
					type: 'GET',
					url: "/joo/validate/loginId",
					data: {"loginId": loginId},
					success: function(res) {
						if(res === 1) {
							alert('사용 가능한 아이디입니다.');
							isIdValidated.val('yes');
						} else {
							alert('이미 사용중인 아이디입니다.');
						}
					}, error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
	<script>
    	const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
		$(function() {
			$('#generate-num-btn').click(function(){
				sendEmail();
			});
		});
		
		function sendEmail() {
			const email = $('#email').val();
			const code = $('#email-verification-code');
			
			const emailConfirm = $('#emailConfirm');
			
			if(!email.match(mailformat)) {
				alert('이메일 형식에 맞게 입력해주세요.');
				return;
			}
			
			$.ajax({
				type: 'GET',
				url: '/joo/validate/emailCheck',
				data: {
					'email': email
				}, success: function(res) {
					if(res === 0) {
						alert('이미 사용중인 이메일 입니다.');
						$('#email').val('');
					} else {
						$.ajax({
							type: 'POST',
							url: '/joo/validate/sendCode',
							data: {
								'email': email
							}, success: function(res) {
								code.val(res);
								emailConfirm.attr("disabled", false);
								emailConfirm.val('');
								alert('인증번호가 전송되었습니다.');
							}, error: function(error) {
								console.log(error);
							}
			            });
					}
				}, error: function(error) {
					console.log(error);
				}
			});
		}
	</script>
	<script>
		$(function() {
			$('#num-check-btn').click(function(){
				const code = $('#email-verification-code').val();
				const emailConfirm = $('#emailConfirm');
				
				if(code === "") {
					alert('인증번호 받기를 클릭해주세요.');
					return;
				}
				
				if(code !== emailConfirm.val()) {
					alert('인증번호가 일치하지 않습니다.');
					emailConfirm.val('');
					return;
				}
				
				alert('인증번호가 일치합니다.');
				$('#is-email-validated').val('yes');
				emailConfirm.attr("disabled", true);
			});
		});
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("street").value = roadAddr;
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>