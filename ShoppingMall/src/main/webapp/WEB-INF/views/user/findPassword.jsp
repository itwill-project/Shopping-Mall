<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	
	<input type="text" id="name" name="name" placeholder="이름 입력" />
	<input type="text" id="email" name="email" placeholder="이메일 입력">
	<button type="button" id="findPwd">비밀번호 찾기</button>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		$(function() {
			$('#findPwd').click(function() {
				const name = $('#name').val();
				const email = $('#email').val();
				$.ajax({
					url: '/joo/user/findPassword',
					type: 'POST',
					data: {"name": name, "email": email},
					success: function(res) {
						if(res === 0) {
							alert('해당 정보로 가입된 사용자가 없습니다.');
						} else {
							alert('입력된 이메일로 임시 비밀번호가 발급되었습니다.');
							window.location.href='/joo/user/login';
						}
					}, error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
</body>
</html>