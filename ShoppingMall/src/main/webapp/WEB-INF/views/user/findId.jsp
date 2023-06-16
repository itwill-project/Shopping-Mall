<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>아이디 찾기</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
</head>
<body>
	<form id="find-id">
		<input type="text" id="name" name="name" placeholder="이름을 입력해주세요." />
		<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." />
		<button type="button" id="findIdBtn" class="btn btn-outline-primary">아이디 찾기</button>
		<a href="/joo/user/login" class="btn btn-outline-danger">취소</a>
	</form>
	
	<div class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>Modal body text goes here.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		$(function() {
			$('#findIdBtn').click(function() {
				const name = $('#name').val();
				const email = $('#email').val();
				
				$.ajax({
					type: 'POST',
					url: '/joo/user/findId',
					data: {"name": name, "email": email},
					success: function(res) {
						if(res.trim().length > 0) {
							alert('아이디: ' + res);
							window.location.href='/joo/user/login';
						}
						else {
							alert('해당 정보로 가입된 사용자가 없습니다.');
							$('#name').val('');
							$('#email').val('');
						}
					}, error: function(error) {
						console.log(error);
					}
				});
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>