<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원탈퇴</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
</head>
<body>
	<h1>회원탈퇴</h1>
	<p>회원 탈퇴 전 유의사항을 확인하세요.</p>
	
	<hr />
	
	<h4>회원 탈퇴 시 유의사항</h4>
	<div>
		<ul>
			<li>탈퇴하시면 현재 보유하고 계신 쿠폰과 적립 포인트는 즉시 자동 소멸하며, 다시 복구되지 않습니다.</li>
			<li>회원 탈퇴를 하시면 해당 아이디는 즉시 탈퇴 처리되며, 해당 아이디에 대한 회원 정보 및 서비스 정보는 모두 삭제됩니다.</li>
			<li>회원 탈퇴를 하시면 해당 아이디는 즉시 탈퇴 처리되며, 해당 아이디에 대한 회원 정보 및 서비스 정보는 모두 삭제됩니다.</li>
			<li>회원 탈퇴를 하시면 해당 아이디는 즉시 탈퇴 처리되며, 해당 아이디에 대한 회원 정보 및 서비스 정보는 모두 삭제됩니다.</li>
		</ul>
	</div>
	
	<div class="form-check">
  		<input class="form-check-input" type="checkbox" value="" id="checkAgree">
  		<label class="form-check-label" for="checkAgree">
    		동의
  		</label>
	</div>
	
	<a href="/joo" class="btn btn-outline-dark">취소</a>
	<button id="proceedBtn" type="button" class="btn btn-dark">탈퇴</button>
	
	<input type="hidden" id="id" value="${ user.id }" />
	
	<div class="modal fade" id="myModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="color: red;">회원탈퇴 시에는 모든 회원 정보와 포인트는 삭제되며, 복구 할 수 없습니다.</p>
	        <p>정말 탈퇴 하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="deleteBtn" type="button" class="btn btn-danger">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		$(function() {
			$('#proceedBtn').click(function() {
				const isChecked = $('#checkAgree').is(':checked');
				
				if(!isChecked) {
					alert('동의 버튼을 클릭해주세요.');
					return;
				}
				
				$('#myModal').modal('show');
			});
		});
	</script>
	<script>
		$(function() {
			$('#deleteBtn').click(function() {
				const id = $('#id').val();
				
				$.ajax({
					type: 'POST',
					url: '/joo/user/delete',
					data: {"id": id},
					success: function(res) {
						alert('회원 탈퇴 성공');
						window.location.href='/joo/user/logout';
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